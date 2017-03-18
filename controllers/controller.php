<?php

class Controller
{
	protected $_model;
	protected $_controller;
	protected $_action;
	protected $_view;
	protected $_modelBaseName;
	
	public function __construct($model, $nameController, $nameAction)
	{
		$this->_controller = $nameController;
		$this->_action = $nameAction;
		$this->_modelBaseName = $model;
		
		$this->_view = new View(HOME . DS . 'views' . DS . $this->_controller . DS . $this->_action . '.tpl');
	}
	
	protected function _setModel($modelName)
	{
		$this->_model = new $modelName();
	}
	
	protected function _setView($viewName)
	{
		$this->_view = new View(HOME . DS . 'views' . DS . strtolower($this->_controller) . DS . $viewName . '.tpl');
	}

/* --------- Contrôle des permissions de consultation  ---------*/
//	Cette fonction est à appeller pour chaque page du site; elle verifie si
// l'utilisateur possède les droits d'accès à la page demandée et stock dans une
// list ces droits. Cette liste déterminera quels liens dans le menu seront
// affichés.

	public function secureAccess($page)
	{
		$rank =  $this->_model->getRankUser($_SESSION['user']['user_key']);
		$axx = $this->_model->getAccessUser($rank['name_rank'], $page);
		
		if (!$axx){
			header("Location: http://" . DOMAIN_NAME);
		} else {
			return $this->_model->getAllAccessUser($rank['name_rank']);
		}
	}
}
