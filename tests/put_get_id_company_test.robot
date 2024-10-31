*** Settings ***
Resource    ../resources/keywords/put_get_id_company_keyword.robot


*** Test Cases ***
PUT id company - responsibleContact, telephone e serviceDescription (corretos) - Validar status 200 OK e dados retornados com sucesso
    [Tags]    put_id_company    regressao
    POST login (SYSADMIN), POST user (ADMIN), POST login (ADMIN) e obter tokens

    POST company

    PUT id company - responsibleContact, telephone e serviceDescription (corretos) - Validar status 200 OK e dados retornados com sucesso
    ...    idCompany=${ID_COMPANY}
    ...    corporateName=${CORPORATE_NAME}
    ...    registerCompany=${REGISTER_COMPANY}
    ...    mail=${MAIL_COMPANY}
    ...    matriz=${MATRIZ}  

PUT id company - responsibleContact incorreto (vazio) - Validar status 400 Bad Request e dados retornados com erro
    [Tags]    put_id_company_responsible_contact_vazio    
    POST login (SYSADMIN), POST user (ADMIN), POST login (ADMIN) e obter tokens

    POST company

    PUT id company - responsibleContact incorreto (vazio) - Validar status 400 Bad Request e dados retornados com erro
    ...    idCompany=${ID_COMPANY}
    ...    corporateName=${CORPORATE_NAME}
    ...    registerCompany=${REGISTER_COMPANY}
    ...    mail=${MAIL_COMPANY}
    ...    matriz=${MATRIZ}  

GET id company - responsibleContact, telephone e serviceDescription (corretos) - Validar status 200 OK e dados retornados com sucesso
    [Tags]    get_id_company    regressao
    POST login (SYSADMIN), POST user (ADMIN), POST login (ADMIN) e obter tokens

    POST company

    PUT id company - responsibleContact, telephone e serviceDescription (corretos) - Validar status 200 OK e dados retornados com sucesso
    ...    idCompany=${ID_COMPANY}
    ...    corporateName=${CORPORATE_NAME}
    ...    registerCompany=${REGISTER_COMPANY}
    ...    mail=${MAIL_COMPANY}
    ...    matriz=${MATRIZ}

    GET id company - responsibleContact, telephone e serviceDescription (corretos) - Validar status 200 OK e dados retornados com sucesso    idCompany=${ID_COMPANY}

GET id company incorreto (inexistente) - Validar status 400 Bad Request e dados retornados com erro
    [Tags]    get_id_company_inexistente    
    POST login (SYSADMIN), POST user (ADMIN), POST login (ADMIN) e obter tokens

    POST company

    PUT id company - responsibleContact, telephone e serviceDescription (corretos) - Validar status 200 OK e dados retornados com sucesso
    ...    idCompany=${ID_COMPANY}
    ...    corporateName=${CORPORATE_NAME}
    ...    registerCompany=${REGISTER_COMPANY}
    ...    mail=${MAIL_COMPANY}
    ...    matriz=${MATRIZ}

   GET id company incorreto (inexistente) - Validar status 400 Bad Request e dados retornados com erro   idCompany=${id_company_inexistente} 
