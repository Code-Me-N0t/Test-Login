*** Variables ***
#login page
${registered_username}        standard_user
${registered_password}        secret_sauce

${unregistered_username}        invalid_username
${unregistered_password}        invalid_password

${invalid_input_message}        username and password do not match any user in this service

${require_username_message}    username is required
${require_password_message}    password is required