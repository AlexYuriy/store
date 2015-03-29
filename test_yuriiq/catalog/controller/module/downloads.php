<?php

class ControllerModuleDownloads extends Controller {
	protected function index() {
		$this->language->load('module/downloads');

		//Get the title from the language file
		$this->data['heading_title'] = $this->language->get('heading_title');
		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}
		if (isset($parts[0])) {
			$category_id = $parts[0];
		} else {
			$category_id = 0;
		}
		// get downloads /
		$this->data['downloads'] = array();
		$this->load->model('module/downloads');
		$results = $this->model_module_downloads->getDownloads($category_id); 
		foreach ($results as $result) {
			if (file_exists(DIR_DOWNLOAD . $result['filename'])) {
				$size = filesize(DIR_DOWNLOAD . $result['filename']);
				$i = 0;
				$suffix = array(
					'B',
					'KB',
					'MB',
					'GB',
					'TB',
					'PB',
					'EB',
					'ZB',
					'YB'
				);

				while (($size / 1024) > 1) {
					$size = $size / 1024;
					$i++;
				}

				$this->data['downloads'][] = array(
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'name'       => $result['name'],
				'size'       => round(substr($size, 0, strpos($size, '.') + 4), 2) . $suffix[$i],
				'href'       => $this->url->link('module/downloads/download', 'category_id='. $category_id . '&download_id=' . $result['download_id'])
				);
			}
		}
		// get downloads /
		//Choose which template to display this module with
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/downloads.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/downloads.tpl';
		} else {
			$this->template = 'default/template/module/downloads.tpl';
		}
		//Render the page with the chosen template
		$this->render();
	}
	
	public function download() {
		if (isset($this->request->get['download_id'])) {
			$download_id = $this->request->get['download_id'];
		} else {
			$download_id = 0;
		}

		if (isset($this->request->get['category_id'])) {
			$category_id = $this->request->get['category_id'];
		} else {
			$category_id = 0;
		}
		$this->load->model('module/downloads');
		$download_info = $this->model_module_downloads->getDownload($category_id, $download_id); 
		if ($download_info) {
			$file = DIR_DOWNLOAD . $download_info['filename'];
			$mask = basename($download_info['mask']);

			if (!headers_sent()) {
				if (file_exists($file)) {
					header('Content-Description: File Transfer');
					header('Content-Type: application/octet-stream');
					header('Content-Disposition: attachment; filename="' . ($mask ? $mask : basename($file)) . '"');
					header('Content-Transfer-Encoding: binary');
					header('Expires: 0');
					header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
					header('Pragma: public');
					header('Content-Length: ' . filesize($file));

					readfile($file, 'rb');

					//$this->model_account_download->updateRemaining($this->request->get['download_id']);

					exit;
				} else {
					exit('Error: Could not find file ' . $file . '!');
				}
			} else {
				exit('Error: Headers already sent out!');
			}
		} else {
			$this->redirect(HTTP_SERVER . 'index.php?route=account/download');
		}
	}
}
?>
