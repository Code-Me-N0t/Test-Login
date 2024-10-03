*** Settings ***
Resource        ../settings/main_resources.robot
Test Setup        Launch Testing Website        https://www.saucedemo.com/
Test Teardown        Main Teardown

*** Test Cases ***
Scenario 1: Positive Login
    [Tags]    POSITIVE    1727863167021
    GIVEN I landed on   ${login_page}
    AND I enter a    ${registered_username}    ${username}
    AND I enter a    ${registered_password}    ${password}
    WHEN I click    ${submit}
    THEN I should be redirected to the    ${product_page}
Scenario 2: Negative Username Login
    [Tags]    NEGATIVE    1727863204556
    GIVEN I landed on   ${login_page}
    AND I enter a    ${unregistered_username}    ${username}
    AND I enter a    ${registered_password}    ${password}
    WHEN I click    ${submit}
    THEN A message should display    ${invalid_input_message}    ${error_message}
Scenario 3: Negative Password Login
    [Tags]    NEGATIVE    1727863246041
    GIVEN I landed on   ${login_page}
    AND I enter a    ${registered_username}    ${username}
    AND I enter a    ${unregistered_password}    ${password}
    WHEN I click    ${submit}
    THEN A message should display    ${invalid_input_message}    ${error_message}
