<?php

###############################
#  catalog\controller\module  #
###############################

class ControllerModuleLeftMenu extends Controller {
	protected function index() {
		//Load the language file for this module - catalog/language/module/left_menu.php
		$this->language->load('module/left_menu');

		//Get the title from the language file
      	$this->data['heading_title'] = $this->language->get('heading_title');

		//Load any required model files - catalog/product is a common one, or you can make your own DB access
		//methods in catalog/model/module/left_menu.php
		$this->load->model('module/left_menu');

		//Example functionality: pull through customer firstnames and make them available to the view.
		$this->data['customers'] = $this->model_module_left_menu->getCustomerFirstnames();

		//Choose which template to display this module with
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/left_menu.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/left_menu.tpl';
		} else {
			$this->template = 'default/template/module/left_menu.tpl';
		}

		//Render the page with the chosen template
		$this->render();
	}
}
?>