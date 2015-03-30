<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($robots) { ?>
<meta name="robots" content="<?php echo $robots; ?>" />
<?php } ?>
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<meta property="og:title" content="<?php echo $title; ?>" />
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
<link rel="stylesheet" href="catalog/view/javascript/FortAwesome/css/font-awesome.min.css">
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
<!-- Autofill search -->
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/livesearch.css" />
<script src="catalog/view/javascript/jquery/livesearch.js"></script>
<!-- Autofill search END-->
<!--[if IE 7]> 
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>s
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
<body>
<div id="header-bg"></div>
<?php include "left_menu.tpl"; ?>
<div id="container">
<div id="header">
  <?php if ($logo) { ?>
  <figure id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></figure>
  <?php } ?>
  <?php echo $language; ?>
  <div id="search">
    <div class="button-search"><i class="fa fa-search"></i></div>
    <input type="search" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
 </div>
	<div id="corp_button">
	<a class="corp" href="informacija-dlja-pokupatelej"></a>
	</div>
	<div id="cellfone"> <i class="fa fa-phone"> </i><?php echo $telephone; ?>  </div>
	<div id="sub_cellfone"> <i class="fa fa-phone"> </i><?php echo $sub_telephone; ?>  </div>
  
  <?php /*<!--div id="welcome">
    <!--?php if (!$logged) { ?>
    <!?php echo $text_welcome; ?>
    <!?php } else { ?>
    <!?php echo $text_logged; ?>
    <!?php } ?>
  </div-->
  <!--div class="links"><a href="<!?php echo $home; ?>"><i class="fa fa-home"></i><!?php echo $text_home; ?></a><a href="<!?php echo $wishlist; ?>" id="wishlist-total"><i class="fa fa-heart"></i><!?php echo $text_wishlist; ?></a><a href="<!?php echo $account; ?>"><i class="fa fa-user"></i><!?php echo $text_account; ?></a><a href="<!?php echo $shopping_cart; ?>"><i class="fa fa-shopping-cart"></i><!?php echo $text_shopping_cart; ?></a><a href="<!?php echo $checkout; ?>"><i class="fa fa-mail-forward"></i><!?php echo $text_checkout; ?></a></div--> */?>
</div>
<?php if ($categories) { ?>
<div id="menu">
  <ul>
    <?php foreach ($categories as $category) { ?>
    <li>
	<a href="<?php echo $category['href']; ?>" <?php if ($category['active']) echo 'class="active"'; ?> >
	  <?php $image_menu = $category['image_menu'];
	  	if ($image_menu) { ?><img src="<?php echo $image_menu; ?>" alt="<?php echo $name; ?>" /> <?php } ?> 
	</a>
      <?php if ($category['children']) { ?>
      <div>
        <?php for ($i = 0; $i < count($category['children']);) { ?>
        <ul>
          <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
          <?php for (; $i < $j; $i++) { ?>
          <?php if (isset($category['children'][$i])) { 
		  		$image_menu = $category['children'][$i]['image_menu'];
				$name = $category['children'][$i]['name'];
				$name2 = $category['children'][$i]['name2'];
				$href = $category['children'][$i]['href']; ?>
          <li><a href="<?php echo $href; ?>">
		  <?php if ($image_menu) { ?><img src="<?php echo $image_menu; ?>" alt="<?php echo $name; ?>" /> <?php }
			    echo $name; ?></a>
				<a class="hidden" href="<?php echo $href; ?>">
		  <?php if ($image_menu) { ?><img src="<?php echo $image_menu; ?>" alt="<?php echo $name2; ?>" /> <?php }
			    echo $name2; ?></a>
          </li>
          <?php } ?>
          <?php } ?>
        </ul>
        <?php } ?>
      </div>
      <?php } ?>
    </li>
    <?php } ?>
	<?php /* if ($this->config->get('config_menu_special')) { ?>
	<li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
	<?php } ?>
	<?php if ($this->config->get('config_menu_latest')) { ?>
	<li><a href="<?php echo $latest; ?>"><?php echo $text_latest; ?></a></li>
	<?php } ?>
	<?php if ($this->config->get('config_menu_brands')) { ?>
	<li><a href="<?php echo $brands; ?>"><?php echo $text_brands; ?></a>
	<div>
	<ul>
	<?php foreach($manufacturer as $manufacturers){ ?>
	<li><a href="<?php echo $manufacturers['href']; ?>"><?php echo $manufacturers['name']; ?></a></li>
	<?php } ?>
	</ul>
	</div>
	</li>
	<?php } ?>
	<?php if ($this->config->get('config_blog_header_menu')) { ?>
	<li><a href="<?php echo $blog; ?>"><i class="fa fa-book"></i> <?php echo $text_blog; ?></a></li>
	<?php } */ ?>
  </ul>
</div>
<?php } ?>
<?php if ($error) { ?>
    
    <div class="warning"><?php echo $error ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
    
<?php } ?>
<div id="notification"></div>
