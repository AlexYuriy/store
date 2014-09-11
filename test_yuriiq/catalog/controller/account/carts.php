<?php 
class ControllerAccountCarts extends Controller {
	private $error = array();
	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/order', '', 'SSL');
			$this->redirect($this->url->link('account/login', '', 'SSL'));
		}
		$this->language->load('account/carts');
		$this->load->model('account/carts');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->data['breadcrumbs'] = array();
		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),        	
			'separator' => false
		);
		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_account'),
			'href'      => $this->url->link('account/account', '', 'SSL'),        	
			'separator' => $this->language->get('text_separator')
		);
		$url = '';
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('account/carts', $url, 'SSL'),        	
			'separator' => $this->language->get('text_separator')
		);
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		if (false) {
			$this->data['attention'] = '';
		} else {
			$this->data['attention'] = '';
		}
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}
		if (isset($this->request->post['save'])) {
			$cart_name = $this->request->post['save'];
			if (empty($cart_name)) {
				$this->data['error_warning'] = $this->language->get('empty_cart_name');
			} else { 
				$ok = $this->model_account_carts->saveCart($cart_name);
				if ($ok) $this->data['success'] = $this->language->get('save_cart_success');
				else $this->data['error_warning'] = $this->language->get('save_cart_error');
			}
		}
		if (isset($this->request->get['remove'])) {
			$cart_id = $this->request->get['remove'];
			if (empty($cart_id)) {
				$this->data['error_warning'] = $this->language->get('empty_cart_id');
			} else {
				$ok = $this->model_account_carts->removeCart($cart_id);
				if ($ok) $this->data['success'] = $this->language->get('remove_cart_success');
				else $this->data['error_warning'] = $this->language->get('remove_cart_error');
			}
		}
		if (isset($this->request->get['load'])) {
			$cart_id = $this->request->get['load'];
			if (empty($cart_id)) {
				$this->data['error_warning'] = $this->language->get('empty_cart_id');
			} else {
				$ok = $this->model_account_carts->loadCart($cart_id);
				if ($ok) $this->session->data['success'] = $this->language->get('load_cart_success');
				else $this->error['warning'] = $this->language->get('load_cart_error');
				$this->redirect($this->url->link('checkout/cart', '', 'SSL'));
			}
		}
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_date_added'] = $this->language->get('text_date_added');
		$this->data['text_empty'] = $this->language->get('text_empty');
		$this->data['text_cart_id'] = $this->language->get('text_cart_id');
		$this->data['text_cart_name'] = $this->language->get('text_cart_name');
		$this->data['text_products'] = $this->language->get('text_products');
		$this->data['button_load'] = $this->language->get('button_load');
		$this->data['button_remove'] = $this->language->get('button_remove');
		$this->data['button_save'] = $this->language->get('button_save');
		$pagination = new Pagination();
		$carts_total = $this->model_account_carts->getTotalCarts();
		$pagination->total = $carts_total;
		$pagination->page = $page;
		$pagination->limit = 10;
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('account/carts', 'page={page}', 'SSL');
		$this->data['pagination'] = $pagination->render();
		$this->data['carts'] = array();
		$this->data['carts'] = $this->model_account_carts->getCarts($page, $pagination->limit);
		$this->data['current_cart_id'] = $this->model_account_carts->getCurrentCartId();		
		$this->data['save_cart']  = $this->url->link('account/carts/', '', 'SSL');
		$this->data['load_cart']  = $this->url->link('account/carts&load=', '', 'SSL');
		$this->data['remove_cart']= $this->url->link('account/carts&remove=', '', 'SSL');
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/carts.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/account/carts.tpl';
		} else {
			$this->template = 'default/template/account/carts.tpl';
		}
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'	
		);
		$this->response->setOutput($this->render());				
	}	
}
?>
