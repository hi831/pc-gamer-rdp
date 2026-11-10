#requires -Version 5.1
<#
.SYNOPSIS
  Instala as ferramentas cliente em um PC Windows fraco.
.DESCRIPTION
  Precisa de -Apply para executar instaladores. Login e pareamento sao manuais.
#>
[CmdletBinding()]
param([switch]$Apply)
$ErrorActionPreference = 'Stop'
if ($env:OS -ne 'Windows_NT') { throw 'Este script requer Windows.' }
Write-Host '=== PC Gamer Cloud | Cliente Windows ===' -ForegroundColor Cyan
$packages = @(
  @{ Id = 'MoonlightGameStreamingProject.Moonlight'; Name = 'Moonlight (cliente de streaming)' },
  @{ Id = 'Tailscale.Tailscale'; Name = 'Tailscale (rede privada)' }
)
$packages | ForEach-Object { Write-Host (' - ' + $_.Name + ' [' + $_.Id + ']') }
if (-not $Apply) {
  Write-Host 'Modo previa: nada instalado. Use -Apply para prosseguir.' -ForegroundColor Yellow
  exit 0
}
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
  throw 'Winget nao encontrado. Use https://moonlight-stream.org/ e https://tailscale.com/docs/install/windows para instalar manualmente.'
}
foreach ($package in $packages) {
  Write-Host ('Instalando: ' + $package.Name) -ForegroundColor Cyan
  & winget install --id $package.Id --exact --source winget --accept-package-agreements --accept-source-agreements
  if ($LASTEXITCODE -ne 0) { Write-Warning ('Verifique instalacao de ' + $package.Id + '. Codigo: ' + $LASTEXITCODE) }
}
Write-Host 'Agora entre no Tailscale com sua conta autorizada, abra Moonlight e pareie com Sunshine.'
Write-Host 'Teste 720p/30 FPS inicialmente para PC antigo ou internet lenta.'
