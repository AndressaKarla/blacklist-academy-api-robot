*** Settings ***
Library     RequestsLibrary
Library     String
Library     Collections
Library     ../../resources/helpers.py
Resource    ../../resources/base.resource


*** Variables ***
${message_esperada}                 Companhia atualizada com sucesso.
${responsible_contact_esperado}     Teste Contato Responsável Alterado
${telephone_esperado}               5569983053186
${service_description_esperada}     Teste Descrição Serviço Company Blacklist Alterado

${id_company_inexistente}    66f75558b8d32c9e73d9a6d9


*** Keywords ***
Gerar corporateName company dinâmico
    ${corporateName}    Gerar Corporate Name
    Set Test Variable    ${CORPORATE_NAME}    ${corporateName}

Gerar mail company dinâmico
    ${mail}    Gerar Mail Company
    Set Test Variable    ${MAIL_COMPANY}    ${mail}

Gerar registerCompany dinâmico
    ${cnpj}    Gerar Cnpj
    Set Test Variable    ${CNPJ}    ${cnpj}

Gerar serviceDescription dinâmico
    ${serviceDescription}    Gerar Service Description
    Set Test Variable    ${SERVICE_DESCRIPTION}    ${serviceDescription}

Gerar dados company dinâmicos
    Gerar corporateName company dinâmico
    Gerar mail company dinâmico
    Gerar registerCompany dinâmico
    Gerar serviceDescription dinâmico

POST company, obter id, corporateName, registerCompany, mail e matriz
    [Arguments]    ${corporateName}    ${registerCompany}    ${mail}    ${serviceDescription}
    ${address}    Create Dictionary
    ...    zipCode=52160231
    ...    city=Recife
    ...    state=PE
    ...    district=Dois Unidos
    ...    street=Rua A
    ...    number=52
    ...    complement=Conj Hab Hélio Seixas
    ...    country=Brasil

    ${address_list}    Create List    ${address}

    ${body}    Create Dictionary
    ...    corporateName=${corporateName}
    ...    registerCompany=${registerCompany}
    ...    mail=${mail}
    ...    matriz=Teste Matriz Blacklist
    ...    responsibleContact=Teste Contato Responsável
    ...    telephone=5519999717753
    ...    serviceDescription=${serviceDescription}
    ...    address=${address_list}
    Log    ${body}

    Criar sessão

    ${headers}    Create Dictionary    Authorization=${TOKEN_ADMIN}

    ${response_post_company}    POST On Session
    ...    alias=APIBlackList
    ...    url=/api/company
    ...    headers=${headers}
    ...    json=${body}
    ...    expected_status=201

    Set Local Variable    ${JSON_DATA_POST_COMPANY}    ${response_post_company.json()}
    Set Test Variable    ${ID_COMPANY}    ${JSON_DATA_POST_COMPANY['newCompany']['_id']}
    Set Test Variable    ${CORPORATE_NAME}    ${JSON_DATA_POST_COMPANY['newCompany']['corporateName']}
    Set Test Variable    ${REGISTER_COMPANY}    ${JSON_DATA_POST_COMPANY['newCompany']['registerCompany']}
    Set Test Variable    ${MAIL_COMPANY}    ${JSON_DATA_POST_COMPANY['newCompany']['mail']}
    Set Test Variable    ${MATRIZ}    ${JSON_DATA_POST_COMPANY['newCompany']['matriz']}

POST company
    Gerar dados company dinâmicos

    POST company, obter id, corporateName, registerCompany, mail e matriz
    ...    corporateName=${CORPORATE_NAME}
    ...    registerCompany=${CNPJ}
    ...    mail=${MAIL_COMPANY}
    ...    serviceDescription=${SERVICE_DESCRIPTION}

PUT id company - responsibleContact, telephone e serviceDescription (corretos) - Validar status 200 OK e dados retornados com sucesso
    [Arguments]    ${idCompany}    ${corporateName}    ${registerCompany}    ${mail}    ${matriz}
    ${body}    Create Dictionary
    ...    corporateName=${corporateName}
    ...    registerCompany=${registerCompany}
    ...    mail=${mail}
    ...    matriz=${matriz}
    ...    responsibleContact=Teste Contato Responsável Alterado
    ...    telephone=5569983053186
    ...    serviceDescription=Teste Descrição Serviço Company Blacklist Alterado
    Log    ${body}

    Criar sessão

    ${headers}    Create Dictionary    Authorization=${TOKEN_ADMIN}

    ${response_put_id_company}    PUT On Session
    ...    alias=APIBlackList
    ...    url=/api/company/${idCompany}
    ...    headers=${headers}
    ...    json=${body}
    ...    expected_status=200

    Set Local Variable    ${RESPONSE_PUT_ID_COMPANY}    ${response_put_id_company}
    Set Local Variable    ${JSON_DATA_PUT_COMPANY}    ${response_put_id_company.json()}
    Log    ${JSON_DATA_PUT_COMPANY}

    Should Be Equal    ${RESPONSE_PUT_ID_COMPANY.status_code}    ${200}
    Should Be Equal As Strings    OK    ${RESPONSE_PUT_ID_COMPANY.reason}
    Dictionary Should Contain Item    ${JSON_DATA_PUT_COMPANY}    msg    ${message_esperada}
    Dictionary Should Contain Item    ${JSON_DATA_PUT_COMPANY['updatedCompany']}    responsibleContact    ${responsible_contact_esperado}
    Dictionary Should Contain Item    ${JSON_DATA_PUT_COMPANY['updatedCompany']}    telephone    ${telephone_esperado}
    Dictionary Should Contain Item    ${JSON_DATA_PUT_COMPANY['updatedCompany']}    serviceDescription    ${service_description_esperada}

