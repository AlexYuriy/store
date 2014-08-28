<div id="sidebar_cart_panel" class="sidebar_panel">
            <h2> <i class="fa fa-shopping-cart fa-lg"></i> <?php echo $text_cart; ?></h2>
               <!-- перечисляются товары с описанием -->
    <?php if ($products || $vouchers) { ?>
        <?php foreach ($products as $product) { ?>
		        <a href="<?php echo $product['href']; ?>">
					<table><tr>
						<td><?php echo $product['name']; ?>
                          <?php foreach ($product['option'] as $option) { ?>
                          - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small><br />
                          <?php } ?>
						</td>
                      <td><?php echo $product['quantity']; ?>&nbsp;x</td>
                      <td class="nowrap"><?php echo $product['total']; ?></td>
                    </tr></table></a>
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
                <!-- нижняя строка корзины -->
                  <table>
                    <?php foreach ($totals as $total) { ?>
                    <tr>
                      <td><b><?php echo $total['title']; ?>:</b></td>
                      <td class="right"><?php echo $total['text']; ?></td>
                    </tr>
                    <?php } ?>
                  </table>		
			<br>
			<a href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a> 
			<a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a> 
                <?php } else { ?>
          <p><?php echo $text_empty; ?></p>
                <?php } ?>
  </div>