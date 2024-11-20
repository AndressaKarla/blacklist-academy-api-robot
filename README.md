---
# Projeto de Testes Funcionais Automatizados de API REST | Robot Framework | RequestsLibrary | Python | GitHub Actions | GitHub Pages :test_tube:
---
# :information_source: Introdução
Esse projeto "blacklist-academy12.2-api-robot" é executado no ambiente da squad "Black List" de ["API REST"](https://black-list.qacoders.dev.br) do "ERP do Qa.Coders Academy", com o objetivo de praticarmos ainda mais testes funcionais automatizados de API REST em Robot Framework, RequestsLibrary, Python, GitHub Actions e GitHub Pages.

---
# :dart: Executar testes automatizados de API REST no ambiente da squad "Black List", Gerar e armazenar reports html e xml no GitHub Actions
- Nesse repositório, acessar a aba "Actions"
- Na seção "Actions", clicar em "Pipeline Testes Automatizados API REST ERP Qa.Coders Academy Robot Framework"
- Em "This workflow has a workflow_dispatch event trigger.", clicar em "Run workflow" > "Run workflow" para executar testes automatizados de API REST, gerar e armazenar reports html e xml no GitHub Actions [com os conteúdos de "secrets.USER_ENV", etc (baseado nos arquivos ["user.example.json"](https://github.com/AndressaKarla/blacklist-academy12.2-api-robot/blob/main/resources/fixtures/user.example.json), etc, e configurados na aba "Settings" desse repositório > "Secrets and variables" > "Actions" > "Secrets" > "Repository secrets") que foram redirecionados para os arquivos "user.json", etc]
- Após o término da execução, clicar na run "Pipeline Testes Automatizados API REST ERP Qa.Coders Academy Robot Framework"
- Na seção "Artifacts", clicar em "robot-api-rest-reports-html-xml"
- Na janela aberta, escolher um diretório para baixar a pasta compactada "robot-api-rest-reports-html-xml.zip"

# :mag_right: Verificar no navegador padrão o report html gerado e armazenado anteriormente no GitHub Actions e descompactado no computador 
- No Windows 11, abrir uma janela do "Explorador de Arquivos"
- Acessar o diretório onde foi baixada a pasta compactada "robot-api-rest-reports-html-xml.zip" anteriormente
- Descompactar a pasta
- Acessar a pasta descompactada "robot-api-rest-reports-html-xml"
- Clicar 2 vezes sob o report "log.html" gerado e armazenado anteriormente no GitHub Actions e descompactado para ser aberto e verificado no navegador padrão no computador

---
# Antes de clonar ou executar esse projeto localmente no computador, é necessário seguir as instruções abaixo :point_down:
## :hammer_and_wrench: Janela do "Explorador de Arquivos" > opção "Visualizar" > "Mostrar" e marcar algumas opções
- No Windows 11, abrir uma janela do "Explorador de Arquivos"
- Clicar na opção "Visualizar" > "Mostrar" 
- Clicar na opção "Itens ocultos"

## :hammer_and_wrench: Baixar e instalar o git e gitbash; configurar o git
- Caso ainda não tenha o git e gitbash baixado e instalado, acessar o link do [git e gitbash](https://git-scm.com/download/win), baixar e instalar
- Caso ainda não tenha configurado o git, seguir os passos apresentados nesse link [Configure a ferramenta](https://training.github.com/downloads/pt_BR/github-git-cheat-sheet/#:~:text=Configure%20a%20ferramenta) e configurar

## :hammer_and_wrench: Desinstalar Python que já foi instalado em algum outro momento
- Na ferramenta de pesquisa do Windows, informar "Adicionar ou remover programas" 
- Clicar na sugestão apresentada 
- Em "Aplicativos > Aplicativos instalados", no campo de busca, informar "Python" e/ou "Python Launcher"
- Clicar no resultado apresentado
- Clicar em "... > Desinstalar" e prosseguir com as etapas de desinstalação
- Na janela do "Explorador de Arquivos", acessar o diretório "C:", procurar e excluir a pasta "Python ..."
- Acessar o diretório "C:\Program Files", procurar e excluir a pasta "Python ..."
- Acessar o diretório "C:\Program Files (x86), procurar e excluir a pasta "Python ..."
- Acessar o diretório "C:\Users\usuario\AppData\Local\Programs", procurar e excluir a pasta "Python ..."
- Acessar o diretório "C:\Users\usuario\AppData\Roaming", procurar e excluir a pasta "Python ..."

## :hammer_and_wrench: Desinstalar e/ou Remover robotframework que já foi instalado em algum outro momento
- Na janela do "Explorador de Arquivos", acessar o diretório "C:\Users\usuario", procurar e excluir o arquivo .robotframework-ls

## :hammer_and_wrench: Python versão 3.8.1 (x86)
- Baixar o python-3.8.1 do "[Windows x86 executable installer](https://www.python.org/ftp/python/3.8.1/python-3.8.1.exe)"
- Clicar com botão direito no executável "python-3.8.1.exe > Mostrar mais opções > Executar como administrador"
- Marcar as opções "Use admin privileges when instaling py.exe" e "Add Python 3.8 to PATH" caso ainda não estejam marcadas
- Clicar em "Customize installation"
- Em "Optional Features", marcar todas as opções caso ainda não estejam marcadas
- Em "Advanced Options", marcar a opção "Install for all users"
- Em "Customize install location" alterar para "C:\Python38"
- Prosseguir com as outras etapas de instalação
- Abrir um novo gitbash ou outro terminal de preferência como administrador, informar o comando abaixo para confirmar se o python realmente foi instalado
```
python --version
```
- E verificar se foi retornada a mesma versão do python do "Windows x86 executable installer" instalada anteriormente:
```
Python 3.8.1
```
- Informar o comando abaixo para verificar se foi retornada alguma versão e confirmar se o pip (gerenciador de pacotes do python) realmente foi instalado
```
pip --version
```

---
# :hammer_and_wrench: Clonar o projeto
- No Windows 11, abrir uma janela do "Explorador de Arquivos"
- Acessar o diretório onde será clonado o projeto "blacklist-academy12.2-api-robot"
- Copiar esse diretório 
- No gitbash ou terminal aberto como administrador anteriormente, informar o comando abaixo para acessar onde será clonado o projeto
```
cd "<diretório copiado anteriormente>"
```
Ex.: 
```
cd "C:\PROJETOS\Automação"
```
- Informar o comando abaixo para clonar este repositório via "HTTPS"
```
git clone https://github.com/AndressaKarla/blacklist-academy12.2-api-robot.git
```
- Ou informar o comando abaixo para clonar este repositório via "SSH"
```
git clone git@github.com:AndressaKarla/blacklist-academy12.2-api-robot.git
```

# :hammer_and_wrench: Instalar todas as dependências necessárias
- No gitbash aberto como administrador anteriormente, informar o comando abaixo para acessar o projeto "blacklist-academy12.2-api-robot" clonado anteriormente
```
cd "blacklist-academy12.2-api-robot"
```
Ex.: 
```
C:\PROJETOS\Automação\blacklist-academy12.2-api-robot
```
- Informar o comando abaixo para instalar todas as dependências necessárias do projeto 
```
pip install -r requirements.txt
```

---
# :hammer_and_wrench: Instalar as extensões no Visual Studio Code (VS Code)
- Caso ainda não tenha o VS Code baixado e instalado, acessar o site do [Visual Studio Code](https://code.visualstudio.com/download), baixar e instalar com a opção "System Installer"
- Com o Visual Studio Code aberto, caso seja apresentado alguma mensagem de "Instalar pacote de idiomas ...", clicar no ícone de configurações > "Don't Show Again"
- Clicar na opção "Manage > Profiles > Create Profile"
- Em "Profile name", informar "Robot Framework"
- Clicar na opção "Create"
- Clicar na opção "Extensions", informar e instalar as extensões abaixo:
  - One Dark Pro
    - binaryify
      - Clicar na opção "One Dark Pro Darker" apresentada para habilitar a extensão
  - Material Icon Theme
    - Philipp Kief
      - Clicar na opção "Material Icon Theme" apresentada para habilitar a extensão
  - Python
    - Microsoft
  - Robot Framework Language Server 
    - Robocorp
- Fechar o VS Code

# :bookmark_tabs: Abrir o VS Code diretamente na pasta do projeto "blacklist-academy12.2-api-robot"
- No gitbash aberto como administrador anteriormente, informar o comando abaixo para abrir o VS Code diretamente na pasta do projeto "blacklist-academy12.2-api-robot"
```
code .
```
- Aguardar o VS Code ser aberto
- Fechar esse gitbash
- No VS Code aberto, caso seja apresentado "Do you trust the authors on the files in this folder?", marcar a opção "Trust the authors of all files in the parent folder ...."
	- Clicar no botão "Yes, I trust the authors ...."

# :hammer_and_wrench: Criar arquivos "user.json", etc, informando os dados com base nos arquivos "user.example.json", etc
- No VS Code aberto anteriormente, acessar "resources > fixtures"
- Criar o arquivo "user.json"
  - Informar os dados com base no arquivo ["user.example.json"](https://github.com/AndressaKarla/blacklist-academy12.2-api-robot/blob/main/resources/fixtures/user.example.json)
  - Salvar o arquivo "user.json" com os dados informados anteriormente

---
# :dart: Executar testes automatizados de API REST no ambiente da squad "Black List", Gerar e armazenar reports html e xml no computador
## :triangular_flag_on_post: Executar cada cenário individualmente do projeto
- Abrir uma janela do "Explorador de Arquivos"
- Acessar o diretório onde foi clonado o projeto “blacklist-academy12.2-api-robot”
- Copiar esse diretório 
- Abrir um novo gitbash
- Informar o comando abaixo para acessar o projeto "blacklist-academy12.2-api-robot"
```
cd "<diretório copiado anteriormente>"
```
Ex.: 
```
cd "C:\PROJETOS\Automação\blacklist-academy12.2-api-robot"
```
- Informar o comando abaixo para executar cada cenário individualmente do projeto:
```
robot -d ./reports -i nome_tag ./tests/*
```
Ex. 1:
```
robot -d ./reports -i get_id_company ./tests/*
```
Ex. 2: 
```
robot -d ./reports -i login_email_invalido ./tests/*
```

## :triangular_flag_on_post: Ou executar todos os cenários do projeto, Gerar e armazenar reports html e xml na pasta "reports" no computador
- No gitbash aberto anteriormente, informar o comando abaixo para executar todos os cenários do projeto (mesmo comando que é utilizado no "Passo 5" do job "robot-api-rest" da "Pipeline Testes Automatizados API REST ERP Qa.Coders Academy Robot Framework" em ".github > workflows > [workflow-blacklist-academy-api-robot-requests.yml](https://github.com/AndressaKarla/blacklist-academy12.2-api-robot/blob/main/.github/workflows/workflow-blacklist-academy-api-robot-requests.yml)" no GitHub Actions), Gerar e armazenar reports html e xml na pasta "reports" no computador:
```
robot -d ./reports ./tests/*
```

---
# :mag_right: Verificar no navegador padrão o report html gerado e armazenado na pasta "reports" anteriormente no computador 
## :bookmark_tabs: Report html no computador
- No VS Code aberto anteriormente, acessar "reports > log.html" 
- Clicar com botão direito do mouse sob o arquivo "log.html" > "Reveal in File Explorer" 
- Na janela do "Explorador de Arquivos" aberta automaticamente, clicar 2 vezes sob o arquivo "log.html" gerado e armazenado anteriormente no computador para ser aberto e verificado no navegador padrão

---
### Feito com ❤️ por Andressa Karla, Cassiano Pereira, Cristian Fabiano, Ewerton Luiz e Isabela Vidal :wave: 

---
