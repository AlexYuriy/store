<?php 
class ControllerProductCoolCategory extends Controller {  
	public function index() { 
		$this->language->load('product/category');
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$this->load->model('tool/image'); 
		$this->data['breadcrumbs'] = array();
		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
			'separator' => false
		);
		if (isset($this->request->get['path'])) {
			$path = '';
			$parts = explode('_', (string)$this->request->get['path']);
			$category_id = (int)array_pop($parts);
			foreach ($parts as $path_id) {
				if (!$path) {
					$path = (int)$path_id;
				} else {
					$path .= '_' . (int)$path_id;
				}
			}
		} else {
			$category_id = 0;
		}
		$category_info = $this->model_catalog_category->getCategory($category_id);
		if ($category_info || $category_id == 0) {
					if ($category_id == 0) {
						$category_info = array('name' => $this->language->get('text_all_products'),
							'seo_title' => '',
							'meta_description' => '',
							'meta_keyword' => '',
							'seo_h1' => $this->language->get('text_all_products'),
							'image' => '',
							'description' => '');
						//india style fix	
						$this->request->get['path'] = 0;
						//india style fix							
					}		
			if ($category_info['seo_title']) {
		  		$this->document->setTitle($category_info['seo_title']);
			} else {
		  		$this->document->setTitle($category_info['name']);
			}			
			$this->document->setDescription($category_info['meta_description']);
			$this->document->setKeywords($category_info['meta_keyword']);			
			if ($category_info['seo_h1']) {
				$this->data['heading_title'] = $category_info['seo_h1'];
				} else {
				$this->data['heading_title'] = $category_info['name'];
			}			
			$this->document->addScript('catalog/view/javascript/jquery/jquery.total-storage.min.js');
			$this->document->addScript('catalog/view/javascript/jquery/jail/jail.min.js');
			$this->data['text_empty'] = $this->language->get('text_empty');	
			$this->data['text_display'] = $this->language->get('text_display');
			if ($category_info['image']) {
				$this->data['thumb'] = $this->model_tool_image->resize($category_info['image'], $this->config->get('config_image_category_width'), $this->config->get('config_image_category_height'));
				$this->document->setOgImage($this->data['thumb']);
			} else {
				$this->data['thumb'] = '';
			}
			$this->data['description'] = html_entity_decode($category_info['description'], ENT_QUOTES, 'UTF-8');
			$this->data['categories'] = array();
			$results = $this->model_catalog_category->getCategories($category_id);
			foreach ($results as $result) {
				$data = array(
					'filter_category_id'  => $result['category_id'],
					'filter_sub_category' => true
				);
				$product_total = $this->model_catalog_product->getTotalProducts($data);	
				if (($result['image']) && ($result['image']!= 'no_image.jpg')) {
						$image = $this->model_tool_image->resize($result['image'], 
								$this->config->get('config_image_menu_category_width'), 
								$this->config->get('config_image_menu_category_height'));
					} else {
						$image = '';
					}
				$this->data['categories'][] = array(
					'name'  => $result['name'] . ($this->config->get('config_product_count') ? ' (' . $product_total . ')' : ''),
					'count' => $product_total,
					'image' => $image,
					'id'	=> $result['category_id'], 
					'href'  => $this->url->link('product/category', 'path=' . $result['category_id'] ) 
				);
			}
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/coolcategory.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/product/coolcategory.tpl';
			} else {
				$this->template = 'default/template/product/coolcategory.tpl';
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
		} else {
			$this->document->setTitle($this->language->get('text_error'));
			$this->data['heading_title'] = $this->language->get('text_error');
			$this->data['text_error'] = $this->language->get('text_error');
			$this->data['button_continue'] = $this->language->get('button_continue');
			$this->data['continue'] = $this->url->link('common/home');
			$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . '/1.1 404 Not Found');
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('product/category'),
				'separator' => $this->language->get('text_separator')
			);
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
			} else {
				$this->template = 'default/template/error/not_found.tpl';
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
	
	public function getProduct() { 
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		$this->language->load('product/category');
		$this->data['button_cart'] = $this->language->get('button_cart');
		$this->data['button_wishlist'] = $this->language->get('button_wishlist');
		$this->data['button_compare'] = $this->language->get('button_compare');
		$this->data['button_continue'] = $this->language->get('button_continue');
		if (isset($this->request->get['path'])) {
			$category_id = $this->request->get['path'];
		} else 	$category_id = '';
		if (isset($this->request->get['coolfilter'])) {
			$coolfilter = $this->request->get['coolfilter'];
		} else 	$coolfilter = '';
		$sort = '';
		$order = '';
		$page = 1;
		$limit = 5; 
		$this->data['products'] = array();
		$data = array(
			'filter_category_id' => $category_id,
			'sort'               => $sort,
			'order'              => $order,
			'start'              => ($page - 1) * $limit,
			'limit'              => $limit,
			'coolfilter'         => $coolfilter
		);
		$product_total = $this->model_catalog_product->getTotalProducts($data); 
		$results = $this->model_catalog_product->getProducts($data);
		foreach ($results as $result) {
			if ($result['image']) {
				$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
				$imagewidth = $this->config->get('config_image_product_width');
				$imageheight = $this->config->get('config_image_product_height');
			} else {
				$image = false;
				$imagewidth = '';
				$imageheight = '';
			}
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}
			if ((float)$result['special']) {
				$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$special = false;
			}	
			if ($this->config->get('config_tax')) {
				$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
			} else {
				$tax = false;
			}	
			if ($this->config->get('config_review_status')) {
				$rating = (int)$result['rating'];
			} else {
				$rating = false;
			}
			$this->data['products'][] = array(
				'product_id'  => $result['product_id'],
				'thumb'       => $image,
				'thumbwidth'  => $imagewidth,
				'thumbheight' => $imageheight,
				'name'        => $result['name'],
				'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 300) . '..',
				'description_mini' => html_entity_decode ($result['description_mini']),
				'price'       => $price,
				'special'     => $special,
				'tax'         => $tax,
				'rating'      => $result['rating'],
				'reviews'     => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
				'href'        => $this->url->link('product/product',  'product_id=' . $result['product_id'] )
			);
		}
		$this->data['sort'] = $sort;
		$this->data['order'] = $order;
		$this->data['limit'] = $limit;
		$this->data['continue'] = $this->url->link('common/home');
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/coolcategory_products.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/product/coolcategory_products.tpl';
		} else {
			$this->template = 'default/template/product/coolcategory_products.tpl';
		}

		$this->response->setOutput($this->render());
	}
}

