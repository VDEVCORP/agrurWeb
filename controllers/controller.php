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

/* --------- Contrôle des permissions de consultation de page ---------*/
//	Cette fonction est à appeller pour chaque page du site; elle verifie si
// l'utilisateur possède les droits d'accès à la page demandée et stock dans une
// liste ces droits. Cette liste déterminera également quels liens dans le menu seront
// visibles pour l'utilisateur.

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

/* --------- Message en réponse à une action de l'utilisateur ---------*/
// Permet d'envoyer à la vue le messages de votre choix
// en fonction du drapeau "$status" reçu, témoins de l'echec
// ou du succès d'une opération.

	public function setViewResponse($status, $success, $error){
		if($status){
			if(!empty($success)){
				$this->_view->set('success', $success);
			}
		} else {
			$this->_view->set('error', $error);
		}
	}

/* --------- Formatage d'une action appellée en GET ---------*/
// Récupère l'action passé en troisième paramètre d'une url sous forme d'une
// chaîne type : [action]?[key1=value1]&[key2=value2] ....
// 
	/**
	* @param string
	*
	* @return array array(["path"] => string, ["query"] => array)
	*/
	public function formatAction($actionString){
		$action = parse_url($actionString);
		$action['query'] = explode("&", $action['query']);
		for($i = 0; $i < count($action['query']); $i++){
			$temp = explode("=", $action['query'][$i]);
			$action['query'][$temp[0]] = $temp[1];
			unset($action['query'][$i]);
		}
		return $action;
	}

}
