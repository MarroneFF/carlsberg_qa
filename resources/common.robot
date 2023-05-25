*** Settings ***
Documentation     A resource file with reusable keywords.

Library    SeleniumLibrary
Resource    ../resources/resource.robot

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${login_url}    ${browser}
    Maximize Browser Window
    Set Selenium Speed    ${delay}
    Login Page Should Be Open

Click Bugger Menu
    Click Button    ${burger_button}

Select All Items
    Click link    ${all_items}

Logout
	Click Bugger Menu
	Click Link    ${logout}

Login Page Should Be Open
    Title Should Be    Swag Labs