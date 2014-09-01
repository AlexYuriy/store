<div class="left">
  <h2><?php echo $text_new_customer; ?></h2>
  <p><?php echo $text_register_account; ?></p>
  <label for="register">
	<input type="button" value="<?php echo $text_register; ?>" id="button-register" class="button" />
  </label>
  <br />
  <br />  
  <input type="button" value="<?php echo $text_guest; ?>" id="button-account" class="button" />
  <br />
  <br />
</div>
<div id="login" class="right">
  <h2><?php echo $text_returning_customer; ?></h2>
  <p><?php echo $text_i_am_returning_customer; ?></p>
  <b><?php echo $entry_email; ?></b><br />
  <input type="text" name="email" value="" />
  <br />
  <br />
  <b><?php echo $entry_password; ?></b><br />
  <input type="password" name="password" value="" />
  <br />
  <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a><br />
  <br />
  <input type="button" value="<?php echo $button_login; ?>" id="button-login" class="button" /><br />
  <br />
</div>