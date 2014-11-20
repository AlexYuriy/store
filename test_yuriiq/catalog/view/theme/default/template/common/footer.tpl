</div>
<footer id="container-footer">
<div id="custom-footer-bg">
<div id="custom-footer">
<div class="footer-logo"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></div>
<div class="column-welcome">
<!--	<ul>
		<li><?php echo $welcome; ?></li>
	</ul>
	-->
</div>
<div class="column-contacts">
	<ul>
		<li><li><i class="fa fa-phone"></i> <?php echo $telephone; ?></li>
		<?php if ($fax) { ?><li><i class="fa fa-phone"></i> <?php echo $fax; ?></li><?php } ?>
		<li><i class="fa fa-envelope"></i> <?php echo $email; ?></li>
		<li class="footer-address"><i class="fa fa-home"></i> <?php echo $address; ?></li>
		<li class="footer-time"><i class="fa fa-clock-o fa-lg"></i><?php echo $time; ?></li>
		<li class="fa fa-share"><i></i> <a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
	</ul>
</div>
<div class="column-maps">
	<ul>
		<li id="map"><?php echo $maps; ?></li>
		<img id="map-img" src="image/data/map.png" />
	</ul>
</div>
</div>
</div>
<br>
<div id="footer">
  <?php if ($informations) { ?>
  <div class="line">
      <?php foreach ($informations as $information) { ?>
      <a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a>
      <?php } ?>
	  <a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a>
	  <a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a>
    </ul>
  </div>
  <?php } ?>
<div id="powered"><?php echo $powered; ?></div>
<div id="social">
	   <a target="_blank" href="<?php echo $vk; ?>"><i class="fa fa-vk"></i></a>
	   <a target="_blank" href="<?php echo $fb; ?>"><i class="fa fa-facebook"></i></a>
	   <a target="_blank" href="<?php echo $googleplus; ?>"><i class="fa fa-google-plus"></i></a>
	   <a target="_blank" href="<?php echo $youtube; ?>"><i class="fa fa-youtube"></i></a>
	   <a target="_blank" href="<?php echo $twitter; ?>"><i class="fa fa-twitter"></i></a>
</div>
</div>
</footer>
</body></html>