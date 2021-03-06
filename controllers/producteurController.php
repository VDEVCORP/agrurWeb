<?php

class ProducteurController extends Controller{

    private $producer;

    public function __construct($model, $nameController, $nameAction)
	{
		parent::__construct($model, $nameController, $nameAction);
        $this->_setModel($model);
   
        $this->producer = $this->_model->findProducer($_SESSION['user']['user_key']);

        $this->_view->setCommons("nav", HOME . DS . 'includes' . DS . 'common.nav.php');
		$this->_view->setCommons("footer", HOME . DS . 'includes' . DS . 'common.footer.php');
	}

    public function home(){
        $listAxx = $this->secureAccess("producteur/home");
        $this->_view->set('listAxx', $listAxx);

        $vergers = $this->_model->findProducerVergers($this->producer['idProducteur']);
        for($i = 0; $i < count($vergers); $i++){
            $date = new Datetime($vergers[$i]['verger_last_edit']);
            $vergers[$i]['verger_last_edit'] = $date->format('Y-m-d');
        }
        $vergers = $this->determineVergerAOC($vergers);
        $this->_view->set('vergers', $vergers);
        $livraisons = $this->_model->findProducerLivraisons($this->producer['idProducteur']);
        $this->_view->set('livraisons', $livraisons);

        $this->_view->outPut();
    }

    public function profil(){
        $listAxx = $this->secureAccess("producteur/profil");
        $this->_view->set('listAxx', $listAxx);

        if($_POST){
            $save = false;
            $changeForMail = array($_POST['email'], $this->producer['fk_id_user']);
            unset($_POST['email']);
            $_POST["idProducteur"] = $this->producer['idProducteur'];
            $save = $this->_model->updateProducer($_POST);
            if($save){
                $this->producer = $this->_model->findProducer($_SESSION['user']['user_key']);
                $save = $this->_model->updateUserEmail($changeForMail);
            }
            $this->setViewResponse($save, "Vos infomations ont bien été mises à jour", "Un problème est survenu lors de la sauvegarde!");
        }

        $this->_view->set('producer', $this->producer);

        $certifDelivrees = $this->_model->findCertifDelivrees($this->producer['idProducteur']);
        $this->_view->set('certifDelivrees', $certifDelivrees);
        
        $this->_view->outPut();
    }

    public function vergers($action = false){
        $listAxx = $this->secureAccess("producteur/vergers");
        $this->_view->set('listAxx', $listAxx);

        if($_POST){
            switch($_POST['action']){
                case('add') :
                    unset($_POST['action']);
                    $save = false;
                    $_POST["idProducteur"] = $this->producer['idProducteur'];
                    $save = $this->_model->addVerger($_POST);
                    $this->setViewResponse($save, "Le nouveau verger a bien été ajouté.", "Un problème est survenu lors de la sauvegarde!");
                break;
                case('update') :
                    unset($_POST['action']);
                    $save = false;
                    $save = $this->_model->updateVerger($_POST);
                    $this->setViewResponse($save, "Le verger à bien été modifié.", "Un problème est survenu lors de l'opération!");
                break;
            }
        }

        if($action && !$_POST){
            $action = $this->formatAction($action);
            switch($action['path']){
                case('edit') :
                    $askVerger = $this->_model->findVergerByID($action['query']['id']);
                    $this->_view->set('askVerger', $askVerger);
                break;
                case('delete') :
                    $this->_model->deleteVerger($action['query']['id']);
                break;
            }
        }

        $vergers = $this->_model->findProducerVergers($this->producer['idProducteur']);
        $vergers = $this->determineVergerAOC($vergers);
        $this->_view->set('vergers', $vergers);

        $varietes = $this->_model->findAllVarietes();
        $this->_view->set('varietes', $varietes);
        $communes = $this->_model->findAllCommunes();
        $this->_view->set('communes', $communes);

        $this->_view->outPut();
    }

    private function determineVergerAOC(array $vergers){
        for($i = 0; $i < count($vergers); $i++){
            if($vergers[$i]['aocCommune'] || $vergers[$i]['aocVariete']){
                $vergers[$i]['aoc'] = 1;
            } else {
                $vergers[$i]['aoc'] = 0;
            }
        }
        return $vergers;
    }

}