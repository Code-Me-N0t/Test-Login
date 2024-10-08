*** Variables ***
# login page
${login_page}        class=login_container
${username}        id=user-name
${password}        id=password
${submit}        id=login-button
${error_message}    css=h3[data-test='error']


#product page
${product_page}        id=page_wrapper
${sort_active_option}    class=active_option
${sort}        class=product_sort_container
${badge_number}    class=shopping_cart_badge
${cart_icon}        id=shopping_cart_container

#product view page
${product_view_page}        id=inventory_item_container

#cart page
${cart_page}        id=cart_contents_container