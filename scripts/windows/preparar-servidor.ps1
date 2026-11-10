#requires -Version 5.1
<#
.SYNOPSIS
  Prepara um Windows de propriedade do usuario (ou VM autorizada) como servidor Sunshine.
.DESCRIPTION
  Sem -Apply: somente mostra o plano. Com -Apply: instala via fonte oficial winget.
  Nunca gera tunel RDP, altera antivirus, publica portas ou envia credenciais.
#>
[CmdletBinding()]
param(
  [switch]$Apply,
  [switch]$Steam
)
$ErrorActionPreference = 'Stop'
if ($env:OS -ne 'Windows_NT') { throw 'Este script requer Windows.' }
Write-Host '=== PC Gamer Cloud | Servidor Windows ===' -ForegroundColor Cyan
Write-Host 'Use somente no computador/VM que voce controla e que permite jogos.'
$packages = @(
  @{ Id = 'LizardByte.Sunshine'; Name = 'Sunshine (streaming host)' },
  @{ Id = 'Tailscale.Tailscale'; Name = 'Tailscale (rede privada)' }
)
if ($Steam) { $packages += @{ Id = 'Valve.Steam'; Name = 'Steam (biblioteca)' } }
$gpu = @(Get-CimInstance Win32_VideoController -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Name)
Write-Host ('Video detectado: ' + ($gpu -join ', '))
if (-not $gpu -or ($gpu -join ' ') -match 'Hyper-V Video|Microsoft Basic Display|Remote Display') {
  Write-Warning 'Nenhuma GPU gamer identificada. Confira drivers, aceleracao 3D e codificacao de video.'
}
Write-Host 'Pacotes selecionados:'
$packages | ForEach-Object { Write-Host (' - ' + $_.Name + ' [' + $_.Id + ']') }
if (-not $Apply) {
  Write-Host 'Modo previa: nada foi instalado. Adicione -Apply para instalar.' -ForegroundColor Yellow
  Write-Host 'Opcional: -Steam para incluir Steam.'
  exit 0
}
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
  throw 'Winget nao encontrado. Instale App Installer da Microsoft ou use os downloads oficiais: docs.lizardbyte.dev e tailscale.com.'
}
foreach ($package in $packages) {
  Write-Host ('Instalando: ' + $package.Name) -ForegroundColor Cyan
  & winget install --id $package.Id --exact --source winget --accept-package-agreements --accept-source-agreements
  if ($LASTEXITCODE -ne 0) { Write-Warning ('Winget retornou erro/estado ' + $LASTEXITCODE + ' em ' + $package.Id + '. Verifique manualmente.') }
}
Write-Host ''
Write-Host 'Instaladores solicitados. Algumas instalacoes exigem interface e confirmacao do Windows.'
Write-Host 'PASSOS MANUAIS:'
Write-Host '1) Entre na sua conta Tailscale neste servidor.'
Write-Host '2) Abra https://localhost:47990 localmente, crie credenciais Sunshine.'
Write-Host '3) Configure aplicativos/desktop no Sunshine e valide GPU e captura.'
Write-Host '4) Instale seus jogos e conecte pelo Moonlight no cliente.'
Write-Host 'Nao abra 3389/47990 para a internet; leia docs/SEGURANCA.md.'
