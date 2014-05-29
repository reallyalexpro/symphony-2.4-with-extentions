<?php

	Class extension_code_editor extends Extension{

		private $_page_type = NULL;

		public function getSubscribedDelegates(){
			return array(
				array(
					'page' => '/backend/',
					'delegate' => 'AdminPagePostCallback',
					'callback' => 'postCallback'
				),
				array(
					'page' => '/backend/',
					'delegate' => 'InitaliseAdminPageHead',
					'callback' => 'addFilesToHead'
				)
			);
		}

		public function postCallback(&$context){
			$page = $context['page'];
			if(strpos($page, 'blueprints/pages/template') or preg_match('/blueprints\/utilities\/(new|edit)/', $page)){
				$this->_page_type = 'xslt';
			}
			elseif($context['parts'][0] == 'editor'){
				$this->_page_type = 'editor';
			}
		}

		public function addFilesToHead(){
			$page_type = $this->_page_type;
			if(!$page_type) return;
			Administration::instance()->Page->addStylesheetToHead(URL . '/extensions/code_editor/assets/code-editor.css', 'screen');
			Administration::instance()->Page->addScriptToHead(URL . '/extensions/code_editor/assets/code-editor.js');
			if($page_type == 'xslt'){
				Administration::instance()->Page->addStylesheetToHead(URL . '/extensions/code_editor/assets/highlighters/highlight-xsl.css', 'screen');
				Administration::instance()->Page->addScriptToHead(URL . '/extensions/code_editor/assets/highlighters/highlight-xsl.js');
			}
			else {
				$filepath = EXTENSIONS . '/code_editor/assets/highlighters/';
				$entries = scandir($filepath);
				foreach($entries as $entry){
					if(is_file($filepath . $entry)){
						$info = pathinfo($filepath . $entry);
						if($info['extension'] == 'css' and $info['filename'] != ''){
							Administration::instance()->Page->addStylesheetToHead(URL . '/extensions/code_editor/assets/highlighters/' . $info['basename'], 'screen');
						}
						elseif($info['extension'] == 'js' and $info['filename'] != ''){
							Administration::instance()->Page->addScriptToHead(URL .  '/extensions/code_editor/assets/highlighters/' . $info['basename']);
						}
					}		
				}
			}
		}
	}
?>