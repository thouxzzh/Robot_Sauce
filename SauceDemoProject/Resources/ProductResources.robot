*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${INVENTORY_URL}      https://www.saucedemo.com/inventory.html
${CART_URL}           https://www.saucedemo.com/cart.html

${ADD_BACKPACK}       xpath://button[@id='add-to-cart-sauce-labs-backpack']
${ADD_BOLT_TSHIRT}    xpath:(//button[@class='btn btn_primary btn_small btn_inventory '])[2]
${CART_BUTTON}        xpath://a[@class='shopping_cart_link']
${CONTINUE_SHOPPING}  xpath://button[@id='continue-shopping']

@{EXPECTED_CART_ITEMS}    Sauce Labs Backpack    Sauce Labs Bolt T-Shirt

*** Keywords ***

Verify On Inventory Page
    Wait Until Location Is    ${INVENTORY_URL}    timeout=20
    Location Should Be        ${INVENTORY_URL}

Add Backpack To Cart
    Click Button    ${ADD_BACKPACK}

Add Bolt TShirt To Cart
    Click Button    ${ADD_BOLT_TSHIRT}

Go To Cart
    Click Element    ${CART_BUTTON}         
    Wait Until Location Is    ${CART_URL}    timeout=20
    Location Should Be        ${CART_URL}   

Continue Shopping From Cart
    Click Button    ${CONTINUE_SHOPPING}       
    Wait Until Location Is    ${INVENTORY_URL}    timeout=20
    Location Should Be        ${INVENTORY_URL}

Verify Cart Items
    ${cart_items}=    Get WebElements    xpath://div[@class='inventory_item_name']
    ${actual_items}=    Create List
    FOR    ${item}    IN    @{cart_items}
        ${name}=    Get Text    ${item}
        Log To Console  Item found in cart: ${name}
        Append To List    ${actual_items}    ${name}
    END
    Lists Should Be Equal    ${actual_items}    ${EXPECTED_CART_ITEMS}
