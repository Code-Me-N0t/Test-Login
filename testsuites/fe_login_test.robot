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
    GIVEN I logged in using    ${registered_username}    ${registered_password}
    WHEN I landed on    ${product_page}
    THEN The element should contain    Name (A to Z)    ${sort_active_option}

Scenario 7: Sort Z to A
    [Tags]    SORT    1727863448336
    GIVEN I logged in using    ${registered_username}    ${registered_password}
    WHEN I landed on    ${product_page}
    AND I click    ${sort}
    AND I click    css=option[value=za]
    THEN The element should contain    Name (Z to A)    ${sort_active_option}

Scenario 8: Sort Low to High
    [Tags]    SORT    1727863533523
    GIVEN I logged in using    ${registered_username}    ${registered_password}
    WHEN I landed on    ${product_page}
    AND I click    ${sort}
    AND I click    css=option[value=lohi]
    THEN The element should contain    Price (low to high)    ${sort_active_option}

Scenario 9: Sort High to Low
    [Tags]    SORT    1727863634391
    GIVEN I logged in using    ${registered_username}    ${registered_password}
    WHEN I landed on    ${product_page}
    AND I click    ${sort}
    AND I click    css=option[value=hilo]
    THEN The element should contain    Price (high to low)    ${sort_active_option}

Scenario 10: Remove should display to an added product
    [Tags]    AddProduct    1727863860935
    GIVEN I logged in using    ${registered_username}    ${registered_password}
    WHEN I click    id=add-to-cart-sauce-labs-backpack
    THEN The element should contain    Remove    id=remove-sauce-labs-backpack

Scenario 11: A badge number should display
    [Tags]    AddProduct    1727863897914
    GIVEN I logged in using    ${registered_username}    ${registered_password}
    WHEN I click    id=add-to-cart-sauce-labs-backpack
    THEN The element should display a    ${badge_number}    1

Scenario 12: Removing a product should remove the badge number
    [Tags]    RemoveProduct    1727863976927
    GIVEN I logged in using    ${registered_username}    ${registered_password}
    WHEN I click    id=add-to-cart-sauce-labs-backpack
    AND I click    id=remove-sauce-labs-backpack
    THEN The element should not display a    ${badge_number}    0

Scenario 13: Clicking the added product should display "Add To Cart"
    [Tags]    RemoveProduct    1727864014637
    GIVEN I logged in using    ${registered_username}    ${registered_password}
    WHEN I click    id=add-to-cart-sauce-labs-backpack
    WHEN I click    id=remove-sauce-labs-backpack
    THEN The element should contain    Add to cart    id=add-to-cart-sauce-labs-backpack

Scenario 14: Clicking a product should redirect the page to Product Page
    [Tags]    NAVIGATION    1727864184534
    GIVEN I logged in using    ${registered_username}    ${registered_password}
    WHEN I click    css=img[data-test=inventory-item-sauce-labs-bike-light-img]
    THEN I should be redirected to the    ${product_view_page}

Scenario 15: Clicking the cart icon should redirect the page to Cart Page
    [Tags]    NAVIGATION    1727864215514
    GIVEN I logged in using    ${registered_username}    ${registered_password}
    WHEN I click    ${cart_icon}
    THEN I should be redirected to the    ${cart_page}

Scenario 16: Verify Sort Dropdown contains the expected sort options
    [Tags]    SORT    1727864252804
    GIVEN I logged in using    ${registered_username}    ${registered_password}
    WHEN I click    ${sort}
    THEN The following elements should display    ${sort}    
    ...    ['Name (A to Z)', 'Name (Z to A)', 'Price (low to high)', 'Price (high to low)']

Scenario 17: Verify that sidebar should diplay when the menu icon has been clicked
    [Tags]    NAVIGATION    1727864286008
    GIVEN I logged in using    ${registered_username}    ${registered_password}
    WHEN I click    ${menu_icon}
    THEN An element should display    ${sidebar}

