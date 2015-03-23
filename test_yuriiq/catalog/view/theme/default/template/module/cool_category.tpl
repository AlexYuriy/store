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
      <div id="CoolFilter_<?php echo $category['id']; ?>"> </div>
<?php } ?>
	<div class="bottom">[ <a onclick="resetcoolfilter();"><?php echo $text_reset_coolfilter; ?></a> ]</div>
	<a id="coolfilter_apply_button" class="button"><span><?php echo $text_apply; ?></span></a>
  <div class="bottom">&nbsp;</div>
<script>

$(".cool_category input:checkbox").click(function(){
   var coolfilter_group_id = $(this).attr("filtr_id") ;
   var categorie_id = $(this).attr("category_id") ;	
   var href = getValUrl(coolfilter_group_id, categorie_id);
   var idName = "#CoolFilter_" + categorie_id ;
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
});
	
function getValUrl(coolfilter_group_id, categorie_id) {
	var href = 'index.php?route=module/coolfilter/getVal&categorie_id=' + categorie_id + '&coolfilter_group_id='+ coolfilter_group_id;
	return href;
}

</script>

<script>
	$("#coolfilter_apply_button").click(function() {
		<?php foreach ($categories as $category) { ?>
			var idName = '#input_<?php echo $category['id']; ?>' ;
			applyFilter (idName, '<?php echo $category['href2']; ?> ','#CoolCategory_<?php echo $category['id']; ?>') ; 
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
		
	function applyFilter (active, href, idName) {
		if ($(active).is(":checked")) {
			$(idName).parent().removeClass('hidden');
			//href += "&coolfilter=" + getCoolfilter() ;
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
	function getCoolfilter() {
		var coolfilter = '';
		var arr = {};
		$(".coolfilter_active").each(function(i){
			var key = $(this).attr("data-key");
			var value = $(this).attr("data-value");
			if (arr[key] === undefined) {
				arr[key] = '';
				arr[key] += value;
			} else {
				arr[key] += ',' + value;
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
