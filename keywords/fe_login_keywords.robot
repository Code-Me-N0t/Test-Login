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

I redirected to the
    [Arguments]        ${locator}
    Verify If Element Is Existing    ${locator}

A message should display
    [Arguments]        ${text}    ${locator}
    ${error_message}=    Get Text    ${locator}
    ${error_message}=    Convert To Lower Case    ${error_message}
    Log    ${error_message}
    Should Contain    ${error_message}    ${text}

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
    I redirected to the    ${product_page}

The product's names should match the product's images
    [Arguments]    ${product_name_locator}    ${product_img_locator}

    ${product_names}=    Get WebElements    ${product_name_locator}
    ${product_images}=    Get WebElements    ${product_img_locator}

    FOR    ${product_name_element}    ${product_image_element}    IN ZIP    ${product_names}    ${product_images}
        Wait Until Element Is Visible    ${product_name_element}
        ${product_name}=    Get Text    ${product_name_element}

        Wait Until Element Is Visible    ${product_image_element}
        ${product_image_value}=    Get Element Attribute    ${product_image_element}    src
        ${product_image_str1}=    Replace String    ${product_image_value}    https://www.saucedemo.com/static/media/    ${EMPTY}
        ${product_image_str2}=    Replace String    ${product_image_str1}    -    ${SPACE}
        
        ${product_image_split}=    Split String    ${product_image_str2}    ${SPACE}
        ${product_image}=    Set Variable    ${product_image_split[0]} ${product_image_split[1]}
        
        Log    Product Name: ${product_name}, Product Image Text: ${product_image}

        # Convert to lower case for comparison
        ${product_name}=    Convert To Lower Case    ${product_name}
        ${product_image}=    Convert To Lower Case    ${product_image}

        ${product_name}=    Replace String    ${product_name}    .    ${EMPTY}
        ${product_name}=    Replace String    ${product_name}    )    ${EMPTY}
        ${product_name}=    Replace String    ${product_name}    (    ${EMPTY}
        ${product_name}=    Replace String    ${product_name}    -    ${EMPTY}

        ${product_image}=    Replace String    ${product_image}    .    ${EMPTY}
        ${product_image}=    Replace String    ${product_image}    )    ${EMPTY}
        ${product_image}=    Replace String    ${product_image}    (    ${EMPTY}
        ${product_image}=    Replace String    ${product_image}    -    ${EMPTY}

        ${product_name_list}=    Split String    ${product_name}    ${SPACE}
        ${product_image_list}=    Split String    ${product_image}    ${SPACE}
        
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
