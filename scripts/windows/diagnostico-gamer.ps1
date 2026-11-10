#requires -Version 5.1
<#
.SYNOPSIS
  Diagnostico nao destrutivo do Windows usado como servidor gamer.
  Evita listar usuarios, enderecos de IP e credenciais.
#>
[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
$os = Get-CimInstance Win32_OperatingSystem
$cpu = Get-CimInstance Win32_Processor | Select-Object -First 1
$sys = Get-CimInstance Win32_ComputerSystem
$gpu = @(Get-CimInstance Win32_VideoController -ErrorAction SilentlyContinue)
$drives = @(Get-PSDrive -PSProvider FileSystem | Where-Object { $_.Free -ne $null })
$ramGB = [Math]::Round(($sys.TotalPhysicalMemory / 1GB), 1)
Write-Host '=== Diagnostico PC Gamer Cloud ==='
Write-Host ('SO: ' + $os.Caption)
Write-Host ('CPU: ' + $cpu.Name + ' | threads: ' + $cpu.NumberOfLogicalProcessors)
Write-Host ('RAM: ' + $ramGB + ' GiB')
if ($gpu.Count -eq 0) { Write-Warning 'Nenhum adaptador de video detectado.' }
foreach ($device in $gpu) {
  Write-Host ('GPU/adaptador: ' + $device.Name)
  if ($device.Name -match 'Hyper-V Video|Microsoft Basic Display|Remote Display') {
    Write-Warning 'Adaptador virtual/basico; GPU e encoder gamer nao comprovados.'
  }
}
foreach ($drive in $drives) {
  Write-Host ('Disco ' + $drive.Name + ': ' + [Math]::Round($drive.Free / 1GB, 1) + ' GiB livres')
}
foreach ($app in @('sunshine','tailscale','steam')) {
  $present = if (Get-Command $app -ErrorAction SilentlyContinue) { 'encontrado no PATH' } else { 'nao encontrado no PATH (pode estar instalado)' }
  Write-Host ($app + ': ' + $present)
}
Write-Host 'Observacao: detectar placa de video nao comprova suporte a encode nem funcionamento em VM.'
