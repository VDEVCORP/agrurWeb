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
}
