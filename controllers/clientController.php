<?php

class ClientController extends Controller  
{

    private $customer;
	
	public function __construct($model, $nameController, $nameAction)
	{
		parent::__construct($model, $nameController, $nameAction);
		$this->_setModel($model);
   
        $this->customer = $this->_model->findCustomer($_SESSION['user']['user_key']);

        $this->_view->setCommons("nav", HOME . DS . 'includes' . DS . 'common.nav.php');
		$this->_view->setCommons("footer", HOME . DS . 'includes' . DS . 'common.footer.php');
	}

    public function home(){
        $listAxx = $this->secureAccess("client/home");
        $this->_view->set('listAxx', $listAxx);

        $this->_view->outPut();
    }

    public function profil(){
        $listAxx = $this->secureAccess("client/profil");
        $this->_view->set('listAxx', $listAxx);
        
        if($_POST){
            $save = false;
            $changeForMail = array($_POST['email'], $this->customer['fk_id_user']);
            unset($_POST['email']);

            $_POST["idCustomer"] = $this->customer['idCustomer'];
            $save = $this->_model->updateCustomer($_POST);
            if($save){
                $this->customer = $this->_model->findCustomer($_SESSION['user']['user_key']);
                $save = $this->_model->updateUserEmail($changeForMail);
            }
            $this->setViewResponse($save, "Vos infomations ont bien été mises à jour", "Un problème est survenu lors de la sauvegarde!");
        }

        $this->_view->set('customer', $this->customer);
        $this->_view->outPut();
    }

    public function commandes($action = false){
        $listAxx = $this->secureAccess("client/commandes");
        $this->_view->set('listAxx', $listAxx);

        $this->_view->outPut();

    }

}