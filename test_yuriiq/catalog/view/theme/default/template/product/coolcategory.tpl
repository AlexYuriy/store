<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
	<div class="breadcrumb_line">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
    <?php if($i+1<count($breadcrumbs)) { ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } ?>
    <?php } ?>
  </div>
</div>
	<div class="category-img">
		<?php if ($thumb) { ?>
			<div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
		<?php } ?>
	</div>
	<h1><?php echo $heading_title; ?></h1>
	<?php if ($thumb || $description) { ?>
		<?php if ($description) { ?>
			<div class="category-info"> <?php echo $description; ?> </div>
		<?php } ?>
	<?php } ?>
	<?php if ($categories) { ?>
		<?php foreach ($categories as $category) {  ?>
			<div class="box hidden">
				<div class="box-heading"><a href="<?php echo $category['href']; ?>"> <?php echo $category['name']; ?> </a> </div>
				<div class="box-content" id="CoolCategory_<?php echo $category['id']; ?>">
					<div class="product-list"></div>
					<div class="right">[ <a href="<?php echo $category['href']; ?>"> <?php echo $category['name']; ?> </a> ] </div>
				</div>
			</div>
		<?php } ?>	
	<?php } ?>
	<?php echo $content_bottom; ?>
</div>

<?php echo $footer; ?>
