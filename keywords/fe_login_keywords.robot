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

I redirected to the
    [Arguments]        ${locator}
    Verify If Element Is Existing    ${locator}

A message should display
    [Arguments]        ${text}    ${locator}
    ${error_message}=    Get Text    ${locator}
    ${error_message}=    Convert To Lower Case    ${error_message}
    Log    ${error_message}
    Should Contain    ${error_message}    ${text}

The element should be
    [Arguments]        ${text}    ${locator}
    ${sort_text}=    Get Text    ${locator}
    Log    ${sort_text}
    Should Contain    ${sort_text}    ${text}

The element should display a
    [Arguments]    ${locator}    ${number}
    Verify If Element Is Existing    ${locator}
    ${badge_number}=    Get Text    ${locator}
    Should Contain    ${badge_number}    ${number}

The element should not display a
    [Arguments]    ${locator}    ${number}
    ${ans}=    Run Keyword And Return Status    Verify If Element Is Existing    ${locator}
    IF    ${ans}
        ${actual_text}=    Get Text    ${locator}
        Should Contain    ${actual_text}    ${number}
    END
        

I select
    [Arguments]    ${value}    ${locator}
    Click Specific Element    ${locator}
    Click Specific Element    ${value}