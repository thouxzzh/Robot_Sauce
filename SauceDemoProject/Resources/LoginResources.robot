*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${USERNAME_FIELD}      xpath://input[@name='user-name']
${PASSWORD_FIELD}      xpath://input[@name='password']
${LOGIN_BUTTON}        xpath://input[@name='login-button']
${ERROR_MSG_LOCATOR}   xpath://h3

*** Keywords ***
Fill Login Form
    [Arguments]    ${username}    ${password}
    Input Text    ${USERNAME_FIELD}    ${username}
    Input Password    ${PASSWORD_FIELD}    ${password}
    Click Button    ${LOGIN_BUTTON}

Validate Username Required Error
    Wait Until Element Is Visible    ${ERROR_MSG_LOCATOR}    timeout=5
    Element Should Contain    ${ERROR_MSG_LOCATOR}    Epic sadface: Username is required

Validate Password Required Error
    Wait Until Element Is Visible    ${ERROR_MSG_LOCATOR}    timeout=5
    Element Should Contain    ${ERROR_MSG_LOCATOR}    Epic sadface: Password is required

Validate Successful Login
    Wait Until Location Is    https://www.saucedemo.com/inventory.html    timeout=10
    Location Should Be       https://www.saucedemo.com/inventory.html

Validate Invalid Credentials Error
    Wait Until Element Is Visible    ${ERROR_MSG_LOCATOR}    timeout=5
    Element Should Contain    ${ERROR_MSG_LOCATOR}    Epic sadface: Username and password do not match any user in this service

Validate Locked Out User Error
    Wait Until Element Is Visible    ${ERROR_MSG_LOCATOR}    timeout=5
    Element Should Contain    ${ERROR_MSG_LOCATOR}    Epic sadface: Sorry, this user has been locked out.

