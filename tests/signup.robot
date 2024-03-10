*** Settings ***            
Documentation            Suite de testes de cadastro de dog walker

Resource    ../resources/base.resource

Test Setup        Start session
Test Teardown      Finish session

*** Test Cases ***
Deve poder cadastrar um novo dog walker   
    [Tags]    smoke
    
    ${dog_walker}    Create Dictionary         
    ...       name=Fernanda Souza        
    ...       email=souza@gmail.com    
    ...       cpf=56982200456
    ...       cep=18077362 
    ...       street=Rua Juarez Ferreira
    ...       district=Jardim do Carmo
    ...       city_uf=Sorocaba/SP
    ...       number=504
    ...       details=Casa 05 
    ...       cnh=toretto.jpg 

    Go to signup page
    Fill signup form          ${dog_walker}
    Submit signup form
    Popup shoud be      Recebemos o seu cadastro e em breve retornaremos o contato.
    
Não deve poder cadastrar se os campos obrigatórios não forem preenchidos  
    [Tags]    required

    Go to signup page
    Submit signup form

    Alert should be  Informe o seu nome completo
    Alert should be  Informe o seu melhor email
    Alert should be  Informe o seu CPF
    Alert should be  Informe o seu cep
    Alert should be  Informe um número maior que zero
    Alert should be  Adcione um documento com foto (RG ou CHN)

Não deve cadastra se o CFP for incorreto  
    [Tags]    cpf_inv

    ${dog_walker}    Create Dictionary         
    ...       name=Fernanda Souza        
    ...       email=souza@gmail.com    
    ...       cpf=5698220045b
    ...       cep=18077362 
    ...       street=Rua Juarez Ferreira
    ...       district=Jardim do Carmo
    ...       city_uf=Sorocaba/SP
    ...       number=504
    ...       details=Casa 05 
    ...       cnh=toretto.jpg 

    Go to signup page
    Fill signup form          ${dog_walker}
    Submit signup form
    Alert should be    CPF inválido
    
Deve poder cadastrar um novo dog walker que sabe cuidar de pets   
    [Tags]    aservice

    ${dog_walker}    Create Dictionary         
    ...       name=Um querido
    ...       email=querido@gmail.com
    ...       cpf=56652200456
    ...       cep=18077362 
    ...       street=Rua Juarez Ferreira
    ...       district=Jardim do Carmo
    ...       city_uf=Sorocaba/SP
    ...       number=620
    ...       details=Casa 12
    ...       cnh=toretto.jpg

    Go to signup page
    Fill signup form          ${dog_walker}
    additional Service        Cuidar
    Submit signup form
    Popup shoud be      Recebemos o seu cadastro e em breve retornaremos o contato.   

Deve poder cadastrar um novo dog walker que sabe adestrar de pets   
    [Tags]    aservice

    ${dog_walker}    Create Dictionary         
    ...       name=Mais que amigas friends
    ...       email=friends@gmail.com
    ...       cpf=56652200456
    ...       cep=18077362 
    ...       street=Rua Juarez Ferreira
    ...       district=Jardim do Carmo
    ...       city_uf=Sorocaba/SP
    ...       number=680
    ...       details=Casa 12
    ...       cnh=toretto.jpg

    Go to signup page
    Fill signup form          ${dog_walker}
    additional Service    Adestrar
    Submit signup form
    Popup shoud be      Recebemos o seu cadastro e em breve retornaremos o contato.       