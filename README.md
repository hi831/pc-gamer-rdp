# PC Gamer Virtual Gratuito via GitHub Actions

Transforme o GitHub Actions em um **PC Gamer Virtual gratuito** com acesso via RDP (Remote Desktop Protocol). Este repositório configura automaticamente uma máquina Windows com otimizações de performance para gaming, instala software essencial e cria um túnel seguro para acesso remoto.

## Especificações do PC Virtual

| Componente | Especificação |
|---|---|
| **CPU** | 4 vCPUs (Intel Xeon / AMD EPYC) |
| **RAM** | 16 GB DDR4 |
| **Armazenamento** | 14 GB SSD NVMe |
| **Internet** | 1 - 10 Gbps (Azure Datacenter) |
| **Sistema Operacional** | Windows Server 2025 (base Windows 11) |
| **Duração Máxima** | 6 horas por sessão |
| **Custo** | Gratuito (repositório público) |

## Software Instalado Automaticamente

| Software | Descrição |
|---|---|
| **Google Chrome** | Navegador web (opcional) |
| **Steam** | Plataforma de jogos (opcional) |
| **Epic Games Launcher** | Plataforma de jogos (opcional) |
| **DirectX Runtime** | Bibliotecas gráficas essenciais |
| **Visual C++ Redistributables** | Dependências para jogos |
| **.NET Runtime 8.0** | Runtime para aplicações |
| **7-Zip** | Compactador de arquivos |

## Otimizações Gaming Aplicadas

O workflow aplica automaticamente mais de **15 otimizações de performance**, incluindo:

O **Windows Defender** em tempo real é desabilitado para liberar recursos de CPU que seriam consumidos pela verificação constante de arquivos. O **plano de energia** é configurado para Alta Performance, garantindo que o processador opere sempre na frequência máxima. Serviços desnecessários como Windows Search, Superfetch e Telemetria são desativados para liberar memória RAM e ciclos de CPU.

No âmbito de rede, o **Nagle's Algorithm** é desabilitado para reduzir a latência de rede, e as configurações TCP são otimizadas para máximo throughput. A prioridade de processos em primeiro plano é aumentada para garantir que os jogos recebam a maior fatia de recursos do sistema.

Para o RDP especificamente, o **H.264/AVC encoding** é habilitado para melhor qualidade de imagem, a taxa de frames é configurada para **60 FPS**, o transporte **UDP** é habilitado para menor latência, e o **RemoteFX** é ativado para aceleração de hardware.

## Pré-requisitos

Antes de começar, você precisará de duas coisas:

1. **Conta no GitHub** (gratuita): [github.com](https://github.com)
2. **Conta no Ngrok** (gratuita): [ngrok.com](https://ngrok.com)

## Guia de Configuração Passo a Passo

### Passo 1: Criar Conta no Ngrok

Acesse [dashboard.ngrok.com/signup](https://dashboard.ngrok.com/signup) e crie uma conta gratuita. Após o login, copie seu **Authtoken** na página [dashboard.ngrok.com/get-started/your-authtoken](https://dashboard.ngrok.com/get-started/your-authtoken).

### Passo 2: Fazer Fork deste Repositório

Clique no botão **Fork** no canto superior direito desta página para criar uma cópia do repositório na sua conta. O repositório deve ser **público** para ter minutos ilimitados de GitHub Actions.

### Passo 3: Configurar o Secret do Ngrok

No seu repositório (fork), siga estes passos:

1. Vá em **Settings** (Configurações)
2. No menu lateral, clique em **Secrets and variables** e depois em **Actions**
3. Clique em **New repository secret**
4. No campo **Name**, digite: `NGROK_AUTH_TOKEN`
5. No campo **Secret**, cole seu Authtoken do Ngrok
6. Clique em **Add secret**

### Passo 4: Executar o Workflow

1. Vá na aba **Actions** do seu repositório
2. No menu lateral, clique em **"PC Gamer Virtual - Windows RDP"**
3. Clique em **"Run workflow"**
4. Configure as opções desejadas (senha, software para instalar)
5. Clique em **"Run workflow"** (botão verde)

### Passo 5: Obter o Endereço de Conexão

1. Clique no workflow em execução
2. Clique no job **"PC Gamer Virtual RDP"**
3. Aguarde até o passo **"Informações Finais e Iniciar Túnel RDP"**
4. O endereço TCP do ngrok aparecerá no log, no formato: `tcp://X.tcp.ngrok.io:XXXXX`
5. Anote o endereço (exemplo: `0.tcp.ngrok.io:12345`)

### Passo 6: Conectar via RDP

**No Windows:**
1. Pressione `Win + R` e digite `mstsc`
2. No campo "Computador", digite o endereço do ngrok (ex: `0.tcp.ngrok.io:12345`)
3. Clique em **Conectar**
4. Usuário: `runneradmin`
5. Senha: a que você definiu no workflow

**No Mac:**
1. Baixe o **Microsoft Remote Desktop** na App Store
2. Clique em **Add PC**
3. Cole o endereço do ngrok
4. Conecte com as credenciais

**No Android/iOS:**
1. Baixe o app **RD Client** (Microsoft Remote Desktop)
2. Adicione um novo PC com o endereço do ngrok
3. Conecte com as credenciais

## Dicas para Melhor Performance

Para obter a melhor experiência possível ao usar o RDP para gaming, considere as seguintes recomendações:

A **qualidade da sua conexão de internet** é o fator mais importante. Uma conexão estável com pelo menos 10 Mbps de download é recomendada. Conexões via cabo Ethernet são preferíveis ao Wi-Fi para reduzir a latência.

Nas configurações do cliente RDP, ajuste a **qualidade de exibição** conforme sua conexão. Para conexões mais lentas, reduza a resolução para 1280x720. Para conexões rápidas, use 1920x1080 com 32-bit de cor.

Jogos que não dependem de reflexos rápidos (como RPGs, estratégia, simuladores e jogos de turno) funcionam melhor via RDP do que jogos competitivos de FPS que exigem latência ultra-baixa.

## Limitações Importantes

| Limitação | Detalhe |
|---|---|
| **Duração** | Máximo de 6 horas por sessão |
| **GPU** | Sem GPU dedicada (renderização por CPU) |
| **Armazenamento** | 14 GB total (limitado para jogos grandes) |
| **Latência** | Depende da sua conexão e localização |
| **Uso** | GitHub pode restringir uso abusivo |

> **Aviso:** Este método utiliza recursos do GitHub Actions de forma não convencional. Use com moderação e responsabilidade. O uso excessivo pode resultar em restrições na sua conta GitHub. Este guia é apenas para fins educacionais.

## Solução de Problemas

**O workflow não inicia:** Verifique se o repositório é público e se o secret `NGROK_AUTH_TOKEN` está configurado corretamente.

**Não consigo conectar via RDP:** Verifique se o endereço do ngrok está correto e se o túnel ainda está ativo. O endereço muda a cada execução.

**Conexão lenta ou travando:** Reduza a resolução do RDP para 1280x720 e desabilite efeitos visuais no cliente RDP.

**Ngrok mostra erro de autenticação:** Gere um novo authtoken no dashboard do ngrok e atualize o secret no GitHub.

## Licença

Este projeto é distribuído sob a licença MIT. Consulte o arquivo LICENSE para mais detalhes.
