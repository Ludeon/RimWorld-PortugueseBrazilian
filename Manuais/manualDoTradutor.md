# Manual do Tradutor

## Objetivos deste Manual

- Ensinar;
- Facilitar;
- Padronizar;
- Agilizar;

## Sumário

- [1. Introdução](#1-introdução);
- [2. Requisitos](#2-requisitos);
- [3. Instalação](#3-instalação);
- [4. Introdução ao Git](#4-introdução-ao-git);
- [5. Configuração](#5-configuração);
- [6. Discord](#6-discord);
- [7. Entrando na Equipe](#7-entrando-na-equipe);
- [8. Traduzindo](#8-traduzindo);
- [9. Testando suas Traduções](#9-testando-suas-traduções);
- [10. Mantendo sua fork atualizada](#10-mantendo-sua-fork-atualizada);
- [11. Como contribuir](#11-como-contribuir);
- [12. Atualizações do RimWorld](#12-atualizações-do-rimworld);
- [13. Considerações](#13-considerações);
- [14. Fim](#14-fim);

-------
<br>

## 1. Introdução

<br>
Olá,

Seja muito bem-vindo(a) ao manual do tradutor do RimWorld. Nesse manual você aprenderá como ser um tradutor do RimWorld, ou seja, como contribuir, operar o git, fazer suas traduções, manter sua tradução atualizada, etc.

Vale lembrar que esse manual tem como base o [boas práticas](https://github.com/Ludeon/RimWorld-PortugueseBrazilian/blob/master/Manuais/boaspraticas.md).

Esse manual está separado em tópicos, cada um deles tem um objetivo específico, então caso deseje, pode ir ao tópico desejado e começar a ler. Eles se encontram listados no [Sumário](#sumário).

Visto isso, podemos dar início ao nosso manual.

-------
<br>

## 2. Requisitos
Essa é uma parte importante do manual. Os programas aqui listados serão usados no decorrer do manual. Sendo assim, recomendamos que os utilize para facilitar o entendimento dos próximos tópicos. Todos os programas são gratuitos.

Caso já os tenha instalado, siga ao [tópico 6](#6-entrando-na-equipe).
<br><br>

Esse tópico contém **2 sub-tópicos**:

- **[2.1. Windows](#21-windows)** - Para tradutores que usam Windows.
- **[2.2. Linux](#22-linux)** - Para tradutores que usam Linux.
<br><br>

### 2.1 Windows

<br>

### Lista de Programas

| Programa | Descrição |
|----------|------------|
| **[Git for Windows](https://git-scm.com/download/win)** | O Git é um sistema de controle de versão código aberto. |
| **[VSCode](https://code.visualstudio.com/)** | O Visual Studio Code (mais conhecido como VSCode) é um editor de códigos de código aberto. Oferece uma interface amigável e fácil de usar. |
| **[GitHub Desktop](https://desktop.github.com/)** | GitHub Desktop é um cliente de aplicações desktop para o GitHub. Diferente do Git comum, possuí interface, ou seja, não é um software de linha de comando. |

### 2.2 Linux
***Aviso importante:** diferentemente do Windows, instalaremos os programas do Linux usando linha de comando. Sendo assim, este sub-tópico está presente apenas como uma referência.*

<br>

### Lista de Programas

| Programa | Descrição |
|----------|------------|
| **[Git for Linux](https://git-scm.com/download/linux)** | O Git é um sistema de controle de versão código aberto. |
| **[VSCode](https://code.visualstudio.com/)** | O Visual Studio Code (mais conhecido como VSCode) é um editor de códigos de código aberto. Oferece uma interface amigável e fácil de usar. |
| **[GitHub Desktop For Linux](https://github.com/shiftkey/desktop/)** | GitHub Desktop é um cliente de aplicações desktop para o GitHub. Diferente do Git comum, possuí interface, ou seja, não é um software de linha de comando. |

## 3. Instalação
Chegamos na parte 3 deste manual. Por favor, preste muita atenção neste tópico, pois ele apresenta a forma ideal de instalar os programas que serão utilizados.

Caso já os tenha instalado, siga ao [tópico 6](#6-entrando-na-equipe).
<br><br>

Esse tópico contém **2 sub-tópicos** primários, cada um com outros **3 sub-tópicos** secundários:

- **[3.1. Windows](#31-windows)** - Para tradutores que usam Windows.
  - **[3.1.1. VSCode](#311-vscode)** - Guia de instalação do Visual Studio Code.
  - **[3.1.2. Git](#312-git)** - Guia de instalação do Git.
  - **[3.1.3. GitHub Desktop](#313-github-desktop)** - Guia de instalação do GitHub Desktop.
- **[3.2. Linux](#32-linux)** - Para tradutores que usam Linux.
  - **[3.2.1. VSCode](#321-vscode)** - Guia de instalação do Visual Studio Code.
  - **[3.2.2. Git](#322-git)** - Guia de instalação do Git.
  - **[3.2.3. GitHub Desktop](#323-github-desktop)** - Guia de instalação do GitHub Desktop.
<br><br>

### 3.1 Windows
### 3.1.1 VSCode
Instalar o Visual Studio Code no Windows é um processo simples. Siga os passos abaixo:

1. Acesse o site do [Visual Studio Code](https://code.visualstudio.com/);
2. Clique no botão "Download for Windows" para baixar o instalador;
3. Execute o instalador baixado e siga as instruções na tela;
4. Durante a instalação, marque as opções "Add to PATH" e "Register Code as an editor for supported file types" para facilitar o uso do VSCode com o Git e outros programas;
5. Após a instalação, abra o VSCode e verifique se ele está funcionando corretamente.
6. Pronto! O Visual Studio Code está instalado no seu Windows.

#### 3.1.2 Git
Instalar o Git no windows não é difícil, mas é necessário seguir alguns passos para garantir que tudo funcione corretamente. Siga os passos abaixo:

1. Acesse o site do [Git for Windows](https://git-scm.com/download/win);
2. Clique no texto "Git for Windows/x64 Setup" para baixar o instalador;
3. Execute o instalador baixado;
4. Clique em "Next" para continuar;
5. Na tela de seleção de componentes ("Select Components"), confirme que as opções "Windows Explorer integration" (e seus sub-itens) e "Associate .git configuration files with the default text editor" estejam marcadas. Clique em "Next" para continuar;
6. Na tela "Choosing the default editor used by Git", selecione a opção "Use Visual Studio Code as Git's default editor". Clique em "Next" para continuar;
7. Na tela "Adjusting the name of the initial branch in new repositories", selecione a opção "Override the default branch name for new repositories". Na caixa de texto abaixo, digite "main" (sem aspas). Clique em "Next" para continuar;
8. Na tela "Adjusting your PATH environment", selecione a opção "Git from the command line and also from 3rd-party software". Clique em "Next" para continuar;
9. Na tela "Choosing the SSH executable", selecione a opção "Use the OpenSSH bundled with Git". Clique em "Next" para continuar;
10. Na tela "Choosing HTTPS transport backend", selecione a opção "Use the OpenSSL library". Clique em "Next" para continuar;
11. Na tela "Configuring the line ending conversions", selecione a opção "Checkout Windows-style, commit Unix-style line endings". Clique em "Next" para continuar;
12. Na tela "Configuring the terminal emulator to use with Git Bash", selecione a opção "Use MinTTY (the default terminal of MSYS2)". Clique em "Next" para continuar;
13. Na tela "Choosing the default behavior of 'git pull'", selecione a opção "fast-forward or merge". Clique em "Next" para continuar;
14. Na tela "Choosing how to handle credential helpers", selecione a opção "Git Credential Manager". Clique em "Next" para continuar;
15. Na tela "Configuring extra options", marque a opção "Enable file system caching", mas desmarque a opção "Enable symbolic links". Clique em "Next" para continuar;
16. Aguarde enquanto o instalador copia os arquivos necessários;
17. Na tela final, desmarque as opções "View Release Notes" e "Launch Git Bash". Clique em "Finish" para concluir a instalação.
18. Pronto! O Git está instalado no seu Windows.

#### 3.1.3 GitHub Desktop
Instalar o GitHub Desktop no Windows é um processo simples. Siga os passos abaixo:

1. Acesse o site do [GitHub Desktop](https://desktop.github.com/);
2. Clique no botão "Download for Windows" para baixar o instalador;
3. Execute o instalador baixado e siga as instruções na tela;
4. Após a instalação, abra o GitHub Desktop e faça login com sua conta do GitHub;
5. Pronto! O GitHub Desktop está instalado no seu Windows.

### 3.2 Linux
TÓPICO EM CONSTRUÇÃO

## 4. Introdução ao Git
O Git é um sistema de controle de versão distribuído, amplamente utilizado para gerenciar o desenvolvimento de software. Ele permite que vários desenvolvedores trabalhem em um mesmo projeto de forma simultânea, mantendo o histórico de alterações e facilitando a colaboração.

O Git é uma ferramenta poderosa que permite rastrear alterações no código, reverter para versões anteriores, criar ramificações (branches) para desenvolvimento paralelo e muito mais. Ele é essencial para o trabalho em equipe, pois ajuda a evitar conflitos e a manter o código organizado.

Neste tópico, você aprenderá os conceitos básicos do Git, como criar um repositório, fazer commits, criar branches e muito mais. Esses conhecimentos serão fundamentais para o seu trabalho como tradutor do RimWorld.

### 4.1 O que é um repositório?
Um repositório é um local onde o código-fonte de um projeto é armazenado.
No Git, um repositório pode ser local (armazenado no seu computador) ou remoto (armazenado em um servidor, como o GitHub). Os repositórios remotos são usados para compartilhar o código com outros desenvolvedores e colaborar em projetos, enquanto os repositórios locais são usados para trabalhar no código de forma offline, geralmente para contribuições pessoais ou testes.

### 4.2 O que é um commit?
Um commit é uma alteração no código que é registrada no repositório. Cada commit contém uma mensagem descritiva que explica o que foi alterado, além de informações sobre quem fez a alteração e quando. Os commits são usados para rastrear o histórico de alterações no código e permitem que os desenvolvedores revertam para versões anteriores, se necessário.
No Git, os commits são feitos localmente e podem ser enviados para o repositório remoto quando necessário. Isso permite que os desenvolvedores trabalhem no código de forma offline e enviem suas alterações quando estiverem prontos.

### 4.3 O que é uma branch?
Uma branch (ou ramificação) é uma cópia do código-fonte de um projeto que pode ser modificada de forma independente do código principal (geralmente chamado de "main" ou "master"). As branches são usadas para desenvolver novas funcionalidades, corrigir bugs ou experimentar novas ideias sem afetar o código principal.
No Git, as branches são criadas a partir do código principal e podem ser mescladas (merge) de volta ao código principal quando as alterações estiverem prontas. Isso permite que os desenvolvedores trabalhem em paralelo, sem interferir no trabalho uns dos outros. As branches também são úteis para manter o código organizado e facilitar a colaboração em equipe.

No contexto do RimWorld, usamos branches para organizar as traduções das diferentes dlc's, bem como facilitar grandes atualizações. Por exemplo, temos uma branch para a tradução da DLC "Ideology", outra para a DLC "Royalty", e assim por diante. Isso nos permite trabalhar em cada DLC de forma independente, sem afetar as outras traduções.

### 4.4 O que é um pull request?
Um pull request (PR) é uma solicitação para mesclar (merge) as alterações feitas em uma branch ou fork de volta ao código principal. Ele é usado para revisar e discutir as alterações antes de serem incorporadas ao código principal. Os pull requests são uma parte importante do fluxo de trabalho do Git, pois permitem que os desenvolvedores revisem o código uns dos outros, façam comentários e sugiram melhorias antes que as alterações sejam mescladas.
No GitHub, os pull requests são usados para solicitar a revisão de alterações feitas em um repositório. Eles permitem que os desenvolvedores discutam as alterações, façam comentários e sugiram melhorias antes que as alterações sejam incorporadas ao código principal. Os pull requests também são usados para rastrear o progresso das alterações e garantir que elas sejam revisadas antes de serem mescladas.

No contexto do RimWorld, usamos pull requests para solicitar a revisão das traduções feitas por outros tradutores. Isso nos permite garantir que as traduções sejam revisadas e aprovadas antes de serem incorporadas ao jogo. Além disso, os pull requests também são usados para rastrear o progresso das traduções e garantir que elas sejam atualizadas regularmente. Os pull requests são revisados por um grupo de traduores experientes, chamados de "revisores". Eles são responsáveis por revisar as traduções, sugerir melhorias e garantir que as traduções estejam corretas e consistentes com o restante do jogo.

### 4.5 O que é uma fork?
Uma fork é uma cópia de um repositório que permite que você faça alterações no código sem afetar o repositório original. As forks são usadas para desenvolver novas funcionalidades, corrigir bugs ou experimentar novas ideias sem afetar o código principal. Elas também são usadas para colaborar em projetos de código aberto, permitindo que os desenvolvedores façam alterações no código e solicitem a mesclagem dessas alterações de volta ao repositório original.
No GitHub, as forks são usadas para criar uma cópia de um repositório que pode ser modificada de forma independente do repositório original. Isso permite que os desenvolvedores trabalhem no código de forma offline e enviem suas alterações quando estiverem prontos. As forks também são usadas para colaborar em projetos de código aberto, permitindo que os desenvolvedores façam alterações no código e solicitem a mesclagem dessas alterações de volta ao repositório original.

No contexto do RimWorld, usamos forks para permitir que os tradutores façam alterações no código sem afetar o repositório original. Isso nos permite trabalhar em nossas traduções de forma independente, sem afetar o trabalho dos outros tradutores. Com exceção de grandes atualizações, toda a tradução deve ser feita em sua própria fork, e enviada para o repositório original por meio de um pull request. Isso nos permite garantir que as traduções sejam revisadas e aprovadas antes de serem incorporadas ao jogo.

### 4.6 Conclusão
Neste tópico, você aprendeu os conceitos básicos do Git, incluindo repositórios, commits, branches, pull requests e forks. Esses conceitos são fundamentais para o trabalho em equipe e a colaboração em projetos de código aberto, como a tradução do RimWorld. Compreender esses conceitos permitirá que você trabalhe de forma mais eficiente e organizada, além de facilitar a colaboração com outros tradutores.

No próximo tópico, você aprenderá como configurar o Git e o Visual Studio Code para trabalhar com o RimWorld. Isso incluirá a configuração do Git, a criação de uma fork do repositório original e a configuração do Visual Studio Code para trabalhar com o Git. Esses passos são essenciais para começar a trabalhar na tradução do RimWorld.