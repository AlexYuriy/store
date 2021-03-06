<!-- LeftMenu -->
<!--suppress HtmlUnknownTarget -->
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/left_menu.css" />
<script type="text/javascript" src="catalog/view/javascript/left_menu.js"></script>
<div id="sidebar_right_space" onclick="closeMenu(); return(false)" > </div>
<div id="main_sidebar" >
    <div id="sidebar">
		<!-- Главная страница -->
	    <a href="<?php echo $home ?>"> 
			<img src="image/left_menu/main_page.png" title="На главную"> 
		</a>
		<!-- ссылки на важные страницы, такие как блог, новости, вопрос/ответ, акции, категории товаров -->
		<a onclick="openMenu('other_links', true); return('false');">
		    <img src="image/left_menu/other_lincks_img.png" title="Основное меню" >
		</a>
		<!-- перемотка наверх -->
		<a id="scroll_to_top" onclick="scrollToTop();"> 
		  <img alt="top" src="image/left_menu/scroll_to_top.png" title="Наверх"> 
		</a>
		<!-- перемотка обратно -->
		<a id="scroll_to_bottom" onclick="scrollToBottom();">
		  <img alt="bottom" src="image/left_menu/scroll_to_bottom.png"> 
		</a>  
		<!-- корзина -->      
		<a id="sidebar_cart" href="<?php echo $shopping_cart; ?>">
		    <img class="sidebar_item_img" src="image/left_menu/cart.png" title="Корзина">
			<?php $num_products = 0; 
			if ($products || $vouchers) 
			{ 
				foreach ($products as $product) { $num_products += $product['quantity'];} 
				foreach ($vouchers as $voucher) { $num_products += $voucher['quantity'];} 
			} ?>
			<span id="cart-total" <?php if (!$num_products) echo 'class="hidden"'; ?> ><?php echo $num_products; ?></span>			
		</a>
		<!-- Личный кабинет" -->
		<a id="sidebar_account" onclick="openMenu('sidebar_account_panel', true);return(false)">  
		<img class="sidebar_item_img" src="image/left_menu/account.png" title="Аккаунт"> 
		</a>  				
    </div>
    <!-- ссылки на важные страницы, такие как блог, новости, вопрос/ответ, акции, категории товаров -->
    <div id="other_links" class="sidebar_panel">
        <ul>
        	<li><a onclick="openMenu('sidebar_category', false);return(false)"><?php echo $text_categories; ?></a>
                <!-- берём категорию и выводим все её подкатегории -->
                <ul id="sidebar_category"><?php foreach ($categories as $category) { ?>
                    <li>
	                    <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>                	
                    </li>
                <?php } ?></ul>
			</li>
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
						<?php } ?>
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
    <div id="sidebar_account_panel" class="sidebar_panel">	
    <?php if ($logged) { ?>
              <h2><?php echo $text_logged; ?></h2>    
                <ul>
				  <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>				
                  <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
                  <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
                  <li><a href="<?php echo $address; ?>"><?php echo $text_address; ?></a></li>
                  <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                  <li><a href="<?php echo $carts; ?>"><?php echo $text_carts; ?></a></li>
                  <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                  <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>				  
			      <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>				  				
				</ul>
    <?php } else { ?>
                <h2><?php echo $text_my_account; ?></h2>
                <?php echo $text_welcome; ?>    
    <?php } ?>
    </div> 

</div>
<!-- /LeftMenu -->

