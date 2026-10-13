<#
.SYNOPSIS
  One-click flash: switch CH554 into its USB Bootloader, then run the
  download command stored in command.txt (WCHISPTool CLI).

.DESCRIPTION
  Flow:
    1. rebuild firmware via make (skip with -SkipBuild)
    2. auto-detect the CH554 CDC COM port (override with -Port COMx)
    3. open the port, send "download", wait for "Enter bootloader" ack
    4. poll up to WaitSec seconds until the CDC port disappears, then
       promptly run the ISP tool (CH55x bootloader waits only briefly)
    5. execute the command line read from command.txt
       (retry up to 3 times, 2 s apart)

.PARAMETER Port
  COM port of the CH554 CDC device, e.g. COM5. If empty, auto-detect.

.PARAMETER WaitSec
  Seconds to poll for the CDC port to go offline after switching to the
  bootloader (default 5).

.PARAMETER SkipBuild
  Skip the make rebuild and flash the existing binary.

.EXAMPLE
  .\flash.ps1
  .\flash.ps1 -SkipBuild
  .\flash.ps1 -Port COM5 -WaitSec 5
#>
[CmdletBinding()]
param(
    [string]$Port = "",
    [int]$WaitSec = 5,
    [switch]$SkipBuild
)

$ErrorActionPreference = 'Stop'
$root   = Split-Path -Parent $MyInvocation.MyCommand.Path
$binFile = Join-Path $root 'build\usb_device_cdc.bin'
$cmdFile = Join-Path $root 'command.txt'

function Write-Step([string]$msg) { Write-Host "==> $msg" -ForegroundColor Cyan }

# ---------- 1. build ----------
if (-not $SkipBuild) {
    Write-Step 'Build firmware (make all)'
    $sdccBin = 'C:\Users\Y5043\.eide\tools\sdcc\bin'
    $makeBin = 'C:\Users\Y5043\.eide\bin\builder\msys\bin'
    if (-not (Get-Command make -ErrorAction SilentlyContinue)) { $env:PATH = "$makeBin;$env:PATH" }
    if (-not (Get-Command sdcc -ErrorAction SilentlyContinue)) { $env:PATH = "$sdccBin;$env:PATH" }
    if (-not (Get-Command make -ErrorAction SilentlyContinue)) { throw 'make not found. Check Makefile/SDCC paths.' }
    Push-Location $root
    try {
        # -B: 强制全量重编(忽略时间戳), 确保 bin 始终反映最新源码/头文件/编译选项
        & make -B all
        if ($LASTEXITCODE -ne 0) { throw "make failed (exit $LASTEXITCODE)" }
    } finally { Pop-Location }
} else {
    Write-Step 'Skip build'
}

if (-not (Test-Path $binFile)) {
    throw "Firmware not found: $binFile. Run without -SkipBuild or fix make."
}

# ---------- 2. detect COM port ----------
function Get-CdcPorts {
    Get-CimInstance Win32_PnPEntity -ErrorAction SilentlyContinue |
        Where-Object { $_.Name -match '\(COM\d+\)' } |
        ForEach-Object {
            [pscustomobject]@{
                Name = $_.Name
                Pnp  = $_.PNPDeviceID
                Port = ([regex]::Match($_.Name, '\((COM\d+)\)')).Groups[1].Value
            }
        }
}

if ([string]::IsNullOrEmpty($Port)) {
    Write-Step 'Detect CH554 CDC COM port'
    $devs = @(Get-CdcPorts)
    $cand = $devs | Where-Object { $_.Pnp -match 'VID_1A86' -and $_.Pnp -match 'PID_5722' } | Select-Object -First 1
    if (-not $cand) { $cand = $devs | Where-Object { $_.Pnp -match 'VID_1A86' } | Select-Object -First 1 }
    if (-not $cand) {
        Write-Host 'No CH554 CDC device found. Available COM ports:' -ForegroundColor Yellow
        $devs | Format-Table Name, Pnp -AutoSize
        throw 'Cannot find the CH554 CDC COM port. Plug the device in or pass -Port COMx'
    }
    $Port = $cand.Port
    Write-Host "    -> $Port ($($cand.Name))"
} else {
    Write-Step "Use given port $Port"
}

# ---------- 3. send "download" ----------
Write-Step "Switch to bootloader via $Port"
$sp = New-Object System.IO.Ports.SerialPort $Port, 115200, 'None', 8, 'One'
try {
    $sp.ReadTimeout = 500
    $sp.Open()
    Start-Sleep -Milliseconds 200
    $sp.Write('download')
    $ack = ''
    $deadline = (Get-Date).AddSeconds(2)
    while ((Get-Date) -lt $deadline) {
        try { $ack += $sp.ReadExisting() } catch { }
        if ($ack -match 'Enter bootloader') { break }
        Start-Sleep -Milliseconds 100
    }
    if ($ack -match 'Enter bootloader') {
        Write-Host "    <- device acked: Enter bootloader"
    } else {
        Write-Host '    (no reply received, continue anyway)' -ForegroundColor Yellow
    }
} catch {
    throw "Cannot open $Port : $_`n(close any terminal/IDE holding this COM port first)"
} finally {
    # 设备收到 "download" 后立即断开 CDC 并切到 bootloader, COM 句柄已失效,
    # 此时 Close/Dispose 会抛 "指定不存在的设备", 吞掉即可
    try { if ($sp.IsOpen) { $sp.Close() } } catch { }
    try { $sp.Dispose() } catch { }
}

