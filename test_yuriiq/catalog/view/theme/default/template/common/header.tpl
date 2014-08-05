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
<?php ?>


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
<body onScroll="moveMenuScreen(); displayScrollItem();">

<!-- при добавлении элементов в меню их так же нужно добавить и в массив id_menu и for_scroll в common.js -->
<div class="main_sidebar" id="main_sidebar">
    <div class="sidebar" id="sidebar" onScroll="MoveCenterScreen('main_sidebar');">
    
        <!-- категории товаров -->
		<div class="sidebar_item" onclick="openMenu('categories');return(false)">
		    <img class="sidebar_item_img" src="image/flags/ru.png" alt="категории товаров">
		</div>
		 
		<!-- Q/A -->
		<div class="sidebar_item">
		    <a href="#"> <img class="sidebar_item_img" src="image/flags/ru.png" alt="Q/A"> </a>
		</div>
		
		<!-- blog -->
		<div class="sidebar_item">
		    <a href="#"> <img class="sidebar_item_img" src="image/flags/ru.png" alt="blog"> </a>
		</div>
		
		<!-- news -->
		<div class="sidebar_item">
		    <a href="#"> <img class="sidebar_item_img" src="image/flags/ru.png" alt="news> </a>
		</div>
		
		<!-- stocks -->
		<div class="sidebar_item">
		    <a href="#"> <img class="sidebar_item_img" src="image/flags/ru.png" alt="stocks"> </a>
		</div>
		
		<!-- пустой элемент для перемотки -->
		<div class="temp_scroll_item" id="temp_scroll_item">
		    <img class="sidebar_item_img" src="image/flagru.png" alt="пустой элемент для перемотки">
		</div>
		
		<!-- перемотка наверх -->
		<div class="scroll_item" id="scroll_to_top" onclick="scrollToTop();"> 
	        <img class="sidebar_item_img" src="image/flags/ru.png" alt="^"> 
	    </div>
		
		<!-- перемотка обратно -->
	    <div class="scroll_item" id="scroll_to_bottom" onclick="scrollToBottom();">
	        <img class="sidebar_item_img" src="image/flags/ru.png" alt="V"> 
        </div>  
        
        <!-- количество продуктов в корзине -->
	    <div class="sidebar_num_products" >
	        <?php echo count($products); ?> 
        </div> 
        
        <!-- корзина -->      
		<div class="sidebar_item" onclick="openMenu('cart');return(false)">
		    <img class="sidebar_item_img" src="image/flags/ru.png" alt="Q/A">
		</div>
        
        <!-- Личный кабинет" -->
		<div class="sidebar_account" onclick="openMenu('account');return(false);">
		    <img class="sidebar_item_img" src="image/flags/ru.png" alt="Q/A"> 
		</div>   		
				
    </div>
    
    <div class="sidebar_item_body" id="sub_menu_1" onScroll="MoveCenterScreen('sub_menu_1');">
        <ul >
	        <li><a href="#">Подпункт №1</a></li>
        </ul>
    </div>

    <div class="sidebar_item_body" id="sub_menu_2" onScroll="MoveCenterScreen('sub_menu_2');">
        <ul >
	        <li><a href="#">Подпункт №1</a></li>
	        <li><a href="#">Подпункт №2</a></li>
        </ul>
    </div>

    <div class="sidebar_item_body" id="sub_menu_3" onScroll="MoveCenterScreen('sub_menu_3');">
        <ul >
        	<li><a href="#">Подпункт №1</a></li>
        	<li><a href="#">Подпункт №2</a></li>
        	<li><a href="#">Подпункт №3</a></li>
        </ul>
    </div>
    
    <!-- Личный кабинет-->
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
        <div class="sidebar_content">
            <h2> <?php echo $text_cart; ?></h2>
            <div class="content">
                <?php if ($products || $vouchers) { ?>
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
                      <td class="quantity">x&nbsp;1</td>
                      <td class="total"><?php echo $voucher['amount']; ?></td>
                      <td class="remove"><img src="catalog/view/theme/default/image/remove-small.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $voucher['key']; ?>' : $('#cart').load('index.php?route=module/cart&remove=<?php echo $voucher['key']; ?>' + ' #cart > *');" /></td>
                    </tr>
                    <?php } ?>
                  </table>
                </div>
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
                <div class="checkout"><a href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a> | <a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a> | <a href="<?php echo $order; ?>"><?php echo $text_order; ?></a> </div>
                <?php } else { ?>
                <div class="empty"><?php echo $text_empty; ?>
                    <p><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a>
                </div>
                <?php } ?>
                
              </div>
        </div>
    </div>
    
</div>

    <div class="sidebar_left_space" id="id_sidebar_left_space" onclick="closeMenu(); return(false)" onScroll="MoveCenterScreen('id_sidebar_left_space');"> </div>
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