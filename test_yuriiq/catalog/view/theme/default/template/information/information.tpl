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
<div class="category_title">
  <h1><?php echo $heading_title; ?></h1>
  </div>
  <?php echo $description; ?>
  <?php echo $content_bottom; ?></div></div>
<?php echo $footer; ?>