<?php

class ClientController extends Controller  
{
	
	public function __construct($model, $nameController, $nameAction)
	{
		parent::__construct($model, $nameController, $nameAction);
		$this->_setModel($model);
	}

    public function home(){
        $listAxx = $this->secureAccess("client/home");
        $this->_view->set('listAxx', $listAxx);

        include_once(HOME . DS . "includes" . DS . "common.nav.php");
        $this->_view->outPut();
    }

}