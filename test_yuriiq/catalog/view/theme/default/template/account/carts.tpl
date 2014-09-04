<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <?php if ($carts) { ?>
  <?php foreach ($carts as $cart) { ?>
  <div class="cart-list">
    <div class="cart-id"><b><?php echo $text_cart_id; ?></b> #<?php echo $cart['cart_id']; ?></div>
    <div class="cart-content">
      <div><h2> <?php echo $cart['name']; ?> </h2></div>
	  <div><b> <?php echo $text_products; ?> </b> <?php echo $cart['count']; ?> </div>
      <div class="cart-info">
	    <b><?php echo $text_date_added; ?></b> <?php echo $cart['date_added']; ?> &nbsp;&nbsp; 
	    <a href="index.php?route=account/carts/loadCart&cart_id=<?php echo $cart['cart_id']; ?>">
		  <img src="catalog/view/theme/default/image/reorder.png" alt="<?php echo $button_load; ?>" title="<?php echo $button_load; ?>" />
		</a> &nbsp;&nbsp; 
		<a href="index.php?route=account/carts/removeCart&cart_id=<?php echo $cart['cart_id']; ?>">
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
  <form action="<?php echo $save_cart; ?>" method="post" enctype="multipart/form-data">  
	<div class="buttons">
        <?php echo $text_cart_name; ?>
        <input type="text" name="cart_name" value="" />
		<div class="right"><input type="submit" value="<?php echo $button_save; ?>" class="button" /></div>
	</div>
  </form>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>
