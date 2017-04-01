<?php

class ProducteurController extends Controller{

    private $producer;

    public function __construct($model, $nameController, $nameAction)
	{
		parent::__construct($model, $nameController, $nameAction);
        $this->_setModel($model);

        $this->_view->setCommons("nav", HOME . DS . 'includes' . DS . 'common.nav.php');
		$this->_view->setCommons("footer", HOME . DS . 'includes' . DS . 'common.footer.php');
	}

    /*  Pour ne pas avoir à retrouver le producteur
        lié à l'id utilisateur à dans chaques pages 
        on enregistre l'utilisateur courant dans
        notre classe */
    public function setSpaceUser($user){
        $this->producer = $user;
    }

    public function home(){
        $listAxx = $this->secureAccess("producteur/home");
        $this->_view->set('listAxx', $listAxx);
        
        $user = $this->_model->findProducer($_SESSION['user']['user_key']);
        $this->setSpaceUser($user);
		$this->_view->set('user', $user);

        $vergers = $this->_model->findProducerVergers($this->producer['idProducteur']);
        $this->_view->set('vergers', $vergers);

        $this->_view->outPut();
    }

    public function vergers(){
        $listAxx = $this->secureAccess("producteur/vergers");
        $this->_view->set('listAxx', $listAxx);

        if($_POST){
            $save = false;
            $save = $this->_model->addVerger($_POST);
            $this->setViewResponse($save, "Le nouveau verger a bien été ajouté.", "Un problème est survenu lors de la sauvegarde!");
        }

        $vergers = $this->_model->findProducerVergers($this->producer['idProducteur']);
        foreach($vergers as $verger){
            if($verger["aoc"]);
        }
        $this->_view->set('vergers', $vergers);

        $varietes = $this->_model->findAllVarietes();
        $this->_view->set('varietes', $varietes);
        $communes = $this->_model->findAllCommunes();
        $this->_view->set('communes', $communes);

        $this->_view->outPut();
    }
}