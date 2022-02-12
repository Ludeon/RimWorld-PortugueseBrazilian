## Manual de boas práticas de tradução

-------------------------

### Objetivos deste Manual de tradução:
- Ensinar;
- Facilitar;
- Padronizar;
- Agilizar.

### OBSERVAÇÕES INICIAIS:
1. Crie uma ramificação (fork) do [projeto original](https://github.com/Ludeon/RimWorld-PortugueseBrazilian) na sua conta pessoal do GitHub;
2. Sempre envie suas mudanças como [Pull Requests](https://github.com/Ludeon/RimWorld-PortugueseBrazilian/pulls);
3. **Não aprove seu próprio Pull Request**, por mais que seja pouca coisa ou esteja cem por cento certo, pode ser que alguém ache algo que você pode melhorar ou corrigir;
4. Caso haja dúvidas, **peça ajuda** aos membros mais ativos.

### Ferramentas para auxílio:
- Editores de texto: [Visual Studio Code](https://code.visualstudio.com) / [Notepad++](https://notepad-plus-plus.org/) / [Atom](https://atom.io) (você pode fazer uso de outro editor de texto de sua preferência). (1)
- Aplicativo do GitHub para computador: [GitHub Desktop](https://desktop.github.com/). (2)
- Command Line do git (opcional) [Windows](https://git-scm.com/download/win) / [OSX](https://git-scm.com/download/mac). (3)
- [WinMerge](https://winmerge.org/). (4)

#### (1) Editores de texto
Estes programas lhe permitem fazer modificações nos arquivos da tradução.

#### (2) GitHub Desktop
Este é o programa que vai lhe permitir (e auxiliar) adicionar novas traduções ao repositório oficial, como também atualizar seu próprio repositório.

#### (3) Git CLI
Assim como o github desktop, esse programa permite atualizar seu repositório e manter-se em dia com as alterações do repositório oficial.  
*Nota: o download foi disponibilizado apenas para Windows e Mac. O Linux geralmente vem com o git instalado por padrão.* 

#### (4) WinMerge
Este programa lhe permite fazer comparações entre até três arquivos, para verificar possíveis alterações entre eles.

-------------------------

### COMEÇANDO A TRADUZIR

#### Criando uma conta no GitHub

1. Para começar a traduzir, caso ainda não possua uma conta no GitHub, você precisará criar uma em [github.com](https://github.com/join?source=header-home);
2. Preencha os campos de usuário (Username), Email (Email address) e senha (Password);
3. Escolha o tipo de conta que será criada. 
    * Clique em **Individual** e depois **Choose Free**;
4. Em seguida desça a página e clique em **Complete setup**.
5. Verifique o email de confirmação enviado para o email que você colocou no registro.

#### Criando sua própria cópia do repositório

1. Acesse o [repositório oficial](https://github.com/Ludeon/RimWorld-PortugueseBrazilian) e procure a opção **Fork** no menu superior esquerdo.
    * Ela está localizada logo após as opções **Watch**/**Unwatch** e **Star**/**Unstar**;
2. No pop-up que irá aparecer, clique no seu nome de usuário (para o qual você quer criar o repositório) e espere o repositório ser criado.

#### [Git CLI] Configurações iniciais.
Digite os seguinte comandos nessa ordem:  
**NÃO ESQUEÇA DE TROCAR `USERNAME` PELO SEU NOME DE USUÁRIO DO GITHUB**  
```
git clone git@github.com:USERNAME/rimword-portuguesebrazilian
cd rimworld-portuguesebrazilian
git remote rename origin USERNAME
git remote add ludeon git@github.com:ludeon/rimworld-portuguesebrazilian
git fetch ludeon
```

#### Mantendo seu repositório atualizado com o repositório oficial

##### Via GitHub
1. Se o seu repositório apresenta alguma mensagem do tipo: **This branch is X commits behind Ludeon:master**, então está na hora de atualizá-lo. Para atualizar seu repositório clique em **Fetch upstream**, localizado ao lado de **Contribute**;
2. Na janela que carregar, deverá receber uma mensagem similar a
```
Fetch and merge X upstream commits from Ludeon:master.

Keep your fork up-to-date with the upstream repository.
```
Se esse for o caso, prossiga. Se não, seu fork já está atualizado;

3. Clique em **Fetch and merge**;
4. Aguarde um pouco e pronto! Seu repositório foi atualizado.

##### Via Git CLI
```
git fetch ludeon
git rebase ludeon/master
```
O git deverá responder com:
```
Current branch is up to date.
```
Caso ele responda com:
```
error: cannot rebase: You have unstaged changes.
error: Please commit or stash them.
```
Não se preocupe.
- Verifique que aquivos foram alterados com `git status --short`
- Salve suas alterações com `git commit`
- Execute `git rebase ludeon/master`
- Envie suas alterações com `git push --force-with-lease username`

Pronto, seu repositório foi atualizado.

#### Abrindo os programas para tradução

##### [GitHub Desktop]
1. Após ter instalado o GitHub Desktop, abra-o;
2. A tela de inicio do GitHub Desktop irá aparecer, faça login com sua conta e clique em **Clone a repository from the internet...**;
3. Selecione o seu repositório criado, e clone-o.
    * Exemplo: https://github.com/(usuario)/RimWorld-PortugueseBrazilian;
4. Pronto, você configurou o GitHub Desktop;
5. Em seguida, basta abrir a pasta da tradução baixada pelo GitHub Desktop com seu editor de texto e começar a traduzir.
    * Caminho padrão da pasta: C:\\Users\\(usuário)\\Documents\\GitHub\\RimWorld-PortugueseBrazilian.
    * Ou C:\\Usuários\\(usuário)\\Documentos\\GitHub\\RimWorld-PortugueseBrazilian.

##### [Git CLI]: Veja Configurações iniciais.

#### Enviando traduções para seu repositório

##### [GitHub Desktop]
1. Volte ao GitHub Desktop e localize um espaço em branco no canto inferior esquerdo;
2. Em **Summary (required)** digite o título da atualização (geralmente a versão do jogo);
3. Em **Description** descreva suas mudanças feitas na tradução;
4. Clique em **Commit to master**;
5. Clique em **Pull origin** para enviar as traduções ao seu repositório.

##### [Git CLI]
```
git status --short
git commit
git push USERNAME
```
Caso o git responda com um erro, use `git push --force-with-lease USERNAME`.


#### Enviando traduções do seu repositório para o repositório oficial

1. Abra a página do seu repositório. Exemplo: https://github.com/(usuario)/RimWorld-PortugueseBrazilian;
2. Clique em **New pull request**;
3. Deixe a ordem dos repositórios de modo que o repositório oficial fique na esquerda, e o seu repositório na direita. Assim você irá enviar atualizações do seu repositório, para o repositório oficial;
4. Clique em **Create pull request**;
5. Adicione um título e a descrição das mudanças;
6. Clique em **Create pull request** novamente;
7. Aguarde suas alterações serem revisadas.
