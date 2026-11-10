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
