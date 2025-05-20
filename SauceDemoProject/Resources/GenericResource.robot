*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}      https://www.saucedemo.com/
${browser}  chrome

# *** Keywords ***
# Open Browser To Login Page
#     Open Browser    ${url}    ${browser}
#     Maximize Browser Window
#     Set Selenium Implicit Wait    5
*** Keywords ***
Open Browser To Login Page
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --incognito
    Call Method    ${options}    add_argument    --disable-extensions
    Call Method    ${options}    add_argument    --disable-notifications
    Call Method    ${options}    add_argument    --disable-popup-blocking
    Call Method    ${options}    add_argument    --start-maximized
    ${prefs}=    Evaluate    {"credentials_enable_service": False, "profile.password_manager_enabled": False}
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Create WebDriver    Chrome    options=${options}
    Go To    ${url}

Close Browser Session
    Close Browser
