*** Variables ***
#login page
${registered_username}        standard_user
${registered_password}        secret_sauce

${valid_first_name}        john
${valid_last_name}        doe
${valid_postal_code}        1940

${unregistered_username}        invalid_username
${unregistered_password}        invalid_password

${invalid_input_message}        username and password do not match any user in this service

${require_username_message}    username is required
${require_password_message}    password is required

${require_firstname_message}        first name is required
${require_lastname_message}        last name is required
${require_postalcode_message}        postal code is required
