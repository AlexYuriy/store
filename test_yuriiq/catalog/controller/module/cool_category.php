
<?php

class ControllerModuleCoolCategory extends Controller {
	protected function index($setting) {
		//Load the language file for this module - catalog/language/module/cool_category.php
		$this->language->load('module/cool_category');

		//Get the title from the language file
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_reset_coolfilter'] = $this->language->get('text_reset_coolfilter');
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$this->load->model('module/cool_category');
		$this->data['categories'] = array();
		$this->data['text_apply'] = $this->language->get('text_apply');
		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/coolfilter.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/coolfilter.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/coolfilter.css');
		}
		$categories = $this->model_catalog_category->getCategories(0);
		// Menu
		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}
		if ($setting['template'] == 'links' ) 
		{
			foreach ($categories as $category) {
				if ($category['top']=='0') {			
					// Level 1
					$this->data['categories'][] = array(
						'name'     => $category['name'],
						'name2'    => $category['seo_h1'],
						'active'   => in_array($category['category_id'], $parts),
						'column'   => $category['column'] ? $category['column'] : 1,
						'href'     => $this->url->link('product/coolcategory', 'path=' . $category['category_id']),
					);
				}
			}
			$this->template =  $this->config->get('config_template') . '/template/module/cool_category_links.tpl';
			if (!file_exists(DIR_TEMPLATE . $this->template)) {
				$this->template = 'default/template/module/cool_category_links.tpl';
			}
		} else {
			foreach ($categories as $category) {
				if (($category['top']=='0')&&(in_array($category['category_id'], $parts))) {
					// Level 2
					$children_data = array();
					$children = $this->model_catalog_category->getCategories($category['category_id']);
					foreach ($children as $child) {
						$filtr_id = $this->model_module_cool_category->getCoolfilterGroupId($child['category_id']) ;
						if ($filtr_id) {
							if ($this->config->get('config_product_count')) {
								$data = array(
									'filter_category_id'  => $child['category_id'],
									'filter_sub_category' => true
								);
						
								$product_total = $this->model_catalog_product->getTotalProducts($data);
							}
							$this->data['categories'][] = array(
								'name'  	=> $child['name'] . ($this->config->get('config_product_count') ? ' (' . $product_total . ')' : ''),
								'name2' 	=> $child['seo_h1'], 
								'id'    	=> $child['category_id'],
								'filtr_id' 	=> $filtr_id,
								'href'  	=> $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']),					
								'href2'    	=> $this->url->link('product/coolcategory/getProduct', 'path=' . $child['category_id'])
							);
						}
					}				
				}
			}
			$this->template =  $this->config->get('config_template') . '/template/module/cool_category.tpl';
			if (!file_exists(DIR_TEMPLATE . $this->template)) {
				$this->template = 'default/template/module/cool_category.tpl';
			}
		}
		//Render the page with the chosen template
		$this->render();
	}
}
?>
