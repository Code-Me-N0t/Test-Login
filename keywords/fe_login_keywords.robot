*** Settings ***
Resource        ../settings/main_resources.robot

*** Keywords ***

I landed on
    [Arguments]        ${locator}
    Verify If Element Is Existing    ${locator}

I enter A
    [Arguments]        ${text}        ${locator}
    Type A Specific Text    ${locator}    ${text}

I click
    [Arguments]        ${locator}
    Click Specific Element    ${locator}

I should be redirected to the
    [Arguments]        ${locator}
    Verify If Element Is Existing    ${locator}

A message should display
    [Arguments]        ${text}    ${locator}
    ${error_message}=    Get Text    ${locator}
    ${error_message}=    Convert To Lower Case    ${error_message}
    Log    ${error_message}
    Should Contain    ${error_message}    ${text}