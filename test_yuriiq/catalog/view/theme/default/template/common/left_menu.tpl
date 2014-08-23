<!-- LeftMenu -->
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/left_menu.css" />
<script type="text/javascript" src="catalog/view/javascript/left_menu.js"></script>
<!-- при добавлении элементов в меню их так же нужно добавить и в массив id_menu и for_scroll в common.js -->
<div class="main_sidebar" id="main_sidebar">
    <div class="sidebar" id="sidebar" onScroll="MoveCenterScreen('main_sidebar');">
		<!-- Главная страница -->
		<div class="sidebar_item">
		    <a href="<?php echo $home ?>"> <img class="sidebar_item_img" src="image/left_menu/main_page.png"> </a>
		</div>
		<!-- ссылки на важные страницы, такие как блог, новости, вопрос/ответ, акции, категории товаров -->
		<div class="sidebar_item test_item" onclick="openMenu('other_links'); return('false');">
		    <img class="sidebar_item_img" src="image/left_menu/other_lincks_img.png">
		</div>
		<!-- пустой элемент для перемотки -->
		<div class="temp_scroll_item" id="temp_scroll_item">
		    <img class="scroll_img" alt="temp" id="temp_scroll_img" src="image/left_menu/temp_scroll_item.png">
		</div>
		<!-- перемотка наверх -->
		<div class="scroll_item" id="scroll_to_top" onclick="scrollToTop();"> 
		  <img class="scroll_img" alt="top" id="scroll_to_top_img" src="image/left_menu/scroll_to_top.png"> 
		</div>
		<!-- перемотка обратно -->
		<div class="scroll_item" id="scroll_to_bottom" onclick="scrollToBottom();">
		  <img class="scroll_img" alt="bottom" id="scroll_to_bottom_img" src="image/left_menu/scroll_to_bottom.png"> 
		</div>  
		<!-- количество продуктов в корзине -->
		<div class="sidebar_num_products" >
			<?php $num_products = 0; ?>
		    <?php if ($products || $vouchers) { ?>
			<?php foreach ($products as $product) { ?>
			    <?php $num_products += $product['quantity'];} ?>
			<?php foreach ($vouchers as $voucher) { ?>
			    <?php $num_products += $voucher['quantity'];} ?>
		    <?php } ?>
			<span id="cart-total"><?php echo $num_products; ?></span>
		</div> 
		<!-- корзина -->      
		<div class="sidebar_item" onclick="openMenu('cart');return(false)">
		    <img class="sidebar_item_img" src="image/left_menu/cart.png">
		</div>
		<!-- Личный кабинет" -->
		<div class="sidebar_item">
		    <a href="<?php echo $account; ?>" >  <img class="sidebar_item_img" src="image/left_menu/account.png"> </a>
		</div>   				
    </div>
    <!-- ссылки на важные страницы, такие как блог, новости, вопрос/ответ, акции, категории товаров -->
    <div class="sidebar_item_body" id="other_links" onScroll="MoveCenterScreen('other_links');">
        <ul >
        	<li><a href="<?php echo $categories; ?>" onclick="openMenu('categories');return(false)"><?php echo $text_categories; ?></a></li>
			<?php if ($this->config->get('config_menu_special')) { ?>
				<li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
			<?php } ?>
			<?php if ($this->config->get('config_menu_latest')) { ?>
				<li><a href="<?php echo $latest; ?>"><?php echo $text_latest; ?></a></li>
			<?php } ?>
			<?php if ($this->config->get('config_menu_brands')) { ?>
				<li><a href="<?php echo $brands; ?>"><?php echo $text_brands; ?></a>
				<div><ul>
						<?php foreach($manufacturer as $manufacturers){ ?>
							<li><a href="<?php echo $manufacturers['href']; ?>"><?php echo $manufacturers['name']; ?></a></li>
						<? } ?>
				</ul></div>
				</li>
			<?php } ?>
			<?php if ($this->config->get('config_blog_header_menu')) { ?>
				<li><a href="<?php echo $blog; ?>"><i class="fa fa-book"></i> <?php echo $text_blog; ?></a></li>
			<?php } ?>
        	<li><a href="<?php echo $news; ?>"><?php echo $text_news; ?></a></li>
        	<li><a href="<?php echo $q_and_a; ?>"><?php echo $text_q_and_a; ?></a></li>
        </ul>
    </div>
    <!-- Личный кабинет-->
    <?php if ($logged) { ?>
        <div class="sidebar_item_body" id="account" onScroll="MoveCenterScreen('account');">
            <div class="sidebar_content">
              <h2><?php echo $text_my_account; ?></h2>    
                <ul>
                  <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
                  <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
                  <li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
                  <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                </ul>
              <h2><?php echo $text_my_orders; ?></h2>
                <ul>
                  <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                  <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
                  <?php if ($reward) { ?>
                  <li><a href="<?php echo $reward; ?>"><?php echo $text_reward; ?></a></li>
                  <?php } ?>
                  <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                  <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                </ul>
              <h2><?php echo $text_my_newsletter; ?></h2>
                <ul>
                  <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
                </ul>
            </div>
        </div>
    <?php } else { ?>
        <div class="sidebar_item_body" id="account" onScroll="MoveCenterScreen('account');">
            <div class="sidebar_content">
                <h2><?php echo $text_my_account; ?></h2>
                <p>
                <?php echo $text_welcome; ?>    
            </div>
        </div>
    <?php } ?>    
        <!-- категории товаров-->
        <div class="sidebar_item_body" id="categories" onScroll="MoveCenterScreen('categories');">  
            <div class="sidebar_content">
                <h2> <?php echo $text_categories; ?></h2>
                <?php $item_id = 0; ?>
                <!-- берём категорию и выводим все её подкатегории -->
                <ul class="category"><?php foreach ($categories as $category) { ?>
                    <li>
	                    <a onfocus="expandItem(<?php echo $item_id++; ?>) href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>                	
                        <?php if ($category['children']) { ?>
                            <?php for ($i = 0; $i < count($category['children']);) { ?>
                            <ul>
                                <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
                                <?php for (; $i < $j; $i++) { ?>
                                <?php if (isset($category['children'][$i])) { ?>
                                <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php 
									$image_menu = $category['children'][$i]['image_menu'];
									$name = $category['children'][$i]['name'];
									if ($image_menu) { ?><img src="<?php echo $image_menu; ?>" alt="<?php echo $name; ?>" /><?php }
									echo $name; ?></a></li>
                                <?php } ?>
                                <?php } ?>
                            </ul>
                            <?php } ?>
                        <?php } ?>
                    </li>
                <?php } ?></ul>  
            </div>
        </div>
        
    <!-- корзина -->
    <div class="sidebar_item_body" id="cart" onScroll="MoveCenterScreen('cart');">  
        <div class="sidebar_content">
            <h2> <?php echo $text_cart; ?></h2>
            <div class="content">
                <?php if ($products || $vouchers) { ?>
                <!-- перечисляются товары с описанием -->
                <div class="mini-cart-info">
                  <table>
                    <?php foreach ($products as $product) { ?>
                    <tr>
                      <td class="image"><?php if ($product['thumb']) { ?>
                        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                        <?php } ?></td>
                      <td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                        <div>
                          <?php foreach ($product['option'] as $option) { ?>
                          - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small><br />
                          <?php } ?>
                        </div></td>
                      <td class="quantity">x&nbsp;<?php echo $product['quantity']; ?></td>
                      <td class="total"><?php echo $product['total']; ?></td>
                      <td class="remove"><img src="catalog/view/theme/default/image/remove-small.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $product['key']; ?>' : $('#cart').load('index.php?route=module/cart&remove=<?php echo $product['key']; ?>' + ' #cart > *');" /></td>
                    </tr>
                    <?php } ?>
                    <?php foreach ($vouchers as $voucher) { ?>
                    <tr>
                      <td class="image"></td>
                      <td class="name"><?php echo $voucher['description']; ?></td>
                      <td class="quantity">x&nbsp;1 </td>
                      <td class="total"><?php echo $voucher['amount']; ?></td>
                      <td class="remove"><img src="catalog/view/theme/default/image/remove-small.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $voucher['key']; ?>' : $('#cart').load('index.php?route=module/cart&remove=<?php echo $voucher['key']; ?>' + ' #cart > *');" /></td>
                    </tr>
                    <?php } ?>
                  </table>
                </div>
                <!-- нижняя строка корзины -->
                <div class="mini-cart-total">
                  <table>
                    <?php foreach ($totals as $total) { ?>
                    <tr>
                      <td class="right"><b><?php echo $total['title']; ?>:</b></td>
                      <td class="right"><?php echo $total['text']; ?></td>
                    </tr>
                    <?php } ?>
                  </table>
                </div>
                <div class="checkout"><a href="<?php echo $shopping_cart; ?>"><?php echo $text_cart; ?></a> | <a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a> | <a href="<?php echo $order; ?>"><?php echo $text_order; ?></a> </div>
                <?php } else { ?>
                <div class="empty"><?php echo $text_empty; ?>
                    <p><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a>
                </div>
                <?php } ?>
                
              </div>
        </div>
    </div>
    
</div>

    <div class="sidebar_right_space" id="id_sidebar_right_space" onclick="closeMenu(); return(false)" onScroll="MoveCenterScreen('id_sidebar_right_space');"> </div>
</div>
<!-- /LeftMenu -->