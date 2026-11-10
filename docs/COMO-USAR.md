# Guia completo — PC gamer via streaming com GitHub como central

## 1. Entenda o que você terá

O GitHub hospeda este código e o painel. O **PC que realmente executa os jogos precisa existir fora do GitHub Actions hospedado**: computador próprio ou VM com GPU e permissão do provedor para jogar e transmitir vídeo. Não existe máquina gratuita ilimitada garantida neste projeto.

## 2. Escolha o servidor

Use um Windows 10/11 ou versão suportada pelo Sunshine com GPU compatível, driver de vídeo e acesso gráfico. Em VMs, confira com o provedor: (a) aceleração GPU real; (b) codificador de vídeo; (c) sessão gráfica/monitor virtual; (d) jogos permitidos; (e) disco persistente; (f) preço, região e limite de tráfego. Um adaptador **Microsoft Hyper-V Video** sozinho não demonstra GPU gamer.

Seu PC fraco ficará como **cliente** do vídeo, não como processador do jogo.

## 3. Prepare o servidor Windows

Baixe os arquivos do repositório (Code → Download ZIP) e extraia em uma pasta. Abra PowerShell **na própria máquina servidor**, na pasta do projeto. Examine o script, então execute:

```powershell
.\scripts\windows\preparar-servidor.ps1
.\scripts\windows\preparar-servidor.ps1 -Apply -Steam
.\scripts\windows\diagnostico-gamer.ps1
```

O primeiro comando é modo prévia. O segundo solicita ao Winget para instalar Sunshine, Tailscale e, opcionalmente, Steam. Instalações podem pedir elevação e confirmação do Windows. Se o Winget não existir, siga os sites oficiais indicados no script. A instalação não configura conta ou senha automaticamente.

**No servidor**:
1. Abra Tailscale e faça login na sua conta.
2. Abra a interface local do Sunshine em `https://localhost:47990`. Defina usuário/senha fortes e guarde-os fora do GitHub.
3. No Sunshine, configure os aplicativos/jogos e confirme que a GPU e a codificação de vídeo funcionam.
4. Não publique a interface Sunshine na internet e não abra portas RDP.

## 4. Prepare o computador cliente

No PC que receberá a imagem:

```powershell
.\scripts\windows\preparar-cliente.ps1
.\scripts\windows\preparar-cliente.ps1 -Apply
```

O script instala **Moonlight** e **Tailscale** via Winget. Faça login na **mesma rede Tailscale** (conforme suas permissões) nas duas máquinas.

Abra o Moonlight, escolha Adicionar PC manualmente se necessário e digite o endereço **privado Tailscale do servidor** (não publique esse endereço). Faça o pareamento usando o PIN exibido pelo Moonlight e confirmado no painel Sunshine do servidor. Depois selecione o aplicativo ou jogo.

Sugestão para conexão/cliente modestos: teste 1280×720 e 30 FPS primeiro; depois aumente conforme o desempenho real da decodificação e rede. Use cabo de rede quando possível.

## 5. Publique o painel no GitHub Pages

No repositório público: **Settings → Pages → Build and deployment → Deploy from a branch → main /docs → Save**. O endereço esperado, após GitHub confirmar a publicação, é:

https://hi831.github.io/pc-gamer-rdp/

O painel contém atalhos, progresso salvo **apenas neste navegador** e estado público dos workflows; ele **não acessa nem liga um PC**. É uma página pública: não coloque senhas, chaves, IP privado ou links de acesso à máquina.

## 6. Use os Actions

Em https://github.com/hi831/pc-gamer-rdp/actions execute **Diagnostico Windows** para conferir um runner de testes do GitHub. O resultado aparece na aba Summary, não em arquivo ZIP.

O workflow **Diagnostico GPU (runner proprio)** está propositalmente condicionado à privacidade do repositório. **Não registre um runner com jogos/senhas em um repositório público**. GitHub alerta para risco de comprometimento dos self-hosted runners. Você pode criar um repositório *privado* separado para diagnósticos do seu servidor autorizado; configure o runner conforme a documentação oficial e atribua label `gaming`. Não é necessário usar Actions no servidor para jogar: Sunshine/Moonlight funcionam independentemente.

## 7. Resolução de problemas

- **Não encontra o servidor no Moonlight:** confirme que Tailscale está conectado nos dois PCs, que o Sunshine está ativo e que o firewall do servidor permite as conexões da rede privada necessárias.
- **Tela preta:** confirme GPU, monitor/sessão gráfica, drivers e captura no Sunshine. Muitas VMs precisam de suporte específico a console gráfico, não apenas RDP.
- **Trava e fica lento:** diminua resolução e FPS; teste ethernet; verifique latência entre servidor e cliente e capacidade de decodificação do PC fraco.
- **Sem espaço:** o armazenamento é do **servidor**, não do GitHub; cheque disco antes de instalar jogos.
- **Jogo não funciona:** cheque compatibilidade do jogo, anticheat, DRM, drivers e regras do provedor.

## 8. Fontes oficiais

- Instalação Sunshine: https://docs.lizardbyte.dev/projects/sunshine/latest/md_docs_2getting__started.html
- Moonlight: https://moonlight-stream.org/
- Tailscale Windows: https://tailscale.com/docs/install/windows
- Runners próprios: https://docs.github.com/en/actions/how-tos/manage-runners/self-hosted-runners/use-in-a-workflow
- Segurança de runners: https://docs.github.com/en/actions/reference/security/secure-use
- Termos do Actions: https://docs.github.com/en/site-policy/github-terms/github-terms-for-additional-products-and-features
