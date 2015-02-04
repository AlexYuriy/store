<?php
class ModelCheckoutCart extends Model {
	public function getCurrentCartName(){
		$this->language->load('checkout/cart');
		$user_id = $this->customer->getId();
		if (empty($user_id)) return $this->language->get('text_default_cart_name'); 
		else {		
			$query = $this->db->query("SELECT `name` AS name FROM `" . DB_PREFIX . "carts` carts, `" . DB_PREFIX . "customer` customer WHERE customer.customer_id = '" . (int)$this->customer->getId() . "' AND customer.current_cart_id = carts.cart_id");
			if ($query->num_rows != 0){
					return $query->row['name'];
			} else {
					return $this->language->get('text_default_cart_name');
			}
		}
	}
			
	public function rewriteCart($new_name) {
		$user_id = $this->customer->getId();
		if (empty($user_id)) return false; else {
			if (empty($new_name)) $new_name = getCurrentCartName();
			$cart = $this->db->escape(isset($this->session->data['cart']) ? serialize($this->session->data['cart']) : '');
			if (empty($cart)) return false; else {
				$count = $this->cart->countProducts();
				$query = $this->db->query("UPDATE `" . DB_PREFIX . "carts` SET name = '" . $new_name . "', cart = '".$cart."', count = '".$count."' WHERE `cart_id` =  ( SELECT `current_cart_id` FROM `" . DB_PREFIX . "customer` WHERE `customer_id` = " . $user_id . " ) ");
				// Возможно, действительно имеет смысл хранить это в сессии
				//$this->session->data['current_cart_id'] = $cart->row['cart_id'];
				return true;
			}
		}
	}
	
	// сохраняет корзину с новым именем
	public function saveCart($name) {
		$customer_id = $this->customer->getId();
		if (empty($name)||empty($customer_id)) return false; else {
			$cart = $this->db->escape(isset($this->session->data['cart']) ? serialize($this->session->data['cart']) : '');
			$count = $this->cart->countProducts();
			if (empty($cart)) return false; else {
				$query = $this->db->query("INSERT INTO " . DB_PREFIX . "carts SET customer_id = '" . (int)$this->customer->getId() . "', name = '".$name."', count = '".$count."', cart = '".$cart."' , date_added = NOW()");
				// Возможно, действительно имеет смысл хранить это в сессии
				//$this->session->data['current_cart_id'] = $cart->row['cart_id'];
				$query = $this->db->query("UPDATE `" . DB_PREFIX . "customer` SET current_cart_id =  (SELECT MAX(`cart_id`) FROM `" . DB_PREFIX . "carts` WHERE customer_id = " . $customer_id . ") WHERE customer_id = " . $customer_id );
				return true;
			}
		}
	}
	
	// переводит current_cart_id у пользователя в 0
	public function setCurrentCartIDToNull(){
		// Возможно, действительно имеет смысл хранить это в сессии
		//$this->session->data['current_cart_id'] = 0;
		$query = $this->db->query("UPDATE `" . DB_PREFIX . "customer` SET current_cart_id = 0 WHERE customer_id = " . (int)$this->customer->getId() );
	}
}
