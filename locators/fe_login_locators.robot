*** Variables ***
# login page
${login_page}        class=login_container
${username}        id=user-name
${password}        id=password
${submit}        id=login-button
${error_message}    css=h3[data-test='error']


#product page
${product_page}        id=page_wrapper
${sort_active_option}        class=active_option
${sort}        class=product_sort_container
${sort_option}        css=select.product_sort_container > option
${badge_number}        class=shopping_cart_badge
${cart_icon}        id=shopping_cart_container
${menu_icon}        id=react-burger-menu-btn
${sidebar}        class=bm-menu-wrap

${item_name}        class=inventory_item_name
${item_image}        css=img.inventory_item_img
${item_description}        class=inventory_item_desc
${item_price}        class=inventory_item_price

${inventory_tab}        id=inventory_sidebar_link
${about_tab}        id=about_sidebar_link
${logout_tab}        id=logout_sidebar_link
${reset_tab}        id=reset_sidebar_link

#product view page
${product_view_page}        id=inventory_item_container

#cart page
${cart_page}        id=cart_contents_container
${cart_item}        class=cart_item
${checkout_button}        id=checkout
${continue_shopping_button}        id=continue-shopping

#about page
${about_page}        id=__next

#checkout_info_page
${checkout_info_page}        id=checkout_info_container
${first_name}        id=first-name
${last_name}        id=last-name
${postal_code}        id=postal-code
${continue_button}    id=continue

# checkout overview page
${checkout_overview_page}        id=checkout_summary_container
${tax_label}        class=summary_tax_label
${total_label}        class=summary_total_label
${cancel_button}        id=cancel
${finish_button}        id=finish

# checkout complete page
${checkout_complete_page}        id=checkout_complete_container
${complete_order_message}        class=complete-header
${back_home_button}        id=back-to-products