<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div class="category_paper">
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb_line">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
    <?php if($i+1<count($breadcrumbs)) { ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } ?>
    <?php } ?>
  </div>
</div>
  <h1><?php echo $heading_title; ?></h1>
  <img src="/image/templates/error.png">
</div>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>
