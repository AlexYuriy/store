<?php 
include '../../../system/engine/controller.php';
class ControllerModuleTempCart extends Controller {
	public function index() {
	    $this->language->load('module/cart');
	    echo 'aaa';	
    }
}
?>