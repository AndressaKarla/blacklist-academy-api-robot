*** Settings ***
Resource    ../resources/keywords/post_get_put_del_user_login_keyword.robot


*** Test Cases ***
Criar usuário
    [Tags]    post_user_admin    regressao
    Obter dados user sydadmin estático
    POST login (SYSADMIN) e obter token    mail=${MAIL_SYSADMIN}    password=${PASSWORD}
    Obter password e confirmPassword estáticas user admin dinâmico
    Criar usuário

Listar usuário
    [Tags]    get_user_admin    regressao
    Obter dados user sydadmin estático
    POST login (SYSADMIN) e obter token    mail=${MAIL_SYSADMIN}    password=${PASSWORD}
    Obter password e confirmPassword estáticas user admin dinâmico
    Criar usuário
    Listar usuário 

Alterar senha
    [Tags]    put_password_user_admin    regressao
    POST login (SYSADMIN), POST user (ADMIN), POST login (ADMIN) e obter tokens
    Obter password e confirmPassword estáticas user admin dinâmico
    Criar usuário 
    Obter password e confirmPassword estáticas user admin dinâmico 2
    Alterar senha   

Deletar usuário
    [Tags]    del_user_admin    regressao
    POST login (SYSADMIN), POST user (ADMIN), POST login (ADMIN) e obter tokens
    Obter password e confirmPassword estáticas user admin dinâmico
    Criar usuário 
    Deletar usuário

Validar tentativa de login campos vazios
    [Tags]    login_campos_vazios    
    Login campos vazios

Validar tentativa de login email inválido
    [Tags]    login_email_invalido  
    Carregar user fixture
    Obter password user sysadmin estático 
    Login email inválido

Validar tentativa de login senha inválida
    [Tags]    login_senha_invalida  
    Gerar mail user admin dinâmico
    Login senha inválida