*** Settings ***
Documentation     Exercise_1, not finalised.

Library   Screenshot
Library           RequestsLibrary
Library    SeleniumLibrary
Library    JSONLibrary
Library           Collections
Library           String

*** Variables ***
${api}    Game of Thrones

*** Test Cases ***
Get Name Of All Houses
    Retrieve All Houses

*** Keywords ***
Retrieve All Houses
    ${headers}=    Create Dictionary    Accept=*/*
    Create Session  Got  https://www.anapioficeandfire.com/api
    ${response}    Get On Session    GoT    https://www.anapioficeandfire.com/api/houses    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
    set test variable    ${response}    ${response}
    Set Test Variable    ${response_body}    ${response.content}

    ${json_data}    Evaluate    json.loads(${response.content})

    Set test variable    ${json_objetc}    ${json_data}
    Dump Json to file    response_file.json    ${json_data}