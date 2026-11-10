# Arquitetura: o que roda em cada lugar

```text
GitHub [README, scripts, dashboard, validação de código]
   |
   | arquivos para instalar em máquinas autorizadas
   v
Servidor gamer com GPU e disco persistente (fora dos runners GitHub)
   | Sunshine (captura/codificação do jogo) + Tailscale
   | Steam / outros launchers / jogos licenciados
   |
   | streaming de vídeo/áudio e controles por rede privada
   v
PC fraco (Moonlight + Tailscale)
```

O GitHub Pages é público e **estático**: pode mostrar instruções, links e resultados públicos de Actions, mas não hospeda processos Windows, aceleração gráfica ou um servidor de streaming.

O GitHub Actions hospedado pode validar sintaxe e produzir diagnósticos temporários. Não é servidor de jogos. O recurso **self-hosted runner** usa **seu próprio computador ou VM**: GitHub executa tarefas nele, mas não fornece CPU/GPU/disco. O compartilhamento de sessão por Sunshine não depende de rodar um workflow.

## Critérios para o PC servidor

1. GPU física/virtual compatível com driver e captura, preferencialmente com encoder de hardware.
2. CPU e RAM suficientes para o jogo selecionado.
3. Disco persistente para instalar jogos; backup de saves.
4. Internet com boa **taxa de upload** no servidor e bom download no cliente, baixa latência.
5. Windows ou Linux compatível, login gráfico e permissões para instalar Sunshine/Tailscale.
6. Provedor que autorize jogos e streaming; orçamento, limites, licenças e região conhecidos.

**Ausências atuais:** não há VM contratada, GPU provisionada, autenticação de rede, biblioteca de jogos instalada ou servidor ativado por este repositório.
