*** Settings ***
Library    Browser
Library    FakerLibrary

*** Variables ***
${BROWSER}            chromium
${HEADLESS}           ${false}
${SITE_SERVE_REST}    https://front.serverest.dev/login

*** Keywords ***
Abrir o navegador
    New Browser    browser=${BROWSER}
    ...            headless=${HEADLESS}
    
    New Context    viewport={'width': 1280, 'height': 720}

Ir para o site Serve Rest Front
    New Page       url=${SITE_SERVE_REST}

Preencher os dados do novo usuário e cadastrar
    Click        css=.btn-link
    # Click      text="Cadastre-se"
    # Click      css=a[data-testid="cadastrar"]
    # Record Selector
    ${EMAIL}     FakerLibrary.Email
    Fill Text    css=\#nome       Bárbara Andrade
    Fill Text    css=\#email       ${EMAIL}
    Fill Text    css=\#password    aluno123
    Check Checkbox    css=\#administrador
    Click        css=.btn-primary
    Sleep    5s