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
			if (!empty($cart)) {
				$query = $this->db->query("INSERT INTO " . DB_PREFIX . "carts SET customer_id = '" . (int)$this->customer->getId() . "', name = '".$name."', count = '".$count."', cart = '".$cart."' , date_added = NOW()");
				return true;
			} else return false;
		}
	}
	public function loadCart($cart_id) {
		$this->cart->clear();
		$cart = $this->db->query("SELECT cart FROM  `" . DB_PREFIX . "carts` WHERE cart_id =  '" . (int)$cart_id . "'");
		if (!empty($cart->row['cart'])) {
			$this->session->data['cart'] = unserialize ($cart->row['cart'] );
			return true;
		} else return false;
	}
	
	public function removeCart($cart_id) {
		$query = $this->db->query("DELETE FROM `" . DB_PREFIX . "carts` WHERE cart_id = '" . (int)$cart_id . "'");
		if (empty($query)) return false; else true;
	}
}
?>