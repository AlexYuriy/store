
<?php

class ControllerModuleCoolCategory extends Controller {
	protected function index($setting) {
		//Load the language file for this module - catalog/language/module/cool_category.php
		$this->language->load('module/cool_category');
		$this->language->load('module/coolfilter');
		$this->data['text_apply'] = $this->language->get('text_apply');
		$this->data['count_enabled'] = $this->config->get('count_enabled');
		$this->data['currency_symbol_left'] = $this->currency->getSymbolLeft($this->currency->getCode());
		$this->data['currency_symbol_right'] = $this->currency->getSymbolRight($this->currency->getCode());
		$this->data['count_symbols'] = $this->currency->getDecimalPlace($this->currency->getCode());
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
							$coolfilters = $this->getVal($filtr_id, $child['category_id']);
							$this->data['categories'][] = array(
								'name'  	=> $child['name'] . ($this->config->get('config_product_count') ? ' (' . $product_total . ')' : ''),
								'name2' 	=> $child['seo_h1'], 
								'id'    	=> $child['category_id'],
								'filtr_id' 	=> $filtr_id,
								'href'  	=> $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']),
								'href2'    	=> $this->url->link('product/coolcategory/getProduct', 'path=' . $child['category_id']),
								'filter_id'	=> $child['category_id'] . $filtr_id,
								'coolfilters'	=> $coolfilters
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
	private function getVal($coolfilter_group_id, $categorie_id) {
			$this->load->model('catalog/product');
			$this->load->model('catalog/category');
			$this->load->model('catalog/coolfilter');
			$this->load->model('module/cool_category');
			// Получить id категории
			$category = $this->model_catalog_category->getCategory($categorie_id)  ;
			if ($category) $data['heading_title'] = $category['name']  ; //$this->language->get('heading_title');
			else $data['heading_title'] = '';
			$data['filter_id'] = $categorie_id . $coolfilter_group_id;
			$data['price_id'] = 'price_' . $categorie_id . $coolfilter_group_id;
			$data['coolfilter_active'] = "coolfilter_active" . $coolfilter_group_id;
			$data['slider_range_id'] = 'slider_range_' . $categorie_id . $coolfilter_group_id;
			// Получить все фильтры данной группы для данной категории
			$coolfilter_group_options = $this->model_catalog_coolfilter->getOptionBycoolfilterGroupsId($coolfilter_group_id, $categorie_id);
			if (!empty($coolfilter_group_options)) {
				// Выбрать уникальные типы фильтров
				// Для уменьшения количества циклов, в цикл добвалена реструктуризация ключей массива фильтров по индекску
				$coolfilter_types = array();
				$coolfilter_group_options_by_index = array();
				foreach ($coolfilter_group_options as $coolfilter_group_option) {
					$coolfilter_types_parts = explode('_', $coolfilter_group_option['type_index']);
					$coolfilter_types[reset($coolfilter_types_parts)][$coolfilter_group_option['type_index']] = end($coolfilter_types_parts);
					// Реструктуризация
					$coolfilter_group_options_by_index[$coolfilter_group_option['type_index']] = $coolfilter_group_option;
				}
				$categories_id[] = $categorie_id; 
				$categories_id = array_merge_recursive($categories_id, $this->model_catalog_coolfilter->getChildrenCategorie($categorie_id));
				// Получить соотвествия для фильтров в данной категории	
				echo "G coolfilter_types=" .  serialize ( $coolfilter_types ) . "; categories_id =" . implode (":",$categories_id)  ;	
				$coolfilterItemNames = $this->model_module_cool_category->getcoolfilterItemNames($coolfilter_types, $categories_id);
				echo "G coolfilterItemNames=" .  serialize ( $coolfilterItemNames ) ;
				// Передача данных фильтра в представление
				$data['coolfilters'] = array_merge_recursive($coolfilter_group_options_by_index, $coolfilterItemNames);
				// Сортировка данных фильтра
				//uasort($this->data['coolfilters'], array('ControllerModulecoolfilter', 'sortcoolfilters'));

				return $data;
			}
//		echo 'data=' . 0 . PHP_EOL;		
//		$this->response->setOutput(json_encode($this->data['coolfilters']));
//		$this->response->setOutput($this->render());		
	}
}
?>
