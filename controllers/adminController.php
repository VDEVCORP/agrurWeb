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
                    $userID = $this->_model->addUser($_POST["mail"], 2);
                    break;
                case("client"):
                    $userID = $this->_model->addUser($_POST["mail"], 3);
                    break;
            }

            $save = $this->_model->addLog(sha1($_POST["tempPassword"]), $userID);

            switch($_POST["option"]){
                case("producteur"):
                    $data = array(
                        $_POST["societe"],
                        $_POST["nom"],
                        $_POST["prenom"],
                        $_POST["telephone"],
                        $_POST["adresse"],
                        $_POST["ville"],
                        $_POST["codePostal"],
                        $_POST["adherent"],
                        $userID
                    );
                    $save = $this->_model->addProducer($data);
                    break;
                case("client"):
                    $data = array(
                        $_POST["societe"],
                        $_POST["nom"],
                        $_POST["prenom"],
                        $_POST["telephone"],
                        $_POST["adresse"],
                        $_POST["ville"],
                        $_POST["codePostal"],
                        $userID
                    );
                    $save = $this->_model->addCustomer($data);
                    break;
            }
            
            if($save){
                $success = "Le nouvel utilisateur à bien été inscrit.";
                $this->_view->set('success', $success);
            } else {
                $error = "Un problème est survenu lors de la sauvegarde!";
                $this->_view->set('error', $error);
            }
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