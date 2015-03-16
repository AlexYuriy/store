
<div class="box">
	<?php if ($categories) { ?>
		<div id="menu">
		  <ul>
		<?php foreach ($categories as $category) { ?>
			<a href="<?php echo $category['href']; ?>" <?php if ($category['active']) echo 'class="active"'; ?> ><?php echo $category['name']; ?></a>
			<a class="hidden" href="<?php echo $category['href']; ?>"><?php echo $category['name2']; ?></a>
	        <?php } ?>
	        </ul></div>
	<?php } ?>  
</div>


