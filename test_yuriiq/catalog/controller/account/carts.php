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
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_date_added'] = $this->language->get('text_date_added');
		$this->data['text_empty'] = $this->language->get('text_empty');
		$this->data['text_cart_id'] = $this->language->get('text_cart_id');
		$this->data['text_cart_name'] = $this->language->get('text_cart_name');
		$this->data['text_products'] = $this->language->get('text_products');
		$this->data['button_load'] = $this->language->get('button_load');
		$this->data['button_remove'] = $this->language->get('button_remove');
		$this->data['button_save'] = $this->language->get('button_save');
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		if (isset($this->request->post['save_cart_name'])) {
			$cart_name = $this->request->post['cart_name'];
			if (empty($cart_name)) {
				
			} else $this->model_account_carts->saveCart($cart_name);
		}
		if (isset($this->request->get['remove_cart_id'])) {
			$cart_id = $this->request->get['remove_cart_id'];
			if (empty($cart_id)) {
				
			} else $this->model_account_carts->removeCart($cart_id);
		}
		$this->data['carts'] = array();
		$carts_total = $this->model_account_carts->getTotalCarts();
		$this->data['carts'] = $this->model_account_carts->getCarts();
		$pagination = new Pagination();
		$pagination->total = $carts_total;
		$pagination->page = $page;
		$pagination->limit = 10;
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('account/carts', 'page={page}', 'SSL');
		$this->data['pagination'] = $pagination->render();
		$this->data['save_cart'] = $this->url->link('account/carts/saveCart', '', 'SSL');
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
	public function saveCart() {
		$this->load->model('account/carts');
		$name = $this->request->post['cart_name'];
		$this->model_account_carts->saveCart($name);
		$this->redirect($this->url->link('account/carts', '', 'SSL'));
	}
	public function loadCart() {
		$this->load->model('account/carts');
		if (isset($this->request->get['cart_id'])) {
			$this->model_account_carts->loadCart($this->request->get['cart_id']);
		}
		$this->redirect($this->url->link('checkout/cart', '', 'SSL'));
	}
	public function removeCart() {
		$this->load->model('account/carts');
		if (isset($this->request->get['cart_id'])) {
			$this->model_account_carts->removeCart($this->request->get['cart_id']);
		}
		$this->redirect($this->url->link('account/carts', '', 'SSL'));
	}	
}
?>