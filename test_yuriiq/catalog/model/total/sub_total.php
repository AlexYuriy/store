<?php
class ModelTotalSubTotal extends Model {
	public function getTotal(&$total_data, &$total, &$taxes) {
		$this->language->load('total/sub_total');
		
		$sub_total = $this->cart->getSubTotal();
		
		if (isset($this->session->data['vouchers']) && $this->session->data['vouchers']) {
			foreach ($this->session->data['vouchers'] as $voucher) {
				$sub_total += $voucher['amount'];
			}
		}
		$sub_total_s=$sub_total*(1-($this->customer->getDiscount())/100);
		
		$total_data[] = array( 
			'code'       => 'sub_total',
			'title'      => $this->language->get('text_sub_total'),
			'text'       => $this->currency->format($sub_total),
			'value'      => $sub_total,
			'sort_order' => $this->config->get('sub_total_sort_order'),
			'text_s'       => $this->currency->format($sub_total_s),
			'value_s'      => $sub_total_s
		);
		
		$total += $sub_total;
	}
}
?>