<?php

class AdminController extends Controller  
{
	
	public function __construct($model, $nameController, $nameAction)
	{
		parent::__construct($model, $nameController, $nameAction);
		$this->_setModel($model);
	}

    public function home(){
        $listAxx = $this->secureAccess("admin/home");
        $this->_view->set('listAxx', $listAxx);

        include_once(HOME . DS . "includes" . DS . "common.nav.php");
        $this->_view->outPut();
    }

        public function inscription(){
            $listAxx = $this->secureAccess("admin/inscription");
            $this->_view->set('listAxx', $listAxx);
            if($_POST){
                $save = false;
                switch($_POST["option"]){
                    case("producteur"):
                        $save = $this->_model->addProducer($_POST);
                        $rank = "producer";
                        break;
                    case("client"):
                        $save = $this->_model->addCustomer($_POST);
                        $rank = "customer";              
                        break;
                }
                if($save){
                    $this->addUser($_POST["email"], $rank);
                    $save = $this->addLog(sha1($_POST["tempPassword"]));
                }
                
                if($save){
                    $stateMess = "Le nouvel utilisateur à bien été inscrit.";
                } else {
                    $stateMess = "Un problème est survenu lors de la sauvegarde!";
                }
                $this->_view->set('stateMess', $stateMess);
            }
            
            include_once(HOME . DS . "includes" . DS . "common.nav.php");
            $this->_view->outPut();
        }

        public function gestionUtilisateurs(){
            $listAxx = $this->secureAccess("admin/gestionUtilisateurs");
            $this->_view->set('listAxx', $listAxx);

            $producers = $this->_model->findAllProducers();
            $this->_view->set('producers', $users);
            $cutomers = $this->_model->findAllCutomers();
            $this->_view->set('customers', $customers);

            switch($action){

            }

            $this->_view->outPut();
        }

}