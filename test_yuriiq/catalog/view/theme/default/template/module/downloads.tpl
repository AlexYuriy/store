<?php if ($downloads) { ?>
<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content" >
	<?php foreach($downloads as $download){ ?>
		<a href="<?php echo $download['href']; ?>" title="">
		<i class="fa fa-download"> </i>
		<?php echo $download['name']; ?></a><br>
	<?php } ?>
  </div>
</div>
<?php }  ?>

