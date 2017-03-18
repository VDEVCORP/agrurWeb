<?php

class ProducteurController extends Controller{

    public function __construct($model, $nameController, $nameAction)
	{
		parent::__construct($model, $nameController, $nameAction);
        $this->_setModel($model);
	}

    public function home(){
        $listAxx = $this->secureAccess("producteur/home");
        $this->_view->set('listAxx', $listAxx);
        
        $user = $this->_model->findProducer($_SESSION['user']['user_key']);
		$this->_view->set('user', $user);

        include_once(HOME . DS . "includes" . DS . "common.nav.php");
        $this->_view->outPut();
    }
}