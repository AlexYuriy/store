<?php
class ModelModuleDownloads extends Model {
	public function initDownload() {
		$query = $this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "category_to_download (category_id INT(11), download_id INT(11), PRIMARY KEY (category_id, download_id))");
	}	
}
?>
