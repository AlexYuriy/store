<?php echo $header; ?>
<?php if ($attention) { ?>
<div class="attention"><?php echo $attention; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <?php if ($carts) { ?>
  <?php foreach ($carts as $cart) { ?>
  <div class="cart-list" <?php if ($cart['cart_id'] == $current_cart_id) {?> id="currect_cart" <?php } ?>>
    <div class="cart-id"><b><?php echo $text_cart_id; ?></b> #<?php echo $cart['cart_id']; ?></div>
    <div class="cart-content">
      <div><h2> <?php echo $cart['name']; ?> </h2></div>
	  <div><b> <?php echo $text_products; ?> </b> <?php echo $cart['count']; ?> </div>
      <div class="cart-info">
	    <b><?php echo $text_date_added; ?></b> <?php echo $cart['date_added']; ?> &nbsp;&nbsp; 
	    <a href="<?php echo $load_cart . $cart['cart_id'];?>">
		  <img src="catalog/view/theme/default/image/reorder.png" alt="<?php echo $button_load; ?>" title="<?php echo $button_load; ?>" />
		</a> &nbsp;&nbsp; 
		<a href="<?php echo $remove_cart . $cart['cart_id']; ?>">
		  <img src="catalog/view/theme/default/image/remove.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" />
		</a>
	  </div>
    </div>
  </div>
  <?php } ?>
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } else { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <?php } ?>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>
