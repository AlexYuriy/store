<?php
################################################################################################
#  DIY Module Builder for Opencart 1.5.1.x From HostJars http://opencart.hostjars.com 		   #
################################################################################################
class ModelModuleCoolCategory extends Model {
	
	//Place any functions you like in here to access the DB and present data to the controller to display or otherwise
	//control the display of the view. Before writing your own functions here, check to see if you can use functions
	//in other model files, as you can just as easily pull through those models to use their functions.
	
	//Example function to get customer firstnames:
	function getCoolfilterGroupId($category_id) {
		$query = $this->db->query("SELECT coolfilter_group_id FROM `" . DB_PREFIX . "coolfilter_group_to_category` WHERE category_id = '" . (int)$category_id . "'");
		return (int)$query->row['coolfilter_group_id'] ;//
	}
	
}

?>
