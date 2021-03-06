<?php  
class ControllerModuleCategory extends Controller {
	protected function index($setting) {
		$this->language->load('module/category');

		$this->data['heading_title'] = $this->language->get('heading_title');

		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}

		if (isset($parts[0])) {
			$this->data['category_id'] = $parts[0];
		} else {
			$this->data['category_id'] = 0;
		}

		if (isset($parts[1])) {
			$this->data['child_id'] = $parts[1];
		} else {
			$this->data['child_id'] = 0;
		}

		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		$this->data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			$total = $this->model_catalog_product->getTotalProducts(array('filter_category_id' => $category['category_id']));

			$children_data = array();

			$children = $this->model_catalog_category->getCategories($category['category_id']);

			foreach ($children as $child) {
				$data = array(
					'filter_category_id'  => $child['category_id'],
					'filter_sub_category' => true
				);
				$product_total = $this->model_catalog_product->getTotalProducts($data);
				$total += $product_total;
				if (($child['image']) && ($child['image']!= 'no_image.jpg')) {	
					$child_image = $this->model_tool_image->resize( $child['image'], 
								$this->config->get('config_image_menu_category_width'), 
								$this->config->get('config_image_menu_category_height'));
				} else {
					$child_image = '';
				}
				$children_data[] = array(
					'category_id' => $child['category_id'],
					'name'        => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $product_total . ')' : ''),
					'image'		  => $child_image,
					'href'        => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])	
				);		
			}
			if (($category['image']) && ($category['image']!= 'no_image.jpg') ) {
				$image = $this->model_tool_image->resize($category['image'], 
								$this->config->get('config_image_menu_category_width'), 
								$this->config->get('config_image_menu_category_height'));
			} else {
				$image = '';
			}
			$this->data['categories'][] = array(
				'category_id' => $category['category_id'],
				'top'		  => $category['top'],
				'name'        => $category['name'] . ($this->config->get('config_product_count') ? ' (' . $total . ')' : ''),
				'children'    => $children_data,
				'image'  => $image,
				'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
			);	
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/category.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/category.tpl';
		} else {
			$this->template = 'default/template/module/category.tpl';
		}

		$this->render();
	}
}
?>