# ---------- 4. wait for CDC offline (device switching to bootloader) ----------
# CH55x bootloader 的 USB ISP 等待窗口很短(数秒内收不到下载命令会跳回应用),
# 所以不能等"确认 bootloader 已枚举"再动手 - 等太久会错过窗口。
# 策略: 轮询到应用 CDC(PID_5722) 从设备树消失即视为切换完成,
#       留 1.5s 短余量让 bootloader 完成 USB 枚举, 然后立即跑 WCHISPTool。
# 顺带打印在线 VID_1A86 设备, 便于排查 bootloader 的 VID/PID。
Write-Step "Wait for device to leave CDC (poll up to $WaitSec s)"
$deadline = (Get-Date).AddSeconds($WaitSec)
$cdcGone = $false
while ((Get-Date) -lt $deadline) {
    $one = @(Get-CimInstance Win32_PnPEntity -ErrorAction SilentlyContinue |
             Where-Object { $_.PNPDeviceID -match 'VID_1A86' })
    $cdcCnt = @($one | Where-Object { $_.PNPDeviceID -match 'PID_5722' }).Count
    if ($cdcCnt -eq 0) { $cdcGone = $true; break }
    Start-Sleep -Milliseconds 200
}
if ($cdcGone) {
    Write-Host '    CDC offline - device switching to bootloader'
    $other = @(Get-CimInstance Win32_PnPEntity -ErrorAction SilentlyContinue |
               Where-Object { $_.PNPDeviceID -match 'VID_1A86' -and $_.PNPDeviceID -notmatch 'PID_5722' })
    if ($other.Count) {
        $other | ForEach-Object { Write-Host "    bootloader device: $($_.PNPDeviceID)  [$($_.Name)]" -ForegroundColor Yellow }
    } else {
        Write-Host '    (VID_1A86 bootloader not visible yet)' -ForegroundColor Yellow
    }
    Start-Sleep -Milliseconds 1500          # 等 bootloader 完成 USB 枚举/驱动加载
} else {
    Write-Host "    CDC still present after $WaitSec s - switch did NOT happen!" -ForegroundColor Yellow
    Start-Sleep -Milliseconds 500
}

# ---------- 5. run download command (fail -> wait 3 s -> retry once) ----------
function Invoke-Isp([string]$cmdLine) {
    # Wrap into a temporary .cmd so quotes/arguments are parsed exactly like cmd
    $tmp = Join-Path $env:TEMP ("flash_isp_{0}.cmd" -f ([guid]::NewGuid().ToString('N')))
    $bat = "$cmdLine`r`nset RC=%ERRORLEVEL%`r`nexit /b %RC%`r`n"
    [IO.File]::WriteAllText($tmp, $bat, [Text.Encoding]::ASCII)
    try {
        Write-Host "    cmd: $cmdLine"
        # 必须经 Out-Host: 否则 cmd 的 stdout 会混入函数返回值,
        # 导致 $LASTEXITCODE 判定失效(永远非 0)
        & $env:ComSpec /d /c "`"$tmp`"" | Out-Host
        return $LASTEXITCODE
    } finally {
        Remove-Item $tmp -ErrorAction SilentlyContinue
    }
}

Write-Step 'Run download command from command.txt'
if (-not (Test-Path $cmdFile)) { throw "Command file not found: $cmdFile" }
$line = (Get-Content $cmdFile -Raw).Trim()
if (-not $line) { throw "$cmdFile is empty" }

if ($line -match '-f\s+"([^"]+)"') {
    $f = $Matches[1]
    if (-not (Test-Path $f)) { throw "Firmware file in command.txt not found: $f" }
}

# 首次失败多为 bootloader 尚在枚举/驱动未就绪, 最多重试 2 次(间隔 2 s)
$attempt = 1
$rc = Invoke-Isp $line
while ($rc -ne 0 -and $attempt -lt 3) {
    $attempt++
    Write-Host "    ISP attempt $attempt failed (exit $rc); wait 2 s and retry" -ForegroundColor Yellow
    Start-Sleep -Seconds 2
    $rc = Invoke-Isp $line
}
if ($rc -ne 0) {
    Write-Host ''
    Write-Host 'WCHISPTool could not find the CH55x bootloader device.' -ForegroundColor Red
    Write-Host 'Possibly the bootloader auto-timed-out back to the app, or USB enumeration failed.' -ForegroundColor Red
    Write-Host 'Re-run:  .\flash.bat -SkipBuild   (it re-triggers "download" from scratch)' -ForegroundColor Yellow
    throw "ISP tool failed (exit $rc)"
}

Write-Host ''
Write-Host 'Flash OK. Device should re-enumerate and run the new firmware.' -ForegroundColor Green
