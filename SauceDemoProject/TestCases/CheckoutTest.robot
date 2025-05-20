*** Settings ***
Library           SeleniumLibrary
Resource          ../Resources/GenericResource.robot
Resource          ../Resources/LoginResources.robot
Resource          ../Resources/ProductResources.robot
Resource          ../Resources/CheckoutResources.robot

*** Test Cases ***
Add Multiple Items To Cart
    [Template]    To verify the multiple items to the cart
    Shriya    S    890765
*** Keywords ***
To verify the multiple items to the cart
    [Arguments]    ${firstname}    ${lastname}    ${zipcode}
    Open Browser To Login Page
    Fill Login Form    standard_user    secret_sauce
    Verify On Inventory Page
    Add Backpack To Cart
    Go To Cart
    Continue Shopping From Cart
    Add Bolt TShirt To Cart
    Go To Cart
    Click Checkout button
    Enter the First Name,Last Name and Zip code    ${firstname}    ${lastname}    ${zipcode} 
    Click Continue button
    Verify the Items
    Click Finish Button
    Verify Checkout is completed
    Close Browser Session


