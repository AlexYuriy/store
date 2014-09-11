<?php
class ModelAccountCarts extends Model {
	public function getCarts($page, $limit) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "carts` WHERE customer_id = '" . (int)$this->customer->getId() . "' ORDER BY `date_added` DESC");
		return array_slice ($query->rows, ($page-1)*$limit, $limit);
	}
	public function getCurrentCartId() {
		//if (isset($this->session->data['current_cart_id'])) {
		//	$cart_id = $this->session->data['current_cart_id'];
		//} else {
			$query_cart_id = $this->db->query("SELECT current_cart_id FROM `" . DB_PREFIX . "customer` WHERE customer_id = " . (int)$this->customer->getId() );
			$cart_id = $query_cart_id->row['current_cart_id'];
		//}
		return $cart_id;
	}
	public function getTotalCarts() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "carts` WHERE customer_id = '" . (int)$this->customer->getId() . "'");
		return $query->row['total'];
	}
	
	public function saveCart($name) {
		if (empty($name)) return false; else {
			$cart = $this->db->escape(isset($this->session->data['cart']) ? serialize($this->session->data['cart']) : '');
			$count = $this->cart->countProducts();
			if (empty($cart)) return false; else {
				$query = $this->db->query("INSERT INTO " . DB_PREFIX . "carts SET customer_id = '" . (int)$this->customer->getId() . "', name = '".$name."', count = '".$count."', cart = '".$cart."' , date_added = NOW()");
				// Возможно, действительно имеет смысл хранить это в сессии
				$this->session->data['current_cart_id'] = $cart->row['cart_id'];
				$id = (int)$this->customer->getId();
				$query = $this->db->query("UPDATE `" . DB_PREFIX . "customer` SET current_cart_id =  (SELECT MAX(`cart_id`) FROM `" . DB_PREFIX . "carts` WHERE customer_id = " . $id . ") WHERE customer_id = " . $id );
				return true;
			}
		}
	}
	
	public function loadCart($cart_id) {
		if (empty($cart_id)) return false; else {
			$cart = $this->db->query("SELECT * FROM  `" . DB_PREFIX . "carts` WHERE cart_id =  '" . (int)$cart_id . "'");
			if (empty($cart->row['cart'])) return false; else {
				$this->cart->clear();
				$this->session->data['cart'] = unserialize ($cart->row['cart'] );
				//сделать загруженную корзину текущей.
				// Возможно, действительно имеет смысл хранить это в сессии
				$this->session->data['current_cart_id'] = $cart->row['cart_id'];
				$query = $this->db->query("UPDATE `" . DB_PREFIX . "customer` SET current_cart_id = " .$cart->row['cart_id'] ." WHERE customer_id = " . (int)$this->customer->getId() );
				return true;
			}
		}
	}
	
	public function removeCart($cart_id) {
		if (empty($cart_id)) return false; else {
			$query = $this->db->query("DELETE FROM `" . DB_PREFIX . "carts` WHERE cart_id = '" . (int)$cart_id . "'");
			if (empty($query)) return false; else return true;
		}
	}
	
	// создаёт пустую корзину с уникальным именем типа Корзина № или аналог на другом языка
	public function createEmptyCart(){
	    $this->language->load('account/carts');
	    
	    $word_cart = $this->language->get('word_cart');
	    $user_id = $this->customer->getId();
	    
	    $query = $this->db->query("SELECT `name` FROM `" . DB_PREFIX . "carts` WHERE `customer_id` = " . $user_id . " AND name LIKE '" . $word_cart . "_%' ");
	    
	    
	}
	// переводит current_cart_id у пользователя в 0
	public function setCurrentCartIDToNull(){
		// Возможно, действительно имеет смысл хранить это в сессии
		$this->session->data['current_cart_id'] = 0;
		$query = $this->db->query("UPDATE `" . DB_PREFIX . "customer` SET current_cart_id = 0 WHERE customer_id = " . (int)$this->customer->getId() );
	}
}
?>
