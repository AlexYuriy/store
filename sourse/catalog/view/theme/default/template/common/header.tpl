<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<meta property="og:title" content="<?php echo $title; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?>" />
<meta property="og:type" content="website" />
<meta property="og:url" content="<?php echo $og_url; ?>" />
<?php if ($og_image) { ?>
<meta property="og:image" content="<?php echo $og_image; ?>" />
<?php } else { ?>
<meta property="og:image" content="<?php echo $logo; ?>" />
<?php } ?>
<meta property="og:site_name" content="<?php echo $name; ?>" />
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/stylesheet.css" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<!--[if IE 7]> 
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->
<?php if ($stores) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body onScroll="moveMenuScreen(); displayScrollItem();" onLoad="calc_sidebar_meter();" onResize="calc_sidebar_meter();">

<!-- при добавлении элементов в меню их так же нужно добавить и в массив id_menu и for_scroll в common.js -->
<div class="main_sidebar" id="main_sidebar">
    <div class="sidebar" id="sidebar" onScroll="MoveCenterScreen('main_sidebar');">
    
		<!-- Главная страница -->
		<div class="sidebar_item">
		    <a href="<?php echo home ?>"> <img class="sidebar_item_img" src="main_page.jpg"> </a>
		</div>
		
		<!-- ссылки на важные страницы, такие как блог, новости, вопрос/ответ, акции, категории товаров -->
		<div class="sidebar_item" onclick="openMenu('other_links'); return('false');">
		    <img class="sidebar_item_img" src="other_lincks_img.jpg">
		</div>
		
		<!-- пустой элемент для перемотки -->
		<div class="temp_scroll_item" id="temp_scroll_item">
		    <img class="scroll_img" alt="temp" id="temp_scroll_img" src="temp_scroll_item.jpg">
		</div>
		
		<!-- перемотка наверх -->
		<div class="scroll_item" id="scroll_to_top" onclick="scrollToTop();"> 
		  <img class="scroll_img" alt="top" id="scroll_to_top_img src="scroll_to_top.jpg"> 
		</div>
		
		<!-- перемотка обратно -->
		<div class="scroll_item" id="scroll_to_bottom" onclick="scrollToBottom();">
		  <img class="scroll_img" alt="bottom" id="scroll_to_bottom_img" src="scroll_to_bottom.jpg"> 
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
		    <?php echo $this->cart->countProducts(); ?>
		</div> 
        
		<!-- корзина -->      
		<div class="sidebar_item" onclick="openMenu('cart');return(false)">
		    <img class="sidebar_item_img" src="cart.jpg">
		</div>
        
		<!-- Личный кабинет" -->
		<div class="sidebar_item">
		    <a href="<?php echo $account; ?>" >  <img class="sidebar_item_img" src="account.jpg"> </a>
		</div>   				
    </div>
    
    <!-- ссылки на важные страницы, такие как блог, новости, вопрос/ответ, акции, категории товаров -->
    <div class="sidebar_item_body" id="other_links" onScroll="MoveCenterScreen('other_links');">
        <ul >
        	<li><a href="<?php echo $categories; ?>" onclick="openMenu('categories');return(false)"><?php echo $text_categories; ?></a></li>
        	<li><a href="<?php echo $blog; ?>"><?php echo $text_blog; ?></a></li>
        	<li><a href="<?php echo $news; ?>"><?php echo $text_news; ?></a></li>
        	<li><a href="<?php echo $q_and_a; ?>"><?php echo $text_q_and_a; ?></a></li>
        	<!-- stocks - это акции -->
        	<li><a href="<?php echo $stocks; ?>"><?php echo $text_stocks; ?></a></li>
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
            <div class="sidebar_content" id="category">
                <h2> <?php echo $text_categories; ?></h2>
                <?php $item_id = 0; ?>
                <!-- берём категорию и выводим все её подкатегории -->
                 <?php foreach ($categories as $category) { ?>
                    <li>
	                    <a class="category" onfocus="expandItem(<?php echo $item_id++; ?>) href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>                
	
                        <?php if ($category['children']) { ?>
                            <?php for ($i = 0; $i < count($category['children']);) { ?>
                            <ul>
                                <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
                                <?php for (; $i < $j; $i++) { ?>
                                <?php if (isset($category['children'][$i])) { ?>
                                <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
                                <?php } ?>
                                <?php } ?>
                            </ul>
                            <?php } ?>
                        <?php } ?>
                    </li>
                <?php } ?>  
            </div>
        </div>
        
    <!-- корзина -->
    <div class="sidebar_item_body" id="cart" onScroll="MoveCenterScreen('cart');">  
        <?php echo $cart; ?>
    </div>
    
</div>

    <div class="sidebar_right_space" id="id_sidebar_right_space" onclick="closeMenu(); return(false)" onScroll="MoveCenterScreen('id_sidebar_right_space');"> </div>
</div>
<div id="container">
<div id="header">
<div id="top">
</div>
  <?php if ($logo) { ?>
  <div id="logo">
  <?php if ($home == $og_url) { ?>
  <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
  <?php } else { ?>
  <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
  <?php } ?>
  </div>
  <?php } ?>
  <?php echo $language; ?>
  <?php echo $currency; ?>
  <?php echo $cart; ?>
  <div id="search">
    <div class="button-search"></div>
    <input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
  </div>
  <div id="welcome">
    <?php if (!$logged) { ?>
    <?php echo $text_welcome; ?>
    <?php } else { ?>
    <?php echo $text_logged; ?>
    <?php } ?>
  </div>
  <div class="links"><a href="<?php echo $home; ?>"><?php echo $text_home; ?></a><a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></div>
</div>
<?php if ($categories) { ?>
<div id="menu">
  <ul>
    <?php foreach ($categories as $category) { ?>
    <li><?php if ($category['active']) { ?>
	<a href="<?php echo $category['href']; ?>" class="active"><?php echo $category['name']; ?></a>
	<?php } else { ?>
	<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
	<?php } ?>
	
      <?php if ($category['children']) { ?>
      <div>
        <?php for ($i = 0; $i < count($category['children']);) { ?>
        <ul>
          <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
          <?php for (; $i < $j; $i++) { ?>
          <?php if (isset($category['children'][$i])) { ?>
          <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
          <?php } ?>
          <?php } ?>
        </ul>
        <?php } ?>
      </div>
      <?php } ?>
    </li>
    <?php } ?>
  </ul>
</div>
<?php } ?>
<div id="notification"></div>
