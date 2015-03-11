<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content">
    <ul class="box-category">

      <?php
      $sort_cat = '';
      foreach ($categories as $category) {
        if ($category['category_id'] == $category_id) {$sort_cat=$category['top'];break;};
      }
      foreach ($categories as $category) {
        if ($category['top']==$sort_cat) {?>

      <li>
        <a href="<?php echo $category['href']; ?>" <?php if ($category['category_id'] == $category_id) echo 'class="active"'; ?> >
		<?php 
			$image = $category['image'];
			$name = $category['name'];
			if ($image) { ?><img src="<?php echo $image; ?>" alt="<?php echo $name; ?>" /><?php }	echo $name; 
		?> </a>
        <?php if (($category['children']) && ($category['category_id'] == $category_id)) { ?>
        <ul>
          <?php foreach ($category['children'] as $child) { ?>
          <li>
            <a href="<?php echo $child['href']; ?>" <?php if ($child['category_id'] == $child_id) echo 'class="active"'; ?> > 
			<?php 
				$image = $child['image'];
				$name = $child['name'];
				if ($image) { ?><img src="<?php echo $image; ?>" alt="<?php echo $name; ?>" /><?php }	echo $name; 
			?>
			</a>
          </li>
          <?php } ?>
        </ul>
        <?php } ?>
      </li>
      <?php } }?>
    </ul>
  </div>
</div>
