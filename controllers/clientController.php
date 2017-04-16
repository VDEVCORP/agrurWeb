<?php

class ClientController extends Controller {
    private $customer;
    private $panier;
	
	public function __construct($model, $nameController, $nameAction){
		parent::__construct($model, $nameController, $nameAction);
		$this->_setModel($model);
        $this->customer = $this->_model->findCustomer($_SESSION['user']['user_key']);

        include(HOME . DS . 'includes' . DS . 'plugins' . DS . 'Panier' . DS . 'panier.php');
        $this->panier = new Panier($this->_model);

        $this->_view->setCommons("nav", HOME . DS . 'includes' . DS . 'common.nav.php');
		$this->_view->setCommons("footer", HOME . DS . 'includes' . DS . 'common.footer.php');
	}

    // fonction chargée de recevoir des requêtes AJAX relatives au Panier 
    public function interactPanier($action = false){
        if($action) {
            $action = $this->formatAction($action);

            switch($action['path']) {
                case('add'):
                    echo $this->panier->addProduct($action['query']['id']);
                break;
                case('remove') :
                    $this->panier->delProduct($action['query']['id']);
                break;
                case('clear') :
                    $this->panier->clearPanier();
                break;
            }
        }
    }

    public function home($action = false){
        $listAxx = $this->secureAccess("client/home");
        $this->_view->set('listAxx', $listAxx);

        $produits = $this->_model->findAllConditionnementExpo();
        $this->_view->set('produits', $produits);

        $this->_view->outPut();
    }

    public function profil($action = false){
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

        if($action){
            $action = $this->formatAction($action);
            switch($action['path']){
                case('delete') :
                    $this->_model->deleteCommande($action['query']['id']);
                break;
            }
        }

        $commandes = $this->_model->findCustomerCommandes($this->customer['idClient']);
        for($i = 0; $i < count($commandes); $i++){
            $detailCommande = $this->_model->findCommandeDetails($commandes[$i]['idCommande']);
            $commandes[$i]['nbrItem'] = 0;
            for($j = 0; $j < count($detailCommande); $j++){
                $commandes[$i]['nbrItem'] += $detailCommande[$j]['quantiteCommandee'];
            }
        }
        $commandes = $this->shortDate($commandes, 'soumission');

        $this->_view->set('commandes', $commandes);
        $this->_view->set('customer', $this->customer);
        $this->_view->outPut();
    }

    public function commandes(){
        $listAxx = $this->secureAccess("client/commandes");
        $this->_view->set('listAxx', $listAxx);

        if($_POST){
            $this->panier->recalculate();
        }

        $items = array();
        if(!empty($_SESSION['panier'])){
            $items = $this->_model->findConditionnementInIDs(array_keys($_SESSION['panier']));
        }
        $this->_view->set('items', $items);
        $this->_view->set('nbrItems', $this->panier->count());

        $this->_view->set('panier', $this->panier);
        $this->_view->outPut();
    }

    public function bonCommande($action = false){
        $listAxx = $this->secureAccess("client/bonCommande");
        $this->_view->set('listAxx', $listAxx);

        if($_POST){
            $reference = substr(md5($this->customer['nomClient'] . date_default_timezone_set("Europe/Paris") . rand(1, 9)), 0, 10);
            $data = array('refCommande' => $reference, 'idClient' => $this->customer['idClient']);
            
            $commande = $this->_model->addCommande($data);
            
            $commande != false ? $save = true : $save = false;
            foreach($_SESSION['panier'] as $idConditionnement => $quantite){
                $detail = array('conditionnement' => $idConditionnement,
                                'commande' => $commande,
                                'nbrUnite' => $quantite);
                $this->_model->addDetailCommande($detail);
            }
            if($save){
                $this->panier->clearPanier();
            }
            $this->setViewResponse($save, "La commande à bien été soumise.", "Un problème est survenu lors de l'envoi'!");
        }

        if($action){
            $action = $this->formatAction($action);
            if($this->_model->issetCommande($action['query']['id'])){
                $commande = $this->_model->findCommandeByID($action['query']['id']); 
                $commande = $this->shortDate(array($commande), 'soumission');
                $this->_view->set('commande', $commande);
            } else {
                $this->setViewResponse("Affichage impossible, cette commande est inexistante.");
            }

        } else {
            $commande = $this->_model->findCommandeByID($commande);    
            $commande = $this->shortDate(array($commande), 'soumission');
            $this->_view->set('commande', $commande);
        }

        $commandeDetails = $this->_model->findCommandeDetails($commande['idCommande']);
        $this->_view->set('commandeDetails', $commandeDetails);

        $this->_view->outPut();
    }

    private function shortDate(array $requestResult, $field){
        if(count($requestResult) > 1){
            for($i = 0; $i < count($requestResult); $i++){
                $date = new DateTime($requestResult[$i][$field]);
                $requestResult[$i][$field] = $date->format('Y-m-d');
            }
        } else {
            $date = new DateTime($requestResult[0][$field]);
            $requestResult[0][$field] = $date->format('Y-m-d');
            $requestResult = array_shift($requestResult);
        }
        return $requestResult;
    }

}