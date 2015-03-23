<?php if ($coolfilters) { ?>
<!-- CoolFilter -->
<noindex>
<div class="box" >
	<div class="box-heading"><?php echo $heading_title; ?></div>
	<div class="box-content">
	<?php foreach ($coolfilters as $coolfilter) { ?>
		<?php if (isset($coolfilter['coolfilters'])) { ?>
            <?php if ($coolfilter['style_id'] == 'list') { ?>
                <div class="coolfilter-item coolfilter-item-list">
                    <b><?php echo $coolfilter['name']; ?></b>
					<?php if ($coolfilter['description']) { ?>
						<a class="coolfilter_description" tabindex="1">
							<img src="catalog/view/theme/default/image/question.png" alt="description" class="coolfilter_question" />
							<div class="coolfilter_tip"><?php echo html_entity_decode($coolfilter['description']); ?></div>
						</a>
					<?php } ?>
                    <ul>
                    <?php foreach ($coolfilter['coolfilters'] as $coolfilter_value) { ?>
                        <?php if ($coolfilter_value['count'] || !$count_enabled) { ?>
							<li><a  <?php if($coolfilter_value['active']) { ?>class="coolfilter_active"<?php } ?> data-key="<?php echo $coolfilter_value['key']; ?>" data-value="<?php echo $coolfilter_value['value']; ?>"><?php echo $coolfilter_value['name']; ?> <?php echo $coolfilter_value['view_count']; ?> </a> </li>
						<?php } else { ?>
							<li><?php echo $coolfilter_value['name']; ?> <?php echo $coolfilter_value['view_count']; ?></li>
						<?php } ?>
                    <?php } ?>
                    </ul>
                </div>
            <?php } ?>
            <?php if ($coolfilter['style_id'] == 'checkbox') { ?>
                <div class="coolfilter-item coolfilter-item-checkbox">
                    <b><?php echo $coolfilter['name']; ?></b>
					<?php if ($coolfilter['description']) { ?>
						<a class="coolfilter_description" tabindex="1">
							<img src="catalog/view/theme/default/image/question.png" alt="description" class="coolfilter_question" />
							<div class="coolfilter_tip"><?php echo html_entity_decode($coolfilter['description']); ?></div>
						</a>
					<?php } ?>
                    <ul>
                    <?php foreach ($coolfilter['coolfilters'] as $coolfilter_value) { ?>
						<?php if ($coolfilter_value['count'] || !$count_enabled) { ?>
							<li><input type="checkbox" <?php if($coolfilter_value['active']) { ?>checked="checked"<?php } ?>><a  <?php if($coolfilter_value['active']) { ?>class="coolfilter_active"<?php } ?> data-key="<?php echo $coolfilter_value['key']; ?>" data-value="<?php echo $coolfilter_value['value']; ?>"><?php echo $coolfilter_value['name']; ?> <?php echo $coolfilter_value['view_count']; ?> </a></li>
						<?php } else { ?>
							<li><input type="checkbox" disabled="disabled"><?php echo $coolfilter_value['name']; ?> <?php echo $coolfilter_value['view_count']; ?></li>
						<?php } ?>
                    <?php } ?>
                    </ul>
                </div>
            <?php } ?>
		<?php if ($coolfilter['style_id'] == 'select') { ?>
                <div class="coolfilter-item coolfilter-item-select">
                    <div class="coolfilter-item-select-head"><?php echo $coolfilter['name']; ?>
						<div class="coolfilter-item-select-button"></div></div>
					<?php if ($coolfilter['description']) { ?>
						<a class="coolfilter_description" tabindex="1">
							<img src="catalog/view/theme/default/image/question.png" alt="description" class="coolfilter_question" />
							<div class="coolfilter_tip"><?php echo html_entity_decode($coolfilter['description']);?></div>
						</a>
					<?php } ?>
                    <div class="coolfilter-item-select-list">
						<ul>
						<?php foreach ($coolfilter['coolfilters'] as $coolfilter_value) { ?>
							<?php if ($coolfilter_value['count'] || !$count_enabled) { ?>
								<li><input type="checkbox" <?php if($coolfilter_value['active']) { ?>checked="checked"<?php } ?>><a href="<?php echo $coolfilter_value['href']; ?>" <?php if($coolfilter_value['active']) { ?>class="coolfilter_active"<?php } ?> data-key="<?php echo $coolfilter_value['key']; ?>" data-value="<?php echo $coolfilter_value['value']; ?>"><?php echo $coolfilter_value['name']; ?> <?php echo $coolfilter_value['view_count']; ?> </a></li>
							<?php } else { ?>
								<li><input type="checkbox" disabled="disabled"><?php echo $coolfilter_value['name']; ?> <?php echo $coolfilter_value['view_count']; ?></li>
							<?php } ?>
						<?php } ?>
						</ul>
					</div>
                </div>
            <?php } ?>
			<?php if ($coolfilter['style_id'] == 'image') { ?>
                <div class="coolfilter-item coolfilter-item-image">
                    <div class="coolfilter-item-image-head"><?php echo $coolfilter['name']; ?></div>
					<?php foreach ($coolfilter['coolfilters'] as $coolfilter_value) { ?>
						<?php if ($coolfilter_value['count'] || !$count_enabled) { ?>
							<a href="<?php echo $coolfilter_value['href']; ?>" <?php if($coolfilter_value['active']) { ?>class="coolfilter_active"<?php } ?> data-key="<?php echo $coolfilter_value['key']; ?>" data-value="<?php echo $coolfilter_value['value']; ?>"><img src="<?php echo $coolfilter_value['image']; ?>" alt="<?php echo $coolfilter_value['name']; ?><?php echo $coolfilter_value['view_count']; ?>" title="<?php echo $coolfilter_value['name']; ?><?php echo  $coolfilter_value['view_count']; ?>"></a>
						<?php } else { ?>
							<img src="<?php echo $coolfilter_value['image']; ?>" alt="<?php echo $coolfilter_value['name']; ?><?php echo  $coolfilter_value['view_count']; ?>" title="<?php echo $coolfilter_value['name']; ?><?php echo $coolfilter_value['view_count']; ?>">
						<?php } ?>
					<?php } ?>
                </div>
            <?php } ?>
			<?php if ($coolfilter['style_id'] == 'slider') { ?>
                <div class="coolfilter-item coolfilter-item-slider">
                    <b><?php echo $coolfilter['name']; ?> ( <?php echo $currency_symbol_left . $currency_symbol_right; ?> )  </b> <!-- TODO: разделитель валют. -->
			<?php if ($coolfilter['description']) { ?>
				<a class="coolfilter_description" tabindex="1">
					<img src="catalog/view/theme/default/image/question.png" alt="description" class="coolfilter_question" />
					<div class="coolfilter_tip"><?php echo html_entity_decode($coolfilter['description']); ?></div>
				</a>
			<?php } ?>
			<div class="coolfilter-item-slider-body">
				<input type="text" id="<?php echo $price_id; ?>" style="border:0; color:#f6931f; background:#fff; font-weight:bold;" class="coolfilter_active" data-key="p" data-value="<?php echo $coolfilter['coolfilters'][0]['value'] . ',' . $coolfilter['coolfilters'][1]['value']; ?>" disabled="disabled" />
				<div id="<?php echo $slider_range_id; ?>" class="slider-range"></div>
			</div>
			<script>
			$(function() {
				if (/\Wp:[\d\.]+,[\d\.]+/.test(location.href)) {
					var myRe = /\Wp:([\d\.]+),([\d\.]+)/;
					var pricecoolfilterValue = myRe.exec(location.href);
					startValue = pricecoolfilterValue[1];
					endValue = pricecoolfilterValue[2];
					$("#<?php echo $price_id; ?>").attr('data-value', startValue + ',' + endValue);
				} else {
					startValue = <?php echo $coolfilter['coolfilters'][0]['value']; ?>;
					endValue = <?php echo $coolfilter['coolfilters'][1]['value']; ?>;
				}
				$( "#<?php echo $slider_range_id; ?>" ).slider({
					range: true,
					min: <?php echo $coolfilter['coolfilters'][0]['value']; ?>,
					max: <?php echo $coolfilter['coolfilters'][1]['value']; ?>,
					values: [ startValue, endValue ],
					slide: function( event, ui ) {
						$( "#<?php echo $price_id; ?>" ).val(  ui.values[ 0 ].toFixed(<?php echo $count_symbols; ?>) + " - "+ ui.values[ 1 ].toFixed(<?php echo $count_symbols; ?>)  );
					},
					change: function( event, ui ) {
						/*var href = '<?php echo htmlspecialchars_decode($coolfilter['coolfilters'][0]['href']); ?>';
						var exp = /p:[\d\.,]+/g;
						href = href.replace(exp, "p:" + ui.values[ 0 ] + "," + ui.values[ 1 ]);
						location = href;*/
						$( "#<?php echo $price_id; ?>" ).attr("data-value", ui.values[ 0 ] + "," + ui.values[ 1 ]);
					}
				});
				$( "#<?php echo $price_id; ?>" ).val(  $( "#<?php echo $slider_range_id; ?>" ).slider( "values", 0 ).toFixed(<?php echo $count_symbols; ?>) + " - "+ $( "#<?php echo $slider_range_id; ?>" ).slider( "values", 1 ).toFixed(<?php echo $count_symbols; ?>)  );
			});
			</script>
                </div>
            <?php } ?>

		<?php } ?>
	<?php } ?>
  </div>

</div>
</noindex>
<?php } ?>

<!-- /CoolFilter -->
