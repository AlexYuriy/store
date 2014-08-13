<?php 
include '../../../system/engine/controller.php';

class ControllerModuleTempCart extends Controller {
	public function index() {
			$this->language->load('module/cart');
		
      	if (isset($this->request->get['remove'])) {
          	$this->cart->remove($this->request->get['remove']);
			
			unset($this->session->data['vouchers'][$this->request->get['remove']]);
      	}	
			
		// Totals
		$this->load->model('setting/extension');
		
		$total_data = array();					
		$total = 0;
		$taxes = $this->cart->getTaxes();
		
		// Display prices
		if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
			$sort_order = array(); 
			
			$results = $this->model_setting_extension->getExtensions('total');
			
			foreach ($results as $key => $value) {
				$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
			}
			
			array_multisort($sort_order, SORT_ASC, $results);
			
			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('total/' . $result['code']);
		
					$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
				}
				
				$sort_order = array(); 
			  
				foreach ($total_data as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}
	
				array_multisort($sort_order, SORT_ASC, $total_data);			
			}		
		}
		
		$totals = $total_data;
		
		$heading_title = $this->language->get('heading_title');
		
		$text_items = sprintf($this->language->get('text_items'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total));
		$text_empty = $this->language->get('text_empty');
		$text_cart = $this->language->get('text_cart');
		$text_checkout = $this->language->get('text_checkout');
		
		$button_remove = $this->language->get('button_remove');
		
		$this->load->model('tool/image');
		
		$products = array();
			
		foreach ($this->cart->getProducts() as $product) {
			if ($product['image']) {
				$image = $this->model_tool_image->resize($product['image'], $this->config->get('config_image_cart_width'), $this->config->get('config_image_cart_height'));
			} else {
				$image = '';
			}
							
			$option_data = array();
			
			foreach ($product['option'] as $option) {
				if ($option['type'] != 'file') {
					$value = $option['option_value'];	
				} else {
					$filename = $this->encryption->decrypt($option['option_value']);
					
					$value = utf8_substr($filename, 0, utf8_strrpos($filename, '.'));
				}				
				
				$option_data[] = array(								   
					'name'  => $option['name'],
					'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value),
					'type'  => $option['type']
				);
			}
			
			// Display prices
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}
			
			// Display prices
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$total = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity']);
			} else {
				$total = false;
			}
													
			$products[] = array(
				'key'      => $product['key'],
				'thumb'    => $image,
				'name'     => $product['name'],
				'model'    => $product['model'], 
				'option'   => $option_data,
				'quantity' => $product['quantity'],
				'price'    => $price,	
				'total'    => $total,	
				'href'     => $this->url->link('product/product', 'product_id=' . $product['product_id'])		
			);
		}
		
		// Gift Voucher
		$vouchers = array();
		
		if (!empty($this->session->data['vouchers'])) {
			foreach ($this->session->data['vouchers'] as $key => $voucher) {
				$vouchers[] = array(
					'key'         => $key,
					'description' => $voucher['description'],
					'amount'      => $this->currency->format($voucher['amount'])
				);
			}
		}
					
		$cart = $this->url->link('checkout/cart');
						
		$checkout = $this->url->link('checkout/checkout', '', 'SSL');
	
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/cart.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/cart.tpl';
		} else {
			$this->template = 'default/template/module/cart.tpl';
		}
				
		$this->render();
		
		
		
		
	?>	
	<div id="cart">
	    <div class="heading">
	      <a title="<?php echo $heading_title; ?>"><span id="cart-total"><?php echo $text_items; ?></span></a></div>
	    <div class="content">
	      <?php if ($products || $vouchers) { ?>
	      <div class="mini-cart-info">
		<table>
		  <?php foreach ($products as $product) { ?>
		  <tr>
		    <td class="image"><?php if ($product['thumb']) { ?>
		      <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
		      <?php } ?></td>
		    <td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
		      <div>
			<?php foreach ($product['option'] as $option) { ?>
			- <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small><br />
			<?php } ?>
		      </div></td>
		    <td class="quantity">x&nbsp;<?php echo $product['quantity']; ?></td>
		    <td class="total"><?php echo $product['total']; ?></td>
		    <td class="remove"><img src="catalog/view/theme/default/image/remove-small.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $product['key']; ?>' : $('#cart').load('index.php?route=module/cart&remove=<?php echo $product['key']; ?>' + ' #cart > *');" /></td>
		  </tr>
		  <?php } ?>
		  <?php foreach ($vouchers as $voucher) { ?>
		  <tr>
		    <td class="image"></td>
		    <td class="name"><?php echo $voucher['description']; ?></td>
		    <td class="quantity">x&nbsp;1</td>
		    <td class="total"><?php echo $voucher['amount']; ?></td>
		    <td class="remove"><img src="catalog/view/theme/default/image/remove-small.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $voucher['key']; ?>' : $('#cart').load('index.php?route=module/cart&remove=<?php echo $voucher['key']; ?>' + ' #cart > *');" /></td>
		  </tr>
		  <?php } ?>
		</table>
	      </div>
	      <div class="mini-cart-total">
		<table>
		  <?php foreach ($totals as $total) { ?>
		  <tr>
		    <td class="right"><b><?php echo $total['title']; ?>:</b></td>
		    <td class="right"><?php echo $total['text']; ?></td>
		  </tr>
		  <?php } ?>
		</table>
	      </div>
	      <div class="checkout"><a href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a> | <a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></div>
	      <?php } else { ?>
	      <div class="empty"><?php echo $text_empty; ?></div>
	      <?php } ?>
	    </div>
	  </div>
	  <?php	
	}
}
?>