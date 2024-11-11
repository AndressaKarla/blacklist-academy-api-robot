*** Settings ***
Library     RequestsLibrary
Library     String
Library     Collections
Library		FakerLibrary	locale=pt_BR
Library     ../../resources/helpers.py
Resource    ../../resources/base.resource


*** Variables ***
${id_user}              ${EMPTY}
${email_vazio}		    ${EMPTY}
${senha_vazio}		    ${EMPTY}
${email_invalido}		sys@qacoders.com
${senha_invalida}		51@Test
${user_mail}            value


*** Keywords ***
Criar usuário  
	${cpf}		Gerar Cpf
	${mail}		FakerLibrary.Email
	${Primeiro_nome}	FakerLibrary.First Name
	${ultimo_nome}		FakerLibrary.Last Name
	${fullName}		Catenate	${Primeiro_nome}	${ultimo_nome}
	
	${body} 	Create Dictionary
	...		fullName=${fullName}
	...		mail=${mail}
	...		password=${PASSWORD_CONFIRM_PASSWORD}
	...		accessProfile=ADMIN
	...		cpf=${cpf}
	...		confirmPassword=${PASSWORD_CONFIRM_PASSWORD}

	Criar sessão

    ${headers}    Create Dictionary    Authorization=${TOKEN_SYSADMIN}

	${resposta}    POST On Session
    ...    alias=APIBlackList
    ...    url=/api/user
    ...    headers=${headers}
    ...    json=${body}
    ...    expected_status=201
	
	Set Suite Variable	${novo_user}	${resposta.json()['user']['fullName']} 
	Set Suite Variable	${user_mail}	${resposta.json()['user']['mail']}
	Set Suite Variable	${user_new_id}		${resposta.json()['user']['_id']}
	Set Suite Variable  ${id_user}			${resposta.json()['user']['_id']}
		
	Log To Console    \nnovo usuario
	Log To Console    ${novo_user}
	Log 		      ${novo_user}
	Log To Console    novo email
	Log To Console    ${user_mail}
	Log 		      ${user_mail}

Listar usuário
    Criar sessão

    ${headers}    Create Dictionary    Authorization=${TOKEN_SYSADMIN}

	${resposta}    GET On Session
    ...    alias=APIBlackList
    ...    url=/api/user/${id_user}
    ...    headers=${headers}
    ...    expected_status=200

	Log 	${resposta.json()}

Alterar senha
	${body} 	Create Dictionary
	...		password=${PASSWORD_CONFIRM_PASSWORD2}
	...		confirmPassword=${PASSWORD_CONFIRM_PASSWORD2}

	Criar sessão

    ${headers}    Create Dictionary    Authorization=${TOKEN_ADMIN}

	${resposta}    PUT On Session
    ...    alias=APIBlackList
    ...    url=api/user/password/${id_user}
    ...    headers=${headers}
    ...    json=${body}
    ...    expected_status=200

    Log 		${resposta.json()}

	Should Be Equal As Strings  ${resposta.json()['msg']}		Senha atualizada com sucesso!

Deletar usuário
	Criar sessão

    ${headers}    Create Dictionary    Authorization=${TOKEN_ADMIN}

	${resposta}    DELETE On Session
    ...    alias=APIBlackList
    ...    url=/api/user/${id_user}
    ...    headers=${headers}
    ...    expected_status=200

	Log  ${resposta.json()['msg']}	

	Should Be Equal As Strings  ${resposta.json()['msg']}		Usuário deletado com sucesso!.

Login campos vazios
	${body} 	Create Dictionary
	...		mail=${email_vazio}	
	...		password=${senha_vazio}
	
	Criar sessão

	${resposta}    POST On Session
    ...    alias=APIBlackList
    ...    url=api/login
    ...    json=${body}
    ...    expected_status=400
	
	Log To Console		\n${resposta}
	Log To Console		${resposta.json()['password']} 
	Log To Console		${resposta.json()['mail']} 
	Log 		${resposta}
	Log 		${resposta.json()['password']} 
	Log 		${resposta.json()['mail']} 

	Should Be Equal As Strings  ${resposta.json()['password']}		O campo senha é obrigatório.
	Should Be Equal As Strings  ${resposta.json()['mail']}		O campo e-mail é obrigatório.

	#verificando session abertas

	${return}	Session Exists	alias=APIBlackList	
	Log 	${return}

	#deletando sessions abertas

	Delete All Sessions

	${return}	Session Exists	alias=APIBlackList
	Log 	${return}

Login email inválido
	${body} 	Create Dictionary
	...		mail=${email_invalido}	
	...		password=${PASSWORD}
	
	Criar sessão

	${resposta}    POST On Session
    ...    alias=APIBlackList
    ...    url=api/login
    ...    json=${body}
    ...    expected_status=400	
	
	Log To Console		\n${resposta}
	Log To Console		${resposta.json()} 
	Log 		${resposta}
	Log 		${resposta.json()} 

	Should Be Equal As Strings  ${resposta.json()['alert']}		E-mail ou senha informados são inválidos.

	#verificando session abertas

	${return}	Session Exists	alias=APIBlackList	
	Log 	${return}

	#deletando sessions abertas

	Delete All Sessions

	${return}	Session Exists	alias=APIBlackList
	Log 	${return}

Login senha inválida
	${body} 	Create Dictionary
	...		mail=${MAIL_ADMIN}	
	...		password=${senha_invalida}
	
	Criar sessão

	${resposta}    POST On Session
    ...    alias=APIBlackList
    ...    url=api/login
    ...    json=${body}
    ...    expected_status=400	
	
	Log To Console		\n${resposta}
	Log To Console		${resposta.json()} 
	Log 		${resposta}
	Log 		${resposta.json()['alert']} 

	Should Be Equal As Strings  ${resposta.json()['alert']}		E-mail ou senha informados são inválidos.

	#verificando session abertas

	${return}	Session Exists	alias=APIBlackList	
	Log 	${return}

	#deletando sessions abertas

	Delete All Sessions

	${return}	Session Exists	alias=APIBlackList
	Log 	${return}