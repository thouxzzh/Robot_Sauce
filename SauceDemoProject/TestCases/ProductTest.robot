*** Settings ***
Library           SeleniumLibrary
Resource          ../Resources/GenericResource.robot
Resource          ../Resources/LoginResources.robot
Resource          ../Resources/ProductResources.robot

*** Test Cases ***
Add Multiple Items To Cart
    Open Browser To Login Page
    Fill Login Form    standard_user    secret_sauce
    Verify On Inventory Page
    Add Backpack To Cart
    Go To Cart
    Continue Shopping From Cart
    Add Bolt TShirt To Cart
    Go To Cart
    Verify Cart Items
    Close Browser Session
