# Como usar o diagnóstico

1. Abra a aba Actions deste repositório.
2. Selecione **Diagnostico Windows**.
3. Clique em **Run workflow** e confirme.
4. Aguarde a execução terminar.
5. Abra a execução e baixe o artifact **diagnostico-windows**.
6. Leia o arquivo ambiente.txt para conferir CPU, RAM, vídeo e armazenamento.

## Limites

Este projeto executa apenas diagnósticos temporários nos runners do GitHub Actions.
Não cria PC gamer, não habilita RDP e não instala jogos. A disponibilidade e as
especificações do runner podem mudar. Não envie senhas ou tokens nos logs.

## Sobre o projeto original

O README original descreve um sistema RDP, mas não fornece o workflow que
implementaria essa funcionalidade. Este fork oferece uma verificação transparente
do hardware, sem prometer GPU ou sessões persistentes.

## Auditoria do projeto original (09/11/2026)

O repositório upstream `victorhugomedeiros111111-oss/pc-gamer-rdp`, branch `main`, foi verificado pela árvore Git recursiva. Seu conteúdo é exclusivamente `README.md` e `LICENSE`. Não existe `.github/workflows` no upstream e, portanto, a implementação RDP descrita no README não está disponível para copiar ou executar.

O fork inclui workflows próprios de diagnóstico e teste, que **não fornecem computador gamer, acesso RDP, VPN ou streaming**. O runner Windows é temporário, destinado a automação de desenvolvimento, e não deve ser anunciado como uma máquina de cloud gaming.

### Hardware observado em um teste do usuário

- Windows Server 2025 Datacenter (10.0.26100), 64 bits.
- Intel Xeon Platinum 8370C, 4 processadores lógicos.
- 16 GiB de RAM aproximadamente.
- Adaptador de vídeo Microsoft Hyper-V Video (nenhuma GPU gamer dedicada identificada).
- O espaço disponível varia conforme o runner e a execução.

Esses resultados são de um teste específico, não garantia de hardware permanente.

### Como executar

Na aba **Actions**, selecione **Diagnostico Windows**, clique em **Run workflow**, e leia o relatório em **Summary**. Não é necessário configurar Ngrok ou compartilhar senha para este diagnóstico.

### Como criar cloud gaming de verdade

É necessário contratar ou obter acesso autorizado a um PC/VM com GPU e suporte explícito a jogos e streaming remoto. GitHub pode armazenar documentação e scripts de instalação para esse ambiente, mas GitHub-hosted Actions não é a máquina gamer.