PUT id company - responsibleContact incorreto (vazio) - Validar status 400 Bad Request e dados retornados com erro
    [Arguments]    ${idCompany}    ${corporateName}    ${registerCompany}    ${mail}    ${matriz}
    ${body}    Create Dictionary
    ...    corporateName=${corporateName}
    ...    registerCompany=${registerCompany}
    ...    mail=${mail}
    ...    matriz=${matriz}
    ...    responsibleContact=
    ...    telephone=5569983053186
    ...    serviceDescription=Teste Descrição Serviço Company Blacklist Alterado
    Log    ${body}

    Criar sessão

    ${headers}    Create Dictionary    Authorization=${TOKEN_ADMIN}

    ${response_put_id_company}    PUT On Session
    ...    alias=APIBlackList
    ...    url=/api/company/${idCompany}
    ...    headers=${headers}
    ...    json=${body}
    ...    expected_status=400

    Set Local Variable    ${RESPONSE_PUT_ID_COMPANY}    ${response_put_id_company}
    Set Local Variable    ${JSON_DATA_PUT_COMPANY}    ${response_put_id_company.json()}
    Log    ${JSON_DATA_PUT_COMPANY}

    Should Be Equal    ${RESPONSE_PUT_ID_COMPANY.status_code}    ${400}
    Should Be Equal As Strings    Bad Request    ${RESPONSE_PUT_ID_COMPANY.reason}
    Should Be Equal As Strings   ${JSON_DATA_PUT_COMPANY['error'][0]}    O campo 'Contado do Responsável' é obrigatório.

GET id company - responsibleContact, telephone e serviceDescription (corretos) - Validar status 200 OK e dados retornados com sucesso
    [Arguments]    ${idCompany}

    ${headers}    Create Dictionary    Authorization=${TOKEN_ADMIN}

    ${response_get_id_company}    GET On Session
    ...    alias=APIBlackList
    ...    url=/api/company/${idCompany}
    ...    headers=${headers}
    ...    expected_status=200

    Set Local Variable    ${RESPONSE_GET_ID_COMPANY}    ${response_get_id_company}
    Set Local Variable    ${JSON_DATA_GET_ID_COMPANY}    ${response_get_id_company.json()}
    Log    ${JSON_DATA_GET_ID_COMPANY}

    Should Be Equal    ${RESPONSE_GET_ID_COMPANY.status_code}    ${200}
    Should Be Equal As Strings    OK    ${RESPONSE_GET_ID_COMPANY.reason}
    Dictionary Should Contain Item    ${JSON_DATA_GET_ID_COMPANY}    responsibleContact    ${responsible_contact_esperado}
    Dictionary Should Contain Item    ${JSON_DATA_GET_ID_COMPANY}    telephone    ${telephone_esperado}
    Dictionary Should Contain Item    ${JSON_DATA_GET_ID_COMPANY}    serviceDescription    ${service_description_esperada}

GET id company incorreto (inexistente) - Validar status 400 Bad Request e dados retornados com erro
    [Arguments]    ${idCompany}

    ${headers}    Create Dictionary    Authorization=${TOKEN_ADMIN}

    ${response_get_id_company}    GET On Session
    ...    alias=APIBlackList
    ...    url=/api/company/${idCompany}
    ...    headers=${headers}
    ...    expected_status=400

    Set Local Variable    ${RESPONSE_GET_ID_COMPANY}    ${response_get_id_company}
    Set Local Variable    ${JSON_DATA_GET_ID_COMPANY}    ${response_get_id_company.json()}
    Log    ${JSON_DATA_GET_ID_COMPANY}

    Should Be Equal    ${RESPONSE_GET_ID_COMPANY.status_code}    ${400}
    Should Be Equal As Strings    Bad Request   ${RESPONSE_GET_ID_COMPANY.reason}
    Should Be Equal As Strings   ${JSON_DATA_GET_ID_COMPANY['alert'][0]}    Essa companhia não existe em nosso sistema.
