<?php
class ModelBlogReviewArticle extends Model {
	public function addreview_article($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "review_article SET author = '" . $this->db->escape($data['author']) . "', article_id = '" . $this->db->escape($data['article_id']) . "', text = '" . $this->db->escape(strip_tags($data['text'])) . "', text_answer = '" . $this->db->escape(strip_tags($data['text_answer'])) . "', rating = '" . (int)$data['rating'] . "', status = '" . (int)$data['status'] . "', date_added = NOW()");
		$this->cache->delete('article');
	}
	
	public function editreview_article($review_article_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "review_article SET author = '" . $this->db->escape($data['author']) . "', article_id = '" . $this->db->escape($data['article_id']) . "', text = '" . $this->db->escape(strip_tags($data['text'])) . "', text_answer = '" . $this->db->escape(strip_tags($data['text_answer'])) . "', rating = '" . (int)$data['rating'] . "', status = '" . (int)$data['status'] . "' WHERE review_article_id = '" . (int)$review_article_id . "'");
		$this->cache->delete('article');
	}
	
	public function deletereview_article($review_article_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "review_article WHERE review_article_id = '" . (int)$review_article_id . "'");
		$this->cache->delete('article');
	}
	
	public function getreview_article($review_article_id) {
		$query = $this->db->query("SELECT DISTINCT *, (SELECT pd.name FROM " . DB_PREFIX . "article_description pd WHERE pd.article_id = r.article_id AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "') AS article FROM " . DB_PREFIX . "review_article r WHERE r.review_article_id = '" . (int)$review_article_id . "'");
		return $query->row;
	}

	public function getreview_articles($data = array()) {
		$sql = "SELECT r.review_article_id, pd.name, r.author, r.text_answer, r.rating, r.status, r.date_added FROM " . DB_PREFIX . "review_article r LEFT JOIN " . DB_PREFIX . "article_description pd ON (r.article_id = pd.article_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";	
		$sort_data = array(
			'pd.name',
			'r.author',
			'r.rating',
			'r.text_answer',
			'r.status',
			'r.date_added'
		);	
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY r.date_added";	
		}
		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}
		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}			
			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}	
			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
		$query = $this->db->query($sql);	
		return $query->rows;	
	}
	
	public function getTotalreview_articles() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "review_article");
		return $query->row['total'];
	}
	
	public function getTotalreview_articlesAwaitingApproval() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "review_article WHERE status = '0'");
		return $query->row['total'];
	}	
}
?>