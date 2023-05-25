*** Settings ***
Documentation    Test the end

Library     SeleniumLibrary
Library    Collections
Resource    ../resources/resource.robot
Resource    ../resources/common.robot

Test Teardown    Close Browser

*** Test Cases ***

Shopping at Swag Labs
    Open Browser To Login Page
    Login As Standard User
    Check Cart Is Empty
    Select “All Items” in burger menu
    Add "Sauce Labs Onesie" to Cart
    Change sort order to “Price (high to low)”
    Add “Sauce Labs Bike Light” to cart
    Change sort order to “Price (low to high)”
    Add “Sauce Labs Backpack” to cart
    Open Cart
    Verify added items, quantities and prices in cart
    Remove “Sauce Labs Onesie” from cart
    Go to checkout
    Fill checkout information
    Click continue button
    Verify items, quantities and prices in checkout overview
    Click Finish button
    Verify successful order completion
    Click back home button
    Logout

*** Keywords ***
Login As Standard User
    Input text    ${username}    ${standard_user}
    Input password    ${password}    secret_sauce
    Click Button    ${login_button}

Check Cart Is Empty
    Click Link    ${cart}
    Page should not contain element    ${cart_badge}

Select “All Items” in burger menu
    Click Bugger Menu
    Select All Items

Add "Sauce Labs Onesie" To Cart
    Scroll Element Into View    ${sauce_labs_onesie_add}
    Click Button    ${sauce_labs_onesie_add}
    Element Text Should Be    ${cart_badge}    1

Change sort order to “Price (high to low)”
    Select From List By Value    ${product_sort}    hilo
    List Selection Should Be    ${product_sort}    Price (high to low)

Add “Sauce Labs Bike Light” to cart
	Scroll Element Into View    ${sauce_labs_bike_light}
    Click Button    ${sauce_labs_bike_light}
    Element Text Should Be    ${cart_badge}    2

Change sort order to “Price (low to high)”
	Select From List By Value    ${product_sort}    lohi
    List Selection Should Be    ${product_sort}    Price (low to high)

Add “Sauce Labs Backpack” to cart
	Scroll Element Into View    ${sauce_labs_backpack}
	Click Button    ${sauce_labs_backpack}
	Element Text Should Be    ${cart_badge}    3

Open Cart
	Click Link    ${cart}
	Page should contain element    ${cart_item}
    Element Text Should Be    ${title}    Your Cart

Verify added items, quantities and prices in cart
	${itemsDoCarrinho}=    Get Webelements    ${cart_list}
    Set Test Variable    ${itemsDoCarrinho}
	FOR    ${elements}    IN    ${itemsDoCarrinho}
    ${txt}=    Get Text    ${elements}
    Log    ${txt}
    Set Test Variable    ${txt}
	END
	#Validate the quantities in the cart
	Page Should Contain Element    (//div[@class='cart_item'])    limit=3
	#Validate items
	Should Contain Any    ${txt}    Sauce Labs Onesie    Sauce Labs Bike Light    Sauce Labs Backpack    msg=Cart items are correct
	#Validate the prices
	Should Contain Any    ${txt}    $7.99    $9.99    $29.99

Remove “Sauce Labs Onesie” from cart
	Click Button    xpath://button[@id='remove-sauce-labs-onesie']

Go to checkout
	Click Button    xpath://button[@id='checkout']
	Element Text Should Be    ${title}    Checkout: Your Information

Fill checkout information
	Input Text    ${first_name}     Charlie
	Input Text    ${last_name}    Brown
	Input Text    ${postal_code}    2775

Click continue button
	Click Button    ${button_continue}

Verify items, quantities and prices in checkout overview
	Element Text Should Be    xpath://span[@class='title']    Checkout: Overview
	${items_checkout}=    Get Webelements    ${cart_list}
    Set Test Variable    ${items_checkout}
	FOR    ${elements}    IN    ${items_checkout}
    ${txt}=    Get Text    ${elements}
    Log    ${txt}
    Set Test Variable    ${txt}
	END
	#Validate the quantities in checkout
	Page Should Contain Element    (//div[@class='cart_item'])    limit=2
	#Validate items
	Should Contain Any    ${txt}    Sauce Labs Bike Light    Sauce Labs Backpack    msg=Checkout items are correct
	#Validate the prices
	Should Contain Any    ${txt}    $9.99    $29.99
	#Validate subtotal, tax and total
	Element Should Contain    ${subtotal}    39.98
	Element Should Contain    ${tax}    3.20
	Element Should Contain    ${total}    43.18

Click Finish button
	Click Button    ${button_finish}

Verify successful order completion
	${order_complete}=    Get Webelements    ${order_complete_container}
    Set Test Variable    ${order_complete}
	FOR    ${elements}    IN    ${order_complete}
    ${txt}=    Get Text    ${elements}
    Log    ${txt}
    Set Test Variable    ${txt}
	END
	Should Contain Any    ${txt}    Thank you for your order!    Your order has been dispatched, and will arrive just as fast as the pony can get there!

Click back home button
	Click Button    ${back_home}