<?php
class ModelLocalisationCurrency extends Model {
	public function setDefaultCurrency($price,$currency) {
		if(!empty($price)) {
		$query = $this->db->query("SELECT value FROM " . DB_PREFIX . "currency WHERE currency_id = '" .(int)$currency. "'");
			if ($query->num_rows) {
			return $final_price = ($price * $query->row['value']);
			}
		}
	}
	public function addCurrency($data) {
		$data['value']=1/$data['value'];
		$this->db->query("INSERT INTO " . DB_PREFIX . "currency SET title = '" . $this->db->escape($data['title']) . "', code = '" . $this->db->escape($data['code']) . "', symbol_left = '" . $this->db->escape($data['symbol_left']) . "', symbol_right = '" . $this->db->escape($data['symbol_right']) . "', decimal_place = '" . $this->db->escape($data['decimal_place']) . "', value = '" . $this->db->escape($data['value']) . "', status = '" . (int)$data['status'] . "', date_modified = NOW()");
		$this->cache->delete('currency');
	}

	public function editCurrency($currency_id, $data) {
		$data['value']=1/$data['value'];
		$data['symbol_left'] = htmlspecialchars_decode( $data['symbol_left'] );
		$data['symbol_right'] = htmlspecialchars_decode( $data['symbol_right'] );
		$this->db->query("UPDATE " . DB_PREFIX . "currency SET title = '" . $this->db->escape($data['title']) . "', code = '" . $this->db->escape($data['code']) . "', symbol_left = '" . $this->db->escape($data['symbol_left']) . "', symbol_right = '" . $this->db->escape($data['symbol_right']) . "', decimal_place = '" . $this->db->escape($data['decimal_place']) . "', value = '" . $this->db->escape($data['value']) . "', status = '" . (int)$data['status'] . "', date_modified = NOW() WHERE currency_id = '" . (int)$currency_id . "'");
		$results = $this->db->query("SELECT product_id,price,base_price from  " . DB_PREFIX . "product where currency_id='".$currency_id."'");
		$query = $this->db->query("SELECT value FROM " . DB_PREFIX . "currency WHERE currency_id = '" .(int)$currency_id. "'");
		$currency=$query->row['value'];
		foreach ($results as $result) {
		$result['price']=$result['base_price']*$currency;
		$this->db->query("UPDATE " . DB_PREFIX . "product SET product price = '". $result['price'] . "' where product_id='".$result['product_id']."'");
		}
		
		//$this->db->query("UPDATE " . DB_PREFIX . "product SET product price = '" . setDefaultCurrency( . "' base_price '". ,$currency_id). "' where p.currency_id='".$currency_id."'");
		$this->cache->delete('currency');
	}

	public function deleteCurrency($currency_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "currency WHERE currency_id = '" . (int)$currency_id . "'");

		$this->cache->delete('currency');
	}

	public function getCurrency($currency_id) {
		$query = $this->db->query("SELECT DISTINCT *, 1/value as value FROM " . DB_PREFIX . "currency WHERE currency_id = '" . (int)$currency_id . "'");

		return $query->row;
	}

	public function getCurrencyByCode($currency) {
		$query = $this->db->query("SELECT DISTINCT *, 1/value as value FROM " . DB_PREFIX . "currency WHERE code = '" . $this->db->escape($currency) . "'");

		return $query->row;
	}

	public function getCurrencies($data = array()) {
		if ($data) {
			$sql = "SELECT *, 1/value as value FROM " . DB_PREFIX . "currency";

			$sort_data = array(
				'title',
				'code',
				'value',
				'date_modified'
			);	

			if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
				$sql .= " ORDER BY " . $data['sort'];	
			} else {
				$sql .= " ORDER BY title";	
			}

			if (isset($data['order']) && ($data['order'] == 'DESC')) {
				$sql .= " DESC";
			} else {
				$sql .= " ASC";
			}

			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}				

				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}	

				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}

			$query = $this->db->query($sql);

			return $query->rows;
		} else {
			$currency_data = $this->cache->get('currency');

			if (!$currency_data) {
				$currency_data = array();

				$query = $this->db->query("SELECT *, 1/value as value FROM " . DB_PREFIX . "currency ORDER BY title ASC");

				foreach ($query->rows as $result) {
					$currency_data[$result['code']] = array(
						'currency_id'   => $result['currency_id'],
						'title'         => $result['title'],
						'code'          => $result['code'],
						'symbol_left'   => $result['symbol_left'],
						'symbol_right'  => $result['symbol_right'],
						'decimal_place' => $result['decimal_place'],
						'value'         => $result['value'],
						'status'        => $result['status'],
						'date_modified' => $result['date_modified']
					);
				}

				$this->cache->set('currency', $currency_data);
			}

			return $currency_data;			
		}
	}	


	public function getTotalCurrencies() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "currency");

		return $query->row['total'];
	}
}
?>
