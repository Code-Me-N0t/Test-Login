*** Settings ***
Resource        ../settings/main_resources.robot

*** Keywords ***
I landed on
    [Arguments]        ${locator}
    Verify If Element Is Existing    ${locator}

I enter a
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
    ${expected_message}=    Get Text    ${locator}
    ${expected_message}=    Convert To Lower Case    ${expected_message}
    ${actual_message}=    Convert To Lower Case    ${text}
    Log    ${expected_message}
    Should Contain    ${expected_message}    ${actual_message}

An element should display
    [Arguments]    ${locator}
    Wait Until Keyword Succeeds    10s    1s    Element Should Be Visible    ${locator}
    ${element_value}=    Get Element Attribute    ${locator}    aria-hidden
    Should Be Equal    ${element_value}    false

The element should contain
    [Arguments]        ${text}    ${locator}
    Wait Until Element Is Visible    ${locator}    10s
    ${sort_text}=    Get Text    ${locator}
    Log    ${sort_text}
    Should Contain    ${sort_text}    ${text}

The product should display
    [Arguments]    ${text}
    Page Should Contain    ${text}

The product should not display
    [Arguments]    ${text}
    Page Should Not Contain    ${text}

The element should display a
    [Arguments]    ${locator}    ${number}
    Verify If Element Is Existing    ${locator}
    ${badge_number}=    Get Text    ${locator}
    Should Contain    ${badge_number}    ${number}

The element should display
    [Arguments]    ${locator}
    Verify If Element Is Existing    ${locator}

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

The following elements should display
    [Arguments]    ${locator}    ${expected_string}
    Wait Until Element Is Visible    ${locator}    timeout=10s
    ${item_text}=    Get Text    ${locator}
    ${result}=    Split String    ${item_text}    \n
    
    ${expected_list}=    Evaluate    ${expected_string}
    
    ${length}=    Get Length    ${result}
    
    FOR    ${index}    IN RANGE    ${length}
        ${actual}=    Get From List    ${result}    ${index}
        ${expected}=    Get From List    ${expected_list}    ${index}
        Log    Actual: ${actual} and Expected: ${expected}
        Should Be Equal    ${actual}    ${expected}
    END

I logged in using
    [Arguments]    ${username_credential}    ${password_credential}
    I landed on    ${login_page}
    I enter a    ${username_credential}    ${username}
    I enter a    ${password_credential}    ${password}
    I click    ${submit}
    I landed on    ${product_page}

I add to cart
    [Arguments]    ${locator}
    AND I click    ${locator}
    AND I click    ${cart_icon}
    AND I landed on    ${cart_page}
    AND I click    ${checkout_button}
    AND I landed on    ${checkout_info_page}

I entered valid credentials
    [Arguments]    ${locator}
    AND I enter a    ${valid_first_name}    ${first_name}
    AND I enter a    ${valid_last_name}    ${last_name}
    AND I enter a    ${valid_postal_code}    ${postal_code}
    WHEN I click    ${continue_button}
    THEN I should be redirected to the    ${locator}

The product's names should match the product's images
    [Arguments]    ${product_name_locator}    ${product_img_locator}

    ${product_names}=    Get WebElements    ${product_name_locator}
    ${product_images}=    Get WebElements    ${product_img_locator}

    FOR    ${product_name_element}    ${product_image_element}    IN ZIP    ${product_names}    ${product_images}
        Wait Until Element Is Visible    ${product_name_element}
        ${product_name}=    Get Text    ${product_name_element}

        Wait Until Element Is Visible    ${product_image_element}
        ${product_image}=    Convert URL to String    ${product_image_element}
        
        Log    Product Name: ${product_name}, Product Image Text: ${product_image}

        ${product_image_list}=    Strip String    ${product_image}
        ${product_name_list}=    Strip String    ${product_name}
        
        ${common_texts}=    Create List
        FOR    ${image}    IN    @{product_image_list}
            FOR    ${name}    IN    @{product_name_list}
                Log    Image: ${image}, Name: ${name}
                IF    "${image}" == "${name}"
                    Append To List    ${common_texts}    ${image}
                    Log    ${common_texts}
                END
            END
        END
        
        Log    ${common_texts}
        Should Not Be Empty    ${common_texts}
    END

Convert URL to String
    [Arguments]    ${locator}
    ${element_attrib_value}=    Get Element Attribute    ${locator}    src
    ${element_value_str1}=    Replace String    ${element_attrib_value}    https://www.saucedemo.com/static/media/    ${EMPTY}
    ${element_value_str2}=    Replace String    ${element_value_str1}    -    ${SPACE}
    ${element_value_split}=    Split String    ${element_value_str2}    ${SPACE}
    ${string}=    Set Variable    ${element_value_split[0]} ${element_value_split[1]}
    RETURN    ${string}

Strip String
    [Arguments]    ${text}
    ${lower_case_text}=    Convert To Lower Case    ${text}
    ${replaced_string}=    Replace String Using Regexp    ${lower_case_text}    [.\\)\\(\\-\\$]    ${EMPTY}
    ${stripped_text}=    Split String    ${replaced_string}    ${SPACE}
    Log    ${stripped_text}
    RETURN    ${stripped_text}

The product's images should match
    [Arguments]    ${locator1}    ${locator2}
    ${expected_string_url}=    Convert URL to String    ${locator1}

    I click    ${locator1}

    ${actual_string_url}=    Convert URL to String    ${locator2}

    Log    Expected:${expected_string_url}, Actual:${actual_string_url}

    Should Be Equal    ${expected_string_url}    ${actual_string_url}

The total price should display correct computation    
    [Arguments]    ${value1_locator}    ${value2_locator}    ${total_value_locator}
    ${price}=    Get Text    ${value1_locator}
    ${price}=    Replace String Using Regexp    ${price}    [^0-9.]    ${EMPTY}
    ${added_tax}=    Get Text    ${value2_locator}
    ${added_tax}=    Replace String Using Regexp    ${added_tax}    [^0-9.]    ${EMPTY}
    ${actual_total_value}=    Get Text    ${total_value_locator}
    ${actual_total_value}=    Replace String Using Regexp    ${actual_total_value}    [^0-9.]    ${EMPTY}
    ${actual_total_value}=    Evaluate    float(${actual_total_value})

    ${expected_total_value}=    Evaluate    round(float(${price}) + float(${added_tax}), 2)
    Log    ${expected_total_value}

    Should Be Equal    ${expected_total_value}    ${actual_total_value}