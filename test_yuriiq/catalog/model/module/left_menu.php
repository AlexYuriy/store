<?php
##########################
#  catalog\model\module	 #
##########################
class ModelModuleLeftMenu extends Model {
	
	//Place any functions you like in here to access the DB and present data to the controller to display or otherwise
	//control the display of the view. Before writing your own functions here, check to see if you can use functions
	//in other model files, as you can just as easily pull through those models to use their functions.
	
	//Example function to get customer firstnames:
	function getCustomerFirstnames() {
		$query = "SELECT firstname FROM " . DB_PREFIX . "customer";
		$result = $this->db->query($query);
		return $result->rows;
	}
	
}

?>