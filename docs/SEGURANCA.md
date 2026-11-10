# Segurança do PC remoto

- Não compartilhe senhas do Windows, Steam, Epic, Sunshine, GitHub, tokens Tailscale ou chaves de acesso em README, Issues, logs de workflows ou GitHub Pages.
- Não desative o Microsoft Defender, atualizações de segurança ou o firewall para supostamente aumentar FPS.
- Não exponha RDP (porta 3389), Sunshine Admin (`47990`) nem controle remoto à internet pública. Use rede privada e autenticação.
- Proteja suas contas com autenticação multifator, onde disponível, e senhas exclusivas.
- Use apenas equipamentos e provedores que você tem autorização para controlar e que permitam cloud gaming.
- Não execute scripts de terceiros sem ler. Os scripts deste projeto exigem a opção `-Apply` para instalar software.
- Evite executar código de pull requests não confiáveis em computadores que armazenam jogos ou senhas.
- O GitHub recomenda **não conectar runners self-hosted a repositórios públicos**; por isso o workflow para runner próprio tem condição de repositório privado e exige configuração manual.
- A página Pages é pública. Ela não deve armazenar URL de administração, tokens, IPs privados ou credenciais.

Fontes:
- https://docs.github.com/en/actions/reference/security/secure-use
- https://docs.lizardbyte.dev/projects/sunshine/latest/md_docs_2getting__started.html
- https://tailscale.com/docs/install/
