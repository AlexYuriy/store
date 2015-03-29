<noindex>
<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content" style="text-align: center;">
	<?php if ($categories) { ?>
		<div class="cool_category">
		  <ul>
		<?php foreach ($categories as $category) { ?>
			<li><input type="checkbox" id="input_<?php echo $category['id']; ?>" category_id="<?php echo $category['id']; ?>" filtr_id="<?php echo $category['filtr_id']; ?>">
				<a href="<?php echo $category['href']; ?>"  ><?php echo $category['name']; ?></a>
				<!-- <a class="hidden" href="<?php echo $category['href']; ?>"><?php echo $category['name2']; ?></a> -->
			</input></li>
	        <?php } ?>
	        </ul>
	        </div>
	<?php } ?> 
  </div>
</div>
<?php foreach ($categories as $category) { ?>
	<div class="hidden" id="CoolFilter_<?php echo $category['id']; ?>" > 
	<?php if ($category['coolfilters'] ) { ?>
	<!-- CoolFilter -->
	<noindex>
	<div class="box" >
		<div class="box-heading"><?php echo $heading_title; ?></div>
		<div class="box-content">
		<?php foreach ($category['coolfilters']['coolfilters'] as $coolfilter) { ?>
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
								<li><a  <?php if($coolfilter_value['active']) {?> class="coolfilter_active" <?php } ?> filter_id="<?php echo $category['coolfilters']['filter_id']; ?>" data-key="<?php echo $coolfilter_value['key']; ?>" data-value="<?php echo $coolfilter_value['value']; ?>"><?php echo $coolfilter_value['name']; ?> <?php echo $coolfilter_value['view_count']; ?> </a> </li>
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
								<li><input type="checkbox" <?php if($coolfilter_value['active']) { ?>checked="checked"<?php } ?>><a  <?php if($coolfilter_value['active']) { ?> class="coolfilter_active" <?php } ?> filter_id="<?php echo $category['coolfilters']['filter_id']; ?>" data-key="<?php echo $coolfilter_value['key']; ?>" data-value="<?php echo $coolfilter_value['value']; ?>"><?php echo $coolfilter_value['name']; ?> <?php echo $coolfilter_value['view_count']; ?> </a></li>
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
									<li><input type="checkbox" <?php if($coolfilter_value['active']) { ?>checked="checked"<?php } ?>><a href="<?php echo $coolfilter_value['href']; ?>" <?php if($coolfilter_value['active']) { ?> class="coolfilter_active" <?php } ?>  filter_id="<?php echo $category['coolfilters']['filter_id']; ?>" data-key="<?php echo $coolfilter_value['key']; ?>" data-value="<?php echo $coolfilter_value['value']; ?>"><?php echo $coolfilter_value['name']; ?> <?php echo $coolfilter_value['view_count']; ?> </a></li>
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
								<a href="<?php echo $coolfilter_value['href']; ?>" <?php if($coolfilter_value['active']) { ?> class="coolfilter_active"  <?php } ?> filter_id="<?php echo $category['coolfilters']['filter_id']; ?>" data-key="<?php echo $coolfilter_value['key']; ?>" data-value="<?php echo $coolfilter_value['value']; ?>"><img src="<?php echo $coolfilter_value['image']; ?>" alt="<?php echo $coolfilter_value['name']; ?><?php echo $coolfilter_value['view_count']; ?>" title="<?php echo $coolfilter_value['name']; ?><?php echo  $coolfilter_value['view_count']; ?>"></a>
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
					<input type="text" id="<?php echo $category['coolfilters']['price_id']; ?>" style="border:0; color:#f6931f; background:#fff; font-weight:bold;" class="coolfilter_active" filter_id="<?php echo $category['coolfilters']['filter_id']; ?>" data-key="p" data-value="<?php echo $coolfilter['coolfilters'][0]['value'] . ',' . $coolfilter['coolfilters'][1]['value']; ?>" disabled="disabled" />
					<div id="<?php echo $category['coolfilters']['slider_range_id']; ?>" class="slider-range"></div>
				</div>
				<script>
				$(function() {
					if (/\Wp:[\d\.]+,[\d\.]+/.test(location.href)) {
						var myRe = /\Wp:([\d\.]+),([\d\.]+)/;
						var pricecoolfilterValue = myRe.exec(location.href);
						startValue = pricecoolfilterValue[1];
						endValue = pricecoolfilterValue[2];
						$("#<?php echo $category['coolfilters']['price_id']; ?>").attr('data-value', startValue + ',' + endValue);
					} else {
						startValue = <?php echo $coolfilter['coolfilters'][0]['value']; ?>;
						endValue = <?php echo $coolfilter['coolfilters'][1]['value']; ?>;
					}
					$( "#<?php echo $category['coolfilters']['slider_range_id']; ?>" ).slider({
						range: true,
						min: <?php echo $coolfilter['coolfilters'][0]['value']; ?>,
						max: <?php echo $coolfilter['coolfilters'][1]['value']; ?>,
						values: [ startValue, endValue ],
						slide: function( event, ui ) {
							$( "#<?php echo $category['coolfilters']['price_id']; ?>" ).val(  ui.values[ 0 ].toFixed(<?php echo $count_symbols; ?>) + " - "+ ui.values[ 1 ].toFixed(<?php echo $count_symbols; ?>)  );
						},
						change: function( event, ui ) {
							/*var href = '<?php echo htmlspecialchars_decode($coolfilter['coolfilters'][0]['href']); ?>';
							var exp = /p:[\d\.,]+/g;
							href = href.replace(exp, "p:" + ui.values[ 0 ] + "," + ui.values[ 1 ]);
							location = href;*/
							$( "#<?php echo $category['coolfilters']['price_id']; ?>" ).attr("data-value", ui.values[ 0 ] + "," + ui.values[ 1 ]);
						}
					});
					$( "#<?php echo $category['coolfilters']['price_id']; ?>" ).val(  $( "#<?php echo $category['coolfilters']['slider_range_id']; ?>" ).slider( "values", 0 ).toFixed(<?php echo $count_symbols; ?>) + " - "+ $( "#<?php echo $category['coolfilters']['slider_range_id']; ?>" ).slider( "values", 1 ).toFixed(<?php echo $count_symbols; ?>)  );
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
      </div>
<?php } ?>
	<div class="bottom">[ <a onclick="resetcoolfilter();"><?php echo $text_reset_coolfilter; ?></a> ]</div>
	<a id="coolfilter_apply_button" class="button"><span><?php echo $text_apply; ?></span></a>
  <div class="bottom">&nbsp;</div>

<script>
	$(".coolfilter-item a").click(function(e){ 
		e.preventDefault();
		$(this).toggleClass("coolfilter_active");
		var checkbox = $(this).siblings("input:checkbox");
		if (checkbox.is(':checked')) {
			checkbox.attr('checked', false);
		} else {
			checkbox.attr('checked', true);
		}
		showVal();
	});
	
	$(".coolfilter-item-checkbox input:checkbox, .coolfilter-item-select input:checkbox").click(function(){
		$(this).siblings("a").toggleClass("coolfilter_active");
		$(this).parents(".coolfilter-item-select-list").show();
		showVal();
	});
</script> 
<script>
$(".cool_category input:checkbox").click(function(){
   var categorie_id = $(this).attr("category_id") ;	
   var idName = "#CoolFilter_" + categorie_id ;
   if ($(this).is(':checked'))	$(idName).toggleClass("hidden", false);
   else $(idName).toggleClass("hidden", true);
/*
   var coolfilter_group_id = $(this).attr("filtr_id") ;

   var href = getValUrl(coolfilter_group_id, categorie_id);

   if ($(this).is(":checked")) {
	$.ajax({
		url: href,
		//dataType: 'json',	
		success: function(data) {
			$(idName).html(data);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
   } else {
	$(idName).html('');   	
   }
  */
});
	
function getValUrl(coolfilter_group_id, categorie_id) {
	var href = 'index.php?route=module/coolfilter/getVal&categorie_id=' + categorie_id + '&coolfilter_group_id='+ coolfilter_group_id;
	return href;
}
	$("#coolfilter_apply_button").click(function() {
		<?php foreach ($categories as $category) { ?>
			var idName = '#input_<?php echo $category['id']; ?>' ;
			applyFilter (idName, '<?php echo $category['href2']; ?> ','#CoolCategory_<?php echo $category['id']; ?>', '<?php echo $category['filter_id'] ; ?>' ) ; 
		<?php } ?> 
	});
	
	$(".coolfilter-item-select-head").click(function(){
		$(".coolfilter-item-select-list").not($(this).next(".coolfilter-item-select-list")).hide();
		$(this).next(".coolfilter-item-select-list").toggle(); 
		return false;
	});
	
	$(document).click(function(e){ 
		var $target = $(e.target);
		if (!$target.is("a") && !$target.is("input:checkbox")) { 
			$(".coolfilter-item-select-list").hide(); 
		} 
	});
	

		
	function applyFilter (active, href, idName, filtrId) {
		if ($(active).is(":checked")) {
			$(idName).parent().removeClass('hidden');
			href += "&coolfilter=" + getCoolfilter(filtrId) ;
			$.ajax({
				url: href,
				//dataType: 'json',	
				success: function(data) {
					$(idName).children(".product-list").html(data);
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		} else 	{
			//$(idName).html("");
			$(idName).parent().addClass('hidden');
		}
	}
	function getCoolfilter( filterId ) {
		var coolfilter = '';
		var arr = {};
		$(".coolfilter_active").each(function(i){
		if ($(this).attr("filter_id") == filterId) {
				var key = $(this).attr("data-key");
				var value = $(this).attr("data-value");
				if (arr[key] === undefined) {
					arr[key] = '';
					arr[key] += value;
				} else {
					arr[key] += ',' + value;
				}
			}
		});	
		$.each(arr, function(index,val){
			coolfilter += index + ':' + val + ';';
		});
		coolfilter = coolfilter.substr(0, coolfilter.length - 1);
		return coolfilter;
	}			
	function resetcoolfilter() {
		var href = location.href;
		var exp = /(\?|\&)coolfilter=(.*)?(&|$)/g;
		href = href.replace(exp, "");
		location = href;
	}
</script> 	
</noindex>
