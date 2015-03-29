<?php
class ModelModuleDownloads extends Model {
/// !!!!	
	public function getDownloads($category_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_to_download pd LEFT JOIN " . DB_PREFIX . "download d ON(pd.download_id=d.download_id) LEFT JOIN " . DB_PREFIX . "download_description dd ON(pd.download_id=dd.download_id) WHERE category_id = '" . (int)$category_id . "' AND dd.language_id = '" . (int)$this->config->get('config_language_id')."'");
		return $query->rows;
	}
	
	public function getDownload($category_id, $download_id) {
	$download = "";
	if($download_id!=0) $download = " AND d.download_id=".(int)$download_id;
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_to_download pd LEFT JOIN " . DB_PREFIX . "download d ON(pd.download_id=d.download_id) LEFT JOIN " . DB_PREFIX . "download_description dd ON(pd.download_id=dd.download_id) WHERE category_id = '" . (int)$category_id . "' ".$download." AND dd.language_id = '" . (int)$this->config->get('config_language_id')."'");
		return $query->row;
	}
}

?>
