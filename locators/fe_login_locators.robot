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
${sort_option}    css=select.product_sort_container > option
${badge_number}    class=shopping_cart_badge
${cart_icon}        id=shopping_cart_container
${menu_icon}        id=react-burger-menu-btn
${sidebar}        class=bm-menu-wrap

${item_name}    class=inventory_item_name
${item_image}    css=img.inventory_item_img

${inventory_tab}    id=inventory_sidebar_link
${about_tab}    id=about_sidebar_link
${logout_tab}    id=logout_sidebar_link
${reset_tab}    id=reset_sidebar_link

#product view page
${product_view_page}        id=inventory_item_container

#cart page
${cart_page}        id=cart_contents_container

#about page
${about_page}        id=__next