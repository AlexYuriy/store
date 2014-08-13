<div class="sidebar_item_body" id="cart" onScroll="MoveCenterScreen('cart');">  
        <div class="sidebar_content">
            <h2> <?php echo $text_cart; ?></h2>
            <div class="content" id="cart">
                <?php if ($products || $vouchers) { ?>
                <!-- перечисляются товары с описанием -->
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
                      <td class="quantity">x&nbsp;1 </td>
                      <td class="total"><?php echo $voucher['amount']; ?></td>
                      <td class="remove"><img src="catalog/view/theme/default/image/remove-small.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $voucher['key']; ?>' : $('#cart').load('index.php?route=module/cart&remove=<?php echo $voucher['key']; ?>' + ' #cart > *');" /></td>
                    </tr>
                    <?php } ?>
                  </table>
                </div>
                <!-- нижняя строка корзины -->
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
                <div class="checkout"><a href="<?php echo $shopping_cart; ?>"><?php echo $text_cart; ?></a> | <a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a> | <a href="<?php echo $order; ?>"><?php echo $text_order; ?></a> </div>
                <?php } else { ?>
                <div class="empty"><?php echo $text_empty; ?>
                    <p><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a>
                </div>
                <?php } ?>
                
              </div>
        </div>
    </div>
