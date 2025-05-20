*** Settings ***
Library           SeleniumLibrary
Library           DataDriver    file=../Resources/Logindata.xlsx.xlsx    sheet_name=Sheet1
Resource          ../Resources/GenericResource.robot
Resource          ../Resources/LoginResources.robot
Test Template     Validate Login

*** Variables ***
${username}
${password}

*** Test Cases ***
Login Test with ${username}    ${password}

*** Keywords ***
Validate Login
    [Arguments]    ${username}    ${password}
    Open Browser To Login Page
    Fill Login Form    ${username}    ${password}

    Run Keyword If    '${username}' == ''    Validate Username Required Error
    ...    ELSE IF    '${password}' == ''    Validate Password Required Error
    ...    ELSE IF    '${username}' == 'locked_out_user'    Validate Locked Out User Error
    ...    ELSE IF    '${username}' == 'standard_user' or '${password}' == 'secret_sauce'    Validate Successful Login
    ...    ELSE    Validate Invalid Credentials Error

    Close Browser Session
