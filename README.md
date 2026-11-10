# PC Gamer Cloud — central de controle no GitHub

> **Status atual:** painel, documentação, scripts e diagnóstico. **Não há PC gamer remoto ativado**. O GitHub Actions hospedado pelo GitHub **não é** um serviço de cloud gaming.

Este fork organiza um projeto de streaming de jogos em um computador próprio ou VM **autorizada para jogos e com GPU**. Não precisa de placa de vídeo potente no computador cliente para renderizar os jogos: o servidor executa o jogo; o cliente recebe o vídeo. A compatibilidade do cliente, a qualidade de conexão e os termos do provedor continuam sendo requisitos.

## Comece aqui

- [**Painel de configuração (docs/index.html)**](docs/index.html) — interface visual, checklists e atalhos.
- [**Guia completo**](docs/COMO-USAR.md) — preparar servidor Windows e cliente.
- [**Arquitetura**](docs/ARQUITETURA.md) — onde ficam CPU, GPU, disco e GitHub.
- [**Segurança**](docs/SEGURANCA.md) — não publique credenciais ou portas de administração.
- [**Executar diagnósticos existentes**](../../actions) — não ativam um PC gamer.

Para publicar o painel com endereço web, abra **Settings → Pages → Build and deployment → Deploy from a branch → main /docs → Save**. Depois de a publicação terminar, acesse https://hi831.github.io/pc-gamer-rdp/ . A publicação pode depender das configurações da conta e do repositório. O painel é estático: não acessa um PC real sozinho.

## Componentes

| Local | Função |
| --- | --- |
| GitHub | Armazena projeto, painel, scripts e valida código |
| Servidor Windows/VM com GPU | Instala jogos e executa Sunshine |
| Tailscale | Interliga cliente e servidor em uma rede privada |
| Moonlight no cliente | Recebe áudio/vídeo e envia comandos |
| Disco do servidor | Guarda jogos e saves; **não** é oferecido pelo GitHub |

## Scripts Windows

Em um Windows de servidor ou cliente que **você controla e está autorizado a usar**, baixe este repositório e execute no PowerShell:

```powershell
# No computador servidor (executar primeiro sem -Apply para revisar)
.\scripts\windows\preparar-servidor.ps1
# Só após confirmar que a máquina é sua/autorizada:
.\scripts\windows\preparar-servidor.ps1 -Apply -Steam

# No computador fraco (cliente)
.\scripts\windows\preparar-cliente.ps1
.\scripts\windows\preparar-cliente.ps1 -Apply

# Checar CPU, GPU, RAM e programas no servidor
.\scripts\windows\diagnostico-gamer.ps1
```

**O parâmetro `-Apply` é explícito**: sem ele os instaladores não são executados. O script usa IDs oficiais de pacotes Winget e não solicita senhas, não desativa Defender e não expõe RDP ou portas à internet.

Depois de instalar, é necessário entrar na conta Tailscale em cada máquina, criar credenciais do Sunshine localmente, adicionar o PC ao Moonlight e fazer o pareamento com PIN. Nenhuma credencial é guardada no GitHub.

## Workflows

- **Diagnostico Windows**: identifica recursos do runner temporário do GitHub, apenas para desenvolvimento.
- **Teste do GitHub Actions**: verifica que Actions funciona.
- **Validar projeto cloud**: verifica arquivos e sintaxe dos scripts PowerShell.
- **Diagnostico GPU (runner proprio)**: **somente** para um runner de propriedade do usuário, configurado em repositório privado, com label `gaming`. Não instala programas nem cria túneis. Na configuração pública atual, esse job é ignorado de propósito.

## O que ainda falta para jogar

1. Um PC/VM real com GPU, permissões de uso e capacidade de codificar vídeo.
2. Armazenamento e rede adequados nesse servidor (eventuais custos são do provedor).
3. Instalar Sunshine + Tailscale no servidor, Moonlight + Tailscale no cliente, autenticar e parear.
4. Instalar e configurar jogos que você tem direito de usar.

**Não há como cumprir (1) ou (2) apenas adicionando arquivos a um repositório.** Runners GitHub-hosted não têm GPU gamer padrão nem persistência de armazenamento e são destinados a CI/CD. O upstream original contém apenas README e LICENSE; sua promessa de RDP não está implementada nele.

## Links oficiais

- Sunshine: https://docs.lizardbyte.dev/projects/sunshine/latest/md_docs_2getting__started.html
- Moonlight: https://moonlight-stream.org/
- Tailscale: https://tailscale.com/docs/install/
- GitHub Actions: https://docs.github.com/en/actions
- Política do Actions: https://docs.github.com/en/site-policy/github-terms/github-terms-for-additional-products-and-features

## Licença

MIT. Consulte [LICENSE](LICENSE). Este fork deriva do repositório original [victorhugomedeiros111111-oss/pc-gamer-rdp](https://github.com/victorhugomedeiros111111-oss/pc-gamer-rdp).
