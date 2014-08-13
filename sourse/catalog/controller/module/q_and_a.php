<?php
class ControllerModuleMyModul extends Controller {
	protected function index() {

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/test.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/myModul.tpl';
		} else {
			$this->template = 'default/template/module/myModul.tpl';
		}		
		$this->render();
	}
}
?>