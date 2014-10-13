    <h2><?php echo $text_your_address; ?></h2>
      <table class="form">        
        <tr style="display: <?php echo (count($customer_groups) > 1 ? 'table-row' : 'none'); ?>;">
          <td><?php echo $entry_customer_group; ?></td>
          <td><?php foreach ($customer_groups as $customer_group) { ?>
            <?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
            <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
            <label for="customer_group_id<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></label>
            <br />
            <?php } else { ?>
            <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" />
            <label for="customer_group_id<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></label>
            <br />
            <?php } ?>
            <?php } ?></td>
        </tr>
        <tr id="company-display">
          <td><span class="required">*</span> <?php echo $entry_company; ?></td>
          <td><input type="text" name="company" value="<?php echo $company; ?>" />
		  <br></td>
        </tr>		
        <tr id="company-id-display">
          <td><span class="required">*</span> <?php echo $entry_company_id; ?></td>
          <td><input type="text" name="company_id" value="<?php echo $company_id; ?>" />
		  <br></td>
        </tr>
        <tr id="tax-id-display">
          <td><span class="required">*</span> <?php echo $entry_tax_id; ?></td>
          <td><input type="text" name="tax_id" value="<?php echo $tax_id; ?>" />
		  <br></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_country; ?></td>
          <td><select name="country_id">
              <option value=""><?php echo $text_select; ?></option>
              <?php foreach ($countries as $country) { ?>
              <?php if ($country['country_id'] == $country_id) { ?>
              <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
              <?php } ?>
              <?php } ?>
            </select><br></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_zone; ?></td>
          <td><select name="zone_id">
            </select><br></td>
        </tr>
		<tr>
          <td><span class="required">*</span> <?php echo $entry_city; ?></td>
          <td><input type="text" name="city" value="<?php echo $city; ?>" />
		  <br><div id="city_id"></div></td>
        </tr>
		<tr>
          <td><span id="postcode-required" class="required">*</span> <?php echo $entry_postcode; ?></td>
          <td><input type="text" name="postcode" value="<?php echo $postcode; ?>" />
		  <br></td>
        </tr>
		<tr>
          <td><span class="required">*</span><?php echo $entry_address_1; ?></td>
          <td><input type="text" name="address_1" value="<?php echo $address_1; ?>" />
		  <br></td>
        </tr>
      </table>

<script type="text/javascript"><!--
var city = new Array();
$('select[name=\'zone_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=account/register/zone&zone_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'zone_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#postcode-required').show();
			} else {
				$('#postcode-required').hide();
			}
			if (json['city'] != '') {
				city.length = json['city'].length;
				for (i = 0; i < json['city'].length; i++) {
					city[i] = json['city'][i]['name'];
				}
			} 
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'zone_id\']').trigger('change');

function selectCity(name) {
	$('input[name=\'city\']').val( name);
	$('#city_id').html('');
}
//--></script> 

<script type="text/javascript"><!--
$('input[name=\'city\']').bind('input', function() {
	$('#city_id').html('');
	var value = $('input[name=\'city\']').val().toUpperCase();
	if (value.length > 0) {
		var html = '<ul>';
		var n = 0;
		for (i = 0; i < city.length; i++) {
			var str1 = city[i].toUpperCase();
			if (str1.indexOf(value) >=0 ) {
				html += '<li><a onclick="selectCity(\''+city[i]+'\')" >';	
				html += city[i] + '</a></li>';
				++n;
			}
			if (n > 10) break;
		} 
		html +='</ul>';
		$('#city_id').html(html);
	}
});
//--></script> 