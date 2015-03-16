<noindex>
<div class="box">
  <div class="box-heading"><?php echo $heading_title; ?></div>
  <div class="box-content" style="text-align: center;">
	<?php if ($categories) { ?>
		<div >
		  <ul>
		<?php foreach ($categories as $category) { ?>
			<li><input type="checkbox" name="<?php echo $category['id']; ?>" name2="<?php echo $category['filtr_id']; ?>">
				<a href="<?php echo $category['href']; ?>"  ><?php echo $category['name']; ?></a>
				<a class="hidden" href="<?php echo $category['href']; ?>"><?php echo $category['name2']; ?></a>
			</input></li>
	        <?php } ?>
	        </ul>
	        </div>
	<?php } ?> 
  </div>
</div>
<?php foreach ($categories as $category) { ?>
      <div class="box" id="CoolCategory_<?php echo $category['id']; ?>"> </div>
<?php } ?>
<script>

$("input:checkbox").click(function(){
   var idName = "#CoolCategory_" + $(this).attr("name") ;
   if ($(this).is(":checked")) {

	var coolfilter_group_id = $(this).attr("name2") ;
	$.ajax({
		url: getAjaxUrl(coolfilter_group_id),
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
	showFilter();
});
	
function getAjaxUrl(coolfilter_group_id) {
	var href = location.href;
	var param = href.split('&');
	var path = '';
	for (var key in param) { 
		var val = param [key];
		if (val.substr(0,4) == 'path' ) path = '&' + val;
	}
	var href = 'index.php?route=module/coolfilter/getVal' + path + '&coolfilter_group_id='+ coolfilter_group_id;
	return href;
}
	
function showFilter() {

}
</script>
</noindex>
