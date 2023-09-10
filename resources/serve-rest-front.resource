*** Settings ***
Library    Browser
Library    FakerLibrary

*** Variables ***
${BROWSER}            chromium
${HEADLESS}           ${false}
${SITE_SERVE_REST}    https://front.serverest.dev/        

*** Keywords ***
Abrir o navegador
    New Browser    browser=${BROWSER}
    ...            headless=${HEADLESS}
    
    New Context    viewport={'width': 1200, 'height': 800}

Ir para o site Serve Rest Front
    New Page              url=${SITE_SERVE_REST}

Preencher os dados do novo usuário e cadastrar
    #Click                css=.btn-link
    #Click                text="Cadastre-se"
    Click                 css=a[data-testid='cadastrar']
    ${EMAIL}              FakerLibrary.Email
    Fill Text             css=input[data-testid='nome']         Lete Miranda
    Fill Text             css=input[data-testid='email']        ${EMAIL}
    Fill Text             css=input[data-testid='password']     ${123456}
    Check Checkbox        css=input[data-testid='checkbox']     
    Click                 css=button[data-testid='cadastrar']
