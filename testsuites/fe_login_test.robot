*** Settings ***
Resource        ../settings/main_resources.robot
Test Setup        Launch Testing Website        https://www.saucedemo.com/
Test Teardown        Main Teardown

*** Test Cases ***
Scenario 1: Positive Login
    [Tags]    LOGIN    POSITIVE    1727863167021    
    GIVEN I landed on   ${login_page}
    AND I enter a    ${registered_username}    ${username}
    AND I enter a    ${registered_password}    ${password}
    WHEN I click    ${submit}
    THEN I should be redirected to the    ${product_page}
Scenario 2: Negative Username Login
    [Tags]    LOGIN    NEGATIVE    1727863204556
    GIVEN I landed on   ${login_page}
    AND I enter a    ${unregistered_username}    ${username}
    AND I enter a    ${registered_password}    ${password}
    WHEN I click    ${submit}
    THEN A message should display    ${invalid_input_message}    ${error_message}
Scenario 3: Negative Password Login
    [Tags]    LOGIN    NEGATIVE    1727863246041
    GIVEN I landed on   ${login_page}
    AND I enter a    ${registered_username}    ${username}
    AND I enter a    ${unregistered_password}    ${password}
    WHEN I click    ${submit}
    THEN A message should display    ${invalid_input_message}    ${error_message}
Scenario 4: Empty Username Login
    [Tags]    LOGIN    NEGATIVE    1727863267274
    GIVEN I landed on   ${login_page}
    AND I enter a    ${unregistered_password}    ${password}
    WHEN I click    ${submit}
    THEN A message should display    ${require_username_message}    ${error_message}
Scenario 5: Empty Password Login
    [Tags]    LOGIN    NEGATIVE    1727863300910
    GIVEN I landed on   ${login_page}
    AND I enter a    ${unregistered_username}    ${username}
    WHEN I click    ${submit}
    THEN A message should display    ${require_password_message}    ${error_message}

Scenario 6: Sort A to Z
    [Tags]    SORT    1727863394254
    GIVEN I landed on    ${login_page}
    AND I enter A    ${registered_username}    ${username}
    AND I enter A    ${registered_password}    ${password}
    AND I click    ${submit}
    WHEN I redirected to the    ${product_page}
    THEN The element should be    Name (A to Z)    ${sort_active_option}

Scenario 7: Sort Z to A
    [Tags]    SORT    1727863448336
    GIVEN I landed on    ${login_page}
    AND I enter A    ${registered_username}    ${username}
    AND I enter A    ${registered_password}    ${password}
    AND I click    ${submit}
    WHEN I redirected to the    ${product_page}
    AND I click    ${sort}
    AND I click    css=option[value=za]
    THEN The element should be    Name (Z to A)    ${sort_active_option}

Scenario 8: Sort Low to High
    [Tags]    SORT    1727863533523
    GIVEN I landed on    ${login_page}
    AND I enter A    ${registered_username}    ${username}
    AND I enter A    ${registered_password}    ${password}
    AND I click    ${submit}
    WHEN I redirected to the    ${product_page}
    AND I click    ${sort}
    AND I click    css=option[value=lohi]
    THEN The element should be    Price (low to high)    ${sort_active_option}

Scenario 9: Sort High to Low
    [Tags]    SORT    1727863634391
    GIVEN I landed on    ${login_page}
    AND I enter A    ${registered_username}    ${username}
    AND I enter A    ${registered_password}    ${password}
    AND I click    ${submit}
    WHEN I redirected to the    ${product_page}
    AND I click    ${sort}
    AND I click    css=option[value=hilo]
    THEN The element should be    Price (high to low)    ${sort_active_option}

Scenario 10: Remove should display to an added product
    [Tags]    AddProduct    1727863860935
    GIVEN I landed on    ${login_page}
    AND I enter A    ${registered_username}    ${username}
    AND I enter A    ${registered_password}    ${password}
    AND I click    ${submit}
    AND I redirected to the    ${product_page}
    WHEN I click    id=add-to-cart-sauce-labs-backpack
    THEN The element should be    Remove    id=remove-sauce-labs-backpack

Scenario 11: A badge number should display
    [Tags]    AddProduct    1727863897914
    GIVEN I landed on    ${login_page}
    AND I enter A    ${registered_username}    ${username}
    AND I enter A    ${registered_password}    ${password}
    AND I click    ${submit}
    AND I redirected to the    ${product_page}
    WHEN I click    id=add-to-cart-sauce-labs-backpack
    THEN The element should display a    ${badge_number}    1

Scenario 12: Removing a product should remove the badge number
    [Tags]    RemoveProduct    1727863976927
    GIVEN I landed on    ${login_page}
    AND I enter A    ${registered_username}    ${username}
    AND I enter A    ${registered_password}    ${password}
    AND I click    ${submit}
    AND I redirected to the    ${product_page}
    WHEN I click    id=add-to-cart-sauce-labs-backpack
    AND I click    id=remove-sauce-labs-backpack
    THEN The element should not display a    ${badge_number}    0

Scenario 13: Clicking the added product should display "Add To Cart"
    [Tags]    RemoveProduct    1727864014637
    GIVEN I landed on    ${login_page}
    AND I enter A    ${registered_username}    ${username}
    AND I enter A    ${registered_password}    ${password}
    AND I click    ${submit}
    AND I redirected to the    ${product_page}
    WHEN I click    id=add-to-cart-sauce-labs-backpack
    WHEN I click    id=remove-sauce-labs-backpack
    THEN The element should be    Add to cart    id=add-to-cart-sauce-labs-backpack

Scenario 14: Clicking a product should redirect the page to Product Page
    [Tags]    NAVIGATION    1727864184534
    GIVEN I landed on    ${login_page}
    AND I enter A    ${registered_username}    ${username}
    AND I enter A    ${registered_password}    ${password}
    AND I click    ${submit}
    AND I redirected to the    ${product_page}
    WHEN I click    css=img[data-test=inventory-item-sauce-labs-bike-light-img]
    THEN I should be redirected to the    ${product_view_page}

Scenario 15: Clicking the cart icon should redirect the page to Cart Page
    [Tags]    NAVIGATION    1727864215514
    GIVEN I landed on    ${login_page}
    AND I enter A    ${registered_username}    ${username}
    AND I enter A    ${registered_password}    ${password}
    AND I click    ${submit}
    AND I redirected to the    ${product_page}
    WHEN I click    ${cart_icon}
    THEN I should be redirected to the    ${cart_page}

Scenario 18: Removing a product should update the badge number
    [Tags]    RemoveProduct2    1728355056490
    GIVEN I landed on    ${login_page}
    AND I enter A    ${registered_username}    ${username}
    AND I enter A    ${registered_password}    ${password}
    AND I click    ${submit}
    AND I redirected to the    ${product_page}
    WHEN I click    id=add-to-cart-sauce-labs-backpack
    WHEN I click    id=add-to-cart-sauce-labs-bike-light
    AND I click    id=remove-sauce-labs-backpack
    THEN The element should not display a    ${badge_number}    1