Scenario 18: Verify "All Items" displays when opening the side navigation bar
    [Tags]    NAVIGATION    1727864375142
    GIVEN I logged in using    ${registered_username}    ${registered_password}
    WHEN I click    ${menu_icon}
    THEN The element should contain    All Items    ${inventory_tab}

Scenario 19: Verify "About" displays when opening the side navigation bar
    [Tags]    NAVIGATION    1727864425425
    GIVEN I logged in using    ${registered_username}    ${registered_password}
    WHEN I click    ${menu_icon}
    THEN The element should contain    About    ${about_tab}

Scenario 20: Verify "Logout" displays when opening the side navigation bar
    [Tags]    NAVIGATION    1727864432640
    GIVEN I logged in using    ${registered_username}    ${registered_password}
    WHEN I click    ${menu_icon}
    THEN The element should contain    Logout    ${logout_tab}

Scenario 21: Verify "Reset App State" displays when opening the side navigation bar
    [Tags]    NAVIGATION    1727864441733
    GIVEN I logged in using    ${registered_username}    ${registered_password}
    WHEN I click    ${menu_icon}
    THEN The element should contain    Reset App State    ${reset_tab}

Scenario 22: Verify About Page should display when About tab is clicked
    [Tags]    NAVIGATION    1727864456775
    GIVEN I logged in using    ${registered_username}    ${registered_password}
    AND I click    ${menu_icon}
    WHEN I click    ${about_tab}
    THEN I should be redirected to the    ${about_page}

Scenario 23: Verify page should Logged Out when Logout tab is clicked
    [Tags]    NAVIGATION    1727864498189
    GIVEN I logged in using    ${registered_username}    ${registered_password}
    AND I click    ${menu_icon}
    WHEN I click    ${logout_tab}
    THEN I should be redirected to the    ${login_page}

Scenario 24: Verify product's names should match product's images
    [Tags]    PRODUCT    1727864974837
    GIVEN I logged in using    ${registered_username}    ${registered_password}
    WHEN I landed on    ${product_page}
    THEN The product's names should match the product's images
    ...    ${item_name}    ${item_image}

Scenario 25: Removing a product should update the badge number
    [Tags]    RemoveProduct    1728355056490
    GIVEN I logged in using    ${registered_username}    ${registered_password}
    WHEN I click    id=add-to-cart-sauce-labs-backpack
    AND I click    id=add-to-cart-sauce-labs-bike-light
    AND I click    id=remove-sauce-labs-backpack
    THEN The element should not display a    ${badge_number}    1

Scenario 26: Removing multiple products should update the badge number
    [Tags]    RemoveProduct    1728367884314
    GIVEN I logged in using    ${registered_username}    ${registered_password}
    WHEN I click    id=add-to-cart-sauce-labs-backpack
    AND I click    id=add-to-cart-sauce-labs-bolt-t-shirt
    AND I click    id=add-to-cart-sauce-labs-bike-light
    AND I click    id=add-to-cart-sauce-labs-fleece-jacket
    AND I click    id=add-to-cart-sauce-labs-onesie
    AND I click    id=remove-sauce-labs-backpack
    AND I click    id=remove-sauce-labs-onesie
    THEN The element should not display a    ${badge_number}    3

Scenario 27: Verify added product should display in the Cart Page
    [Tags]    CartPage    1727865195624
    GIVEN I logged in using    ${registered_username}    ${registered_password}
    AND I click    id=add-to-cart-sauce-labs-backpack
    WHEN I click    ${cart_icon}
    AND I landed on    ${cart_page}
    THEN The product should display    Sauce Labs Backpack

Scenario 28: Verify clicking checkout should redirect to checkout information page
    [Tags]    CheckoutPage    1727865280336
    GIVEN I logged in using    ${registered_username}    ${registered_password}
    AND I click    id=add-to-cart-sauce-labs-backpack
    AND I click    ${cart_icon}
    AND I landed on    ${cart_page}
    WHEN I click    ${checkout_button}
    THEN I should be redirected to the    ${checkout_info_page}

