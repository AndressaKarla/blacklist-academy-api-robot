*** Settings ***
Documentation       Arquivo base com inicializações

Library             RequestsLibrary
Library             helpers.py
Resource            env.resource
Variables           environments/${ENV}.json


*** Variables ***
${URI}      ${base_uri}


*** Keywords ***
Criar sessão
    ${headers}    Create Dictionary    Content-Type=application/json
    Create Session    alias=APIBlackList    url=${URI}    headers=${headers}    disable_warnings=1

Carregar user fixture
    ${user_fixture}    Carregar Fixture    user
    Set Test Variable    ${USER_FIXTURE}    ${user_fixture}

Obter mail user sysadmin estático
    Set Test Variable    ${MAIL_SYSADMIN}    ${USER_FIXTURE['sysadmin_valido']['mail_valido']}

Obter password user sysadmin estático
    Set Test Variable    ${PASSWORD}    ${USER_FIXTURE['sysadmin_valido']['password_valida']}

Obter dados user sydadmin estático
    Carregar user fixture
    Obter mail user sysadmin estático
    Obter password user sysadmin estático

POST login (SYSADMIN) e obter token
    [Arguments]    ${mail}    ${password}
    ${body}    Create Dictionary
    ...    mail=${mail}
    ...    password=${password}
    Log    ${body}

    Criar sessão

    ${response_post_login_sysadmin}    POST On Session
    ...    alias=APIBlackList
    ...    url=/api/login
    ...    json=${body}
    ...    expected_status=200

    Set Local Variable    ${JSON_DATA_POST_LOGIN_SYSADMIN}    ${response_post_login_sysadmin.json()}
    Set Test Variable    ${TOKEN_SYSADMIN}    ${JSON_DATA_POST_LOGIN_SYSADMIN['token']}

Gerar fullName user admin dinâmico
    ${fullName}     Gerar Full Name
    Set Test Variable    ${FULL_NAME}    ${fullName} 

Gerar mail user admin dinâmico
    ${mailAdmin}    Gerar Mail User
    Set Test Variable    ${MAIL_ADMIN}    ${mailAdmin}

Gerar cpf user admin dinâmico
    ${cpf}    Gerar Cpf
    Set Test Variable    ${CPF}    ${cpf}

Obter password e confirmPassword estáticas user admin dinâmico
    Set Test Variable    ${PASSWORD_CONFIRM_PASSWORD}    ${USER_FIXTURE['admin_valido']['password_confirmPassword_validas']}

Gerar e obter dados user admin dinâmico
    Gerar fullName user admin dinâmico
    Gerar mail user admin dinâmico
    Gerar cpf user admin dinâmico
    Obter password e confirmPassword estáticas user admin dinâmico

POST user (ADMIN), obter id e mail
    [Arguments]    ${fullName}    ${mail}    ${cpf}    ${password_confirmPassword}
    ${body}    Create Dictionary
    ...    fullName=${fullName}
    ...    mail=${mail}
    ...    accessProfile=ADMIN
    ...    cpf=${cpf}
    ...    password=${password_confirmPassword}
    ...    confirmPassword=${password_confirmPassword}
    Log    ${body}

    Criar sessão

    ${headers}    Create Dictionary    Authorization=${TOKEN_SYSADMIN}

    ${response_post_user_admin}    POST On Session
    ...    alias=APIBlackList
    ...    url=/api/user
    ...    headers=${headers}
    ...    json=${body}
    ...    expected_status=201

    Set Local Variable    ${JSON_DATA_POST_USER_ADMIN}    ${response_post_user_admin.json()}
    Set Test Variable    ${ID_ADMIN}    ${JSON_DATA_POST_USER_ADMIN['user']['_id']}
    Set Test Variable    ${MAIL_ADMIN}    ${JSON_DATA_POST_USER_ADMIN['user']['mail']}

POST login (ADMIN) e obter token
    [Arguments]    ${mail}    ${password}
    ${body}    Create Dictionary
    ...    mail=${mail}
    ...    password=${password}
    Log    ${body}

    Criar sessão

    ${response_post_login_admin}    POST On Session
    ...    alias=APIBlackList
    ...    url=/api/login
    ...    json=${body}
    ...    expected_status=200

    Set Local Variable    ${JSON_DATA_POST_LOGIN_ADMIN}    ${response_post_login_admin.json()}
    Set Test Variable    ${TOKEN_ADMIN}    ${JSON_DATA_POST_LOGIN_ADMIN['token']}

POST login (SYSADMIN), POST user (ADMIN), POST login (ADMIN) e obter tokens
    Obter dados user sydadmin estático
    POST login (SYSADMIN) e obter token    mail=${MAIL_SYSADMIN}    password=${PASSWORD}
    Gerar e obter dados user admin dinâmico
    POST user (ADMIN), obter id e mail
    ...    fullName=${FULL_NAME}
    ...    mail=${MAIL_ADMIN}
    ...    cpf=${CPF}
    ...    password_confirmPassword=${PASSWORD_CONFIRM_PASSWORD}
    POST login (ADMIN) e obter token    mail=${MAIL_ADMIN}    password=${PASSWORD_CONFIRM_PASSWORD}
