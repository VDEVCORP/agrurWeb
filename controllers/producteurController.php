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

		$this->_view->set('producer', $this->producer);

        $vergers = $this->_model->findProducerVergers($this->producer['idProducteur']);
        $this->_view->set('vergers', $vergers);

        $this->_view->outPut();
    }

    public function vergers(){
        $listAxx = $this->secureAccess("producteur/vergers");
        $this->_view->set('listAxx', $listAxx);

        if($_POST){
            $save = false;
            $_POST["idProducteur"] = $this->producer['idProducteur'];
            $save = $this->_model->addVerger($_POST);
            $this->setViewResponse($save, "Le nouveau verger a bien été ajouté.", "Un problème est survenu lors de la sauvegarde!");
        }

        $vergers = $this->_model->findProducerVergers($this->producer['idProducteur']);
        for($i = 0; $i < count($vergers); $i++){
            if($vergers[$i]['aocCommune'] || $vergers[$i]['aocVariete']){
                $vergers[$i]['aoc'] = 1;
            } else {
                $vergers[$i]['aoc'] = 0;
            }
        }
        $this->_view->set('vergers', $vergers);

        $varietes = $this->_model->findAllVarietes();
        $this->_view->set('varietes', $varietes);
        $communes = $this->_model->findAllCommunes();
        $this->_view->set('communes', $communes);

        $this->_view->outPut();
    }

}