*** Settings ***
Resource        main_resources.robot

*** Keywords ***
Main Setup
    [Arguments]        ${url}
    Empty Directory    testsuites/screenshots
    Set Screenshot Directory    testsuites/screenshots
    Open Browser        ${url}        chrome
    Maximize Browser Window

Launch Testing Website
    [Arguments]        ${url}
    Main Setup        ${url}

Main Teardown
    Wait Until Keyword Succeeds    10s    1s    Capture Page Screenshot
    Close All Browsers