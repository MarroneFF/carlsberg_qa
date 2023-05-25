*** Settings ***
Documentation     A resource file with reusable variables.

Library    SeleniumLibrary

*** Variables ***
${server}         https://www.saucedemo.com
${browser}        Chrome
${delay}          0.5
${valid_user}     standard_user
${valida_password}    secret_sauce
${login_url}    https://www.saucedemo.com/
${welcome_url}    https://www.saucedemo.com/inventory.html
${username}    xpath://input[@id='user-name']
${password}    xpath://input[@id='password']
${login_button}    xpath://input[@id='login-button']
${standard_user}    standard_user
${cart}    xpath://a[@class='shopping_cart_link']
${cart_badge}   xpath://span[@class='shopping_cart_badge']
${cart_item}    xpath://div[@class='cart_item']
${title}    xpath://span[@class='title']
${burger_button}    xpath://button[@id='react-burger-menu-btn']
${all_items}    xpath://a[@id='inventory_sidebar_link']
${sauce_labs_onesie_add}    xpath://button[@id='add-to-cart-sauce-labs-onesie']
${product_sort}    xpath://select[@class='product_sort_container']
${hilo}    xpath://option[@value='hilo']
${sauce_labs_bike_light}    xpath://button[@id='add-to-cart-sauce-labs-bike-light']
${sauce_labs_backpack}    xpath://button[@id='add-to-cart-sauce-labs-backpack']

${cart_list}    xpath://div[@class='cart_list']

${first_name}    xpath://input[@id='first-name']
${last_name}    xpath://input[@id='last-name']
${postal_code}    xpath://input[@id='postal-code']
${button_continue}    xpath://input[@id='continue']

${subtotal}    xpath://div[@class='summary_subtotal_label']
${tax}    xpath://div[@class='summary_tax_label']
${total}    xpath://div[@class='summary_info_label summary_total_label']
${button_finish}    xpath://button[@id='finish']

${order_complete_container}    xpath://div[@id='checkout_complete_container']
${back_home}    xpath://button[@id='back-to-products']
${logout}   xpath://a[@id='logout_sidebar_link']