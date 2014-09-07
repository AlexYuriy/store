<?php
class ModelAccountCarts extends Model {
	public function getCarts() {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "carts` WHERE customer_id = '" . (int)$this->customer->getId() . "' ORDER BY `date_added` DESC");
		return $query->rows;
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
				return true;
			}
		}
	}
	
	public function loadCart($cart_id) {
		if (empty($cart_id)) return false; else {
			$cart = $this->db->query("SELECT cart FROM  `" . DB_PREFIX . "carts` WHERE cart_id =  '" . (int)$cart_id . "'");
			if (empty($cart->row['cart'])) return false; else {
				$this->cart->clear();
				$this->session->data['cart'] = unserialize ($cart->row['cart'] );
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
}
?>
