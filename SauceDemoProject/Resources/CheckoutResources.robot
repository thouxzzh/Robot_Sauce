*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***

${CHECKOUT}       xpath://button[@name='checkout']
${ADD_BOLT_TSHIRT}    xpath:(//button[@class='btn btn_primary btn_small btn_inventory '])[2]
${CART_BUTTON}        xpath://a[@class='shopping_cart_link']
${CONTINUE_SHOPPING}  xpath://button[@id='continue-shopping']
${CONTINUE_BUTTON}    xpath://input[@id='continue']

@{EXPECTED_CART_ITEMS}    Sauce Labs Backpack    Sauce Labs Bolt T-Shirt
${FINISH}    xpath://button[@name='finish']  

*** Keywords ***

Click Checkout button
    Click Button      ${CHECKOUT}

Enter the First Name,Last Name and Zip code
    [Arguments]    ${firstname}    ${lastname}    ${zipcode}
    Input Text    xpath=//input[@id='first-name']    ${firstname}
    Input Text    xpath=//input[@id='last-name']    ${lastname}
    Input Text    xpath=//input[@id='postal-code']     ${zipcode}

Click Continue button
     Click Button    ${CONTINUE_BUTTON}

Verify the Items
    ${cart_items}=    Get WebElements    xpath://div[@class='inventory_item_name']
    ${actual_items}=    Create List
    FOR    ${item}    IN    @{cart_items}
        ${name}=    Get Text    ${item}
        Log To Console  Item found in cart: ${name}
        Append To List    ${actual_items}    ${name}
    END
    Lists Should Be Equal    ${actual_items}    ${EXPECTED_CART_ITEMS}

Click Finish Button
    Click Button    ${FINISH}

Verify Checkout is completed
   Wait Until Location Is    https://www.saucedemo.com/checkout-complete.html    timeout=10
    Location Should Be       https://www.saucedemo.com/checkout-complete.html


