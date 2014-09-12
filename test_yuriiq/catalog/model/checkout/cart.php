<?php
class ModelCheckoutCart extends Model {
	public function getCurrentCartName(){
                $user_id = $this->customer->getId();
                $this->language->load('checkout/cart');
                
                $query = $this->db->query("SELECT `name` AS name FROM `" . DB_PREFIX . "carts` carts, `" . DB_PREFIX . "customer` customer WHERE customer.customer_id = '" . (int)$this->customer->getId() . "' AND customer.current_cart_id = carts.cart_id");
                
                if ($query->num_rows != 0){
                        return $query->row['name'];
                }
                else {
                        return $this->language->get('text_default_cart_name');
                }
	}
	
	// изменяет имя текущей корзины 
	public function editCurrentCartName($new_name){
	    $user_id = $this->customer->getId();
	    
	    $this->db->query("UPDATE `" . DB_PREFIX . "carts` SET `name` = '" . $new_name . "' WHERE `cart_id` =  ( SELECT `current_cart_id` FROM `" . DB_PREFIX . "customer` WHERE `customer_id` = " . $user_id . " ) "); 
	}
		
	public function rewriteCart() {
	    $cart = $this->db->escape(isset($this->session->data['cart']) ? serialize($this->session->data['cart']) : '');
			$count = $this->cart->countProducts();
			$user_id = $this->customer->getId();
			
			if (empty($cart)) return false; else {
				$query = $this->db->query("UPDATE " . DB_PREFIX . "carts SET cart = '".$cart."', count = '".$count."' WHERE `cart_id` =  ( SELECT `current_cart_id` FROM `" . DB_PREFIX . "customer` WHERE `customer_id` = " . $user_id . " ) ");
				// Возможно, действительно имеет смысл хранить это в сессии
				//$this->session->data['current_cart_id'] = $cart->row['cart_id'];
				
				return true;
			}
	}
	
	// сохраняет корзину с новым именем
	public function saveCart($name) {
		if (empty($name)) return false; else {
			$cart = $this->db->escape(isset($this->session->data['cart']) ? serialize($this->session->data['cart']) : '');
			$count = $this->cart->countProducts();
			if (empty($cart)) return false; else {
				$query = $this->db->query("INSERT INTO " . DB_PREFIX . "carts SET customer_id = '" . (int)$this->customer->getId() . "', name = '".$name."', count = '".$count."', cart = '".$cart."' , date_added = NOW()");
				// Возможно, действительно имеет смысл хранить это в сессии
				//$this->session->data['current_cart_id'] = $cart->row['cart_id'];
				$id = (int)$this->customer->getId();
				$query = $this->db->query("UPDATE `" . DB_PREFIX . "customer` SET current_cart_id =  (SELECT MAX(`cart_id`) FROM `" . DB_PREFIX . "carts` WHERE customer_id = " . $id . ") WHERE customer_id = " . $id );
				return true;
			}
		}
	}
	
	
	
	// переводит current_cart_id у пользователя в 0
	public function setCurrentCartIDToNull(){
		// Возможно, действительно имеет смысл хранить это в сессии
		$this->session->data['current_cart_id'] = 0;
		$query = $this->db->query("UPDATE `" . DB_PREFIX . "customer` SET current_cart_id = 0 WHERE customer_id = " . (int)$this->customer->getId() );
	}
}
