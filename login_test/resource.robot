*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         aod-fontend.pages.dev
${BROWSER}        Chrome
${DELAY}         3
${VALID USER}     Admin@gmail.com
${VALID PASSWORD}    1234
${LOGIN URL}      https://${SERVER}/login
${WELCOME URL}    https://${SERVER}/home
${ERROR URL}      https://${SERVER}/login

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    สาธารณสุข

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    xpath=//input[@placeholder="Username"]    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    xpath=//input[@placeholder="Password"]      ${password}

Submit Credentials
    Click Button    css=.login-btn

Home Page Should Be Open
    Location Should Be    ${WELCOME URL}