Scenario 29: Verify clicking the Cart Icon should redirect the page to Cart Page
    [Tags]    CartPage    1727865323037
    GIVEN I logged in using    ${registered_username}    ${registered_password}
    WHEN I click    ${cart_icon}
    THEN I should be redirected to the    ${cart_page}

Scenario 30: Verify clicking "Continue Shopping" button should redirect the page back to Product Page
    [Tags]    CartPage    1727865354177
    GIVEN I logged in using    ${registered_username}    ${registered_password}
    AND I click    ${cart_icon}
    AND I landed on    ${cart_page}
    WHEN I click    ${continue_shopping_button}
    THEN I should be redirected to the    ${product_page}

Scenario 31: Verify going back to product page the added product should still be added
    [Tags]    CartPage    1727865393775
    GIVEN I logged in using    ${registered_username}    ${registered_password}
    AND I click    id=add-to-cart-sauce-labs-backpack
    AND I click    ${cart_icon}
    AND I landed on    ${cart_page}
    WHEN I click    ${continue_shopping_button}
    AND I landed on    ${product_page}
    THEN The element should contain    Remove    id=remove-sauce-labs-backpack

Scenario 32: Verify clicking "All Items" tab should redirect to product page
    [Tags]    CartPage    1727865424706
    GIVEN I logged in using    ${registered_username}    ${registered_password}
    AND I click    ${cart_icon}
    AND I click    ${cart_page}
    WHEN I click    ${menu_icon}
    AND I click    ${inventory_tab}
    THEN I should be redirected to the    ${product_page}

Scenario 33: Verify added products should have Product Quantity displayed
    [Tags]    CartPage    1727865511602
    GIVEN I logged in using    ${registered_username}    ${registered_password}
    AND I click    id=add-to-cart-sauce-labs-backpack
    AND I click    ${cart_icon}
    WHEN I click    ${cart_page}
    AND I landed on    ${cart_page}
    THEN The element should contain    1    ${cart_item}

Scenario 34: Verify added products should have Product Price displayed
    [Tags]    CartPage    1727865540066
    GIVEN I logged in using    ${registered_username}    ${registered_password}
    AND I click    id=add-to-cart-sauce-labs-backpack
    AND I click    ${cart_icon}
    WHEN I click    ${cart_page}
    AND I landed on    ${cart_page}
    THEN The element should contain    29.99    ${cart_item}

Scenario 35: Verify added products should have Product Name displayed
    [Tags]    CartPage    1727865580993
    GIVEN I logged in using    ${registered_username}    ${registered_password}
    AND I click    id=add-to-cart-sauce-labs-backpack
    AND I click    ${cart_icon}
    WHEN I click    ${cart_page}
    AND I landed on    ${cart_page}
    THEN The element should contain    Sauce Labs Backpack    ${cart_item}

Scenario 36: Verify added products should have Product Description displayed
    [Tags]    CartPage    1727865594900
    GIVEN I logged in using    ${registered_username}    ${registered_password}
    AND I click    id=add-to-cart-sauce-labs-backpack
    AND I click    ${cart_icon}
    WHEN I click    ${cart_page}
    AND I landed on    ${cart_page}
    THEN The element should contain    
    ...    with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection.    
    ...    ${cart_item}

Scenario 37: Verify removing product in Cart Page should remove the product on the page
    [Tags]    CartPage    1727865606124
    GIVEN I logged in using    ${registered_username}    ${registered_password}
    AND I click    id=add-to-cart-sauce-labs-backpack
    AND I click    ${cart_icon}
    AND I click    ${cart_page}
    AND The element should contain    Sauce Labs Backpack    ${cart_item}
    WHEN I click    id=remove-sauce-labs-backpack
    THEN The product should not display    Sauce Labs Backpack