<?php

class AdminController extends Controller  
{
	
	public function __construct($model, $nameController, $nameAction)
	{
		parent::__construct($model, $nameController, $nameAction);
		$this->_setModel($model);

        $this->_view->setCommons("nav", HOME . DS . 'includes' . DS . 'common.nav.php');
		$this->_view->setCommons("footer", HOME . DS . 'includes' . DS . 'common.footer.php');
	}

    public function home(){
        $listAxx = $this->secureAccess("admin/home");
        $this->_view->set('listAxx', $listAxx);

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
            $this->setViewResponse($save, "La nouvel utilisateur à bien été enregistré.", "Un problème est survenu lors de la sauvegarde!");
        }

        $this->_view->outPut();
    }

    public function utilisateurs(){
        $listAxx = $this->secureAccess("admin/utilisateurs");
        $this->_view->set('listAxx', $listAxx);

        switch($action){

        }

        $producers = $this->_model->findAllProducers();
        $this->_view->set('producers', $users);
        $cutomers = $this->_model->findAllCutomers();
        $this->_view->set('customers', $customers);


        $this->_view->outPut();
    }

    public function varietes(){
        $listAxx = $this->secureAccess("admin/varietes");
        $this->_view->set('listAxx', $listAxx);

        if($_POST){
            $save = false;
            isset($_POST["aoc"]) ? $_POST["aoc"] = 1 : $_POST["aoc"] = 0;
            $save = $this->_model->addVariete($_POST);
            $this->setViewResponse($save, "La nouvelle variété a bien été ajoutée.", "Un problème est survenu lors de la sauvegarde!");  
        }

        $varietes = $this->_model->findAllVarietes();
        $this->_view->set('varietes', $varietes);
        

        $this->_view->outPut();
    }

    public function communes(){
        $listAxx = $this->secureAccess("admin/communes");
        $this->_view->set('listAxx', $listAxx);

        if($_POST){        
            $save = false;
            isset($_POST["aoc"]) ? $_POST["aoc"] = 1 : $_POST["aoc"] = 0;
            $save = $this->_model->addCommune($_POST);
            $this->setViewResponse($save, "La nouvelle commune a bien été ajoutée.", "Un problème est survenu lors de la sauvegarde!");   
        }

        $communes = $this->_model->findAllCommunes();
        $this->_view->set('communes', $communes);

        $this->_view->outPut();
    }

    public function vergers(){
        $listAxx = $this->secureAccess("admin/vergers");
        $this->_view->set('listAxx', $listAxx);

        if($_POST){
            $save = false;
            $save = $this->_model->addVerger($_POST);
            $this->setViewResponse($save, "Le nouveau verger a bien été ajouté.", "Un problème est survenu lors de la sauvegarde!");
        }

        $vergers = $this->_model->findAllVergers();
        $this->_view->set('vergers', $vergers);

        $varietes = $this->_model->findAllVarietes();
        $this->_view->set('varietes', $varietes);
        $communes = $this->_model->findAllCommunes();
        $this->_view->set('communes', $communes);
        $producteurs = $this->_model->findAllProducers();
        $this->_view->set('producteurs', $producteurs);


        $this->_view->outPut();
    }

}