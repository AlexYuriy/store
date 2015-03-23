
<?php if ($products) { ?>
	<?php foreach ($products as $product) { ?>
		<div>
			<div class="right">
				<?php if (($product['price']) || ($product['special'])) { ?>
					<div class="price">
						<?php if (!$product['special']) { ?>
							<?php echo $product['price']; ?>
						<?php } else { ?>
							<span class="price-old"><?php echo $product['price']; ?></span><br /><span class="price-new"><?php echo $product['special']; ?></span>
						<?php } ?>
						<?php if ($product['tax']) { ?>
							<br />
							<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
						<?php } ?>
					</div>
				<?php } ?>
				<div class="cart">
					<input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" />
				</div>
				<div class="wishlist">
					<a onclick="addToWishList('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart-o"></i><?php echo $button_wishlist; ?></a>
				</div>
				<div class="compare">
					<a onclick="addToCompare('<?php echo $product['product_id']; ?>');"><i class="fa fa-files-o"></i><?php echo $button_compare; ?></a>
				</div>
				<div class="rating">
					<?php for ($i = 1; $i <= 5; $i++) { ?>
						<?php if ($product['rating'] < $i) { ?>
							<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
						<?php } else { ?>
							<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
						<?php } ?>
					<?php } ?>
				</div>
			</div>
			<div class="left">
				<?php if ($product['thumb']) { ?>
					<div class="image"><a href="<?php echo $product['href']; ?>">
						<img class="imagejail" width="<?php echo $product['thumbwidth']; ?>" height="<?php echo $product['thumbheight']; ?>" src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
						<noscript>
						<img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
						</noscript>
						</a>
					</div>
				<?php } ?>
				<div class="name">
					<a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
				</div>
				<div class="description">
					<?php if (!$product['description_mini']) { ?>
					<?php echo $product['description']; ?>
					<?php } else { ?>
					<?php echo $product['description_mini']; ?>
					<?php } ?>
				</div> 
			</div>
		</div>
	<?php } ?>
<?php } ?>

