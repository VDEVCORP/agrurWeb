<?php

class AdminController extends Controller  
{
	
	public function __construct($model, $nameController, $nameAction) {
		parent::__construct($model, $nameController, $nameAction);
		$this->_setModel($model);

        $this->_view->setCommons("nav", HOME . DS . 'includes' . DS . 'common.nav.php');
		$this->_view->setCommons("footer", HOME . DS . 'includes' . DS . 'common.footer.php');
	}

    public function home(){
        $listAxx = $this->secureAccess("admin/home");
        $this->_view->set('listAxx', $listAxx);

        $lastCommandes = $this->_model->find10LastCommandes();
        $lastCommandes = $this->shortDateTime($lastCommandes, 'soumission');
        $this->_view->set('lastCommandes', $lastCommandes);
        $lastLivraisons = $this->_model->find10LastLivraisons();
        $this->_view->set('lastLivraisons', $lastLivraisons);
        $lastVergers = $this->_model->find10LastVergers();
        $lastVergers = $this->shortDateTime($lastVergers, 'verger_last_edit');
        $this->_view->set('lastVergers', $lastVergers);
        $lastProducers = $this->_model->find5LastProducers();
        $lastProducers = $this->shortDateTime($lastProducers, 'last_edit');
        $this->_view->set('lastProducers', $lastProducers);
        $lastCustomers = $this->_model->find5LastCustomers();
        $lastCustomers = $this->shortDateTime($lastCustomers, 'last_edit');
        $this->_view->set('lastCustomers', $lastCustomers);

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

    public function utilisateurs($action = false){
        $listAxx = $this->secureAccess("admin/utilisateurs");
        $this->_view->set('listAxx', $listAxx);

        if($_POST){
            $save = $this->_model->AddCertifDelivree($_POST);
            $this->setViewResponse($save, "", "Un problème est lors de l'attribution!");
        }

        if($action){
            $action = $this->formatAction($action);
            switch($action['path']){

                case('details') :
                    if($action['query']['role'] == 'prod'){
                        $askProducer = $this->_model->findProducerByID($action['query']['id']);
                        $this->_view->set('askProducer', $askProducer);
                        $certifications = $this->_model->findAllCertifications();
                        $this->_view->set('certifications', $certifications);
                        $certifDelivrees = $this->_model->findCertifDelivrees($action['query']['id']);
                        $this->_view->set('certifDelivrees', $certifDelivrees);
                        $vergers = $this->_model->findProducerVergers($action['query']['id']);
                        $this->_view->set('vergers', $vergers);
                    } elseif($action['query']['role'] == 'cli'){
                        $askCustomer = $this->_model->findCustomerByID($action['query']['id']);
                        $this->_view->set('askCustomer', $askCustomer);
                        $commandes = $this->_model->findCustomer5LastCommandes($action['query']['id']);
                        $commandes = $this->shortDateTime($commandes, 'soumission');
                            /*  Si shortDate reçois un tableau contenant une unique commande, il renverra cet unique
                        commande et non une liste de commandes. L'algo si dessous, si la commande est unique,
                        l'insert dans une nouvelle liste pour ne pas provoquer d'erreurs dans le "foreach" de 
                        la vue. */
                        !empty($commandes) && !in_array('0', array_keys($commandes)) ?  $commandes = array($commandes) : false;
                        $this->_view->set('commandes', $commandes);
                    }
                break;

                case('remove') :
                    $save = $this->_model->removeUser($action['query']['id']);
                break;
                case('activate') :
                    $save = $this->_model->activateUser($action['query']['id']);
                break;

            }
        }

        #TODO : Prévoir un tri par ordre alphabetique
        $producers = $this->_model->findAllProducers();
        $this->_view->set('producers', $producers);
        $customers = $this->_model->findAllCustomers();
        $this->_view->set('customers', $customers);

        $this->_view->outPut();
    }

    public function varietes($action = false){
        $listAxx = $this->secureAccess("admin/varietes");
        $this->_view->set('listAxx', $listAxx);

        if($_POST){
            switch($_POST['action']){
                case('add') :
                    unset($_POST['action']);
                    $save = false;
                    isset($_POST["aocVariete"]) ? $_POST["aocVariete"] = 1 : $_POST["aocVariete"] = 0;
                    $save = $this->_model->addVariete($_POST);
                    $this->setViewResponse($save, "La nouvelle variété a bien été ajoutée.", "Un problème est survenu lors de la sauvegarde!");
                break;
                case('update') :
                    unset($_POST['action']);
                    $save = false;
                    isset($_POST["aocVariete"]) ? $_POST["aocVariete"] = 1 : $_POST["aocVariete"] = 0;
                    $save = $this->_model->updateVariete($_POST);
                    $this->setViewResponse($save, "La variété à bien été modifiée.", "Un problème est survenu lors de l'opération!");
                break;
            }
        }

        if($action && !$_POST){
            $action = $this->formatAction($action);
            switch($action['path']){
                case('edit') :
                    $askVariete = $this->_model->findVarieteByID($action['query']['id']);
                    $this->_view->set('askVariete', $askVariete);
                break;
                case('delete') :
                    $this->_model->deleteVariete($action['query']['id']);
                break;
            }
        }

        $varietes = $this->_model->findAllVarietes();
        $this->_view->set('varietes', $varietes);

        $this->_view->outPut();
    }

    public function communes($action = false){
        $listAxx = $this->secureAccess("admin/communes");
        $this->_view->set('listAxx', $listAxx);

        if($_POST){
            switch($_POST['action']){
                case('add') :
                    unset($_POST['action']);
                    $save = false;
                    isset($_POST["aocCommune"]) ? $_POST["aocCommune"] = 1 : $_POST["aocCommune"] = 0;
                    $save = $this->_model->addCommune($_POST);
                    $this->setViewResponse($save, "La nouvelle commune a bien été ajoutée.", "Un problème est survenu lors de la sauvegarde!");
                break;
                case('update'):
                    unset($_POST['action']);
                    $save = false;
                    isset($_POST["aocCommune"]) ? $_POST["aocCommune"] = 1 : $_POST["aocCommune"] = 0;
                    $save = $this->_model->updateCommune($_POST);
                    $this->setViewResponse($save, "La commune à bien été modifiée.", "Un problème est survenu lors de l'opération!");
                break;
            }           
        }

        if($action && !$_POST){
            $action = $this->formatAction($action);
            switch($action['path']){

                case('edit') :
                    $askCommune = $this->_model->findCommuneByID($action['query']['id']);
                    $this->_view->set('askCommune', $askCommune);
                break;

                case('delete') :
                    $this->_model->deleteCommune($action['query']['id']);
                break;
            }
        }

        $communes = $this->_model->findAllCommunes();
        $this->_view->set('communes', $communes);

        $this->_view->outPut();
    }

    public function certifications($action = false){
        $listAxx = $this->secureAccess("admin/certifications");
        $this->_view->set('listAxx', $listAxx);

        if($_POST){
            switch($_POST['action']){
                case('add') :
                    unset($_POST['action']);        
                    $save = false;
                    $save = $this->_model->addCertification($_POST['libelle']);
                    $this->setViewResponse($save, "La nouvelle certification a bien été ajoutée.", "Un problème est survenu lors de la sauvegarde!");
                break;
                case('update') :
                    unset($_POST['action']);
                    $save = false;
                    $save = $this->_model->updateCertification($_POST);
                    $this->setViewResponse($save, "La certification à bien été modifiée.", "Un problème est survenu lors de l'opération!");
                break;
            }
        }

        if($action && !$_POST){
            $action = $this->formatAction($action);
            switch($action['path']){
                case('edit') :
                    $askCertification = $this->_model->findCertificationByID($action['query']['id']);
                    $this->_view->set('askCertification', $askCertification);
                break;
                case('delete') :
                    $this->_model->deleteCertification($action['query']['id']);
                break;
            }
        }

        $certifications = $this->_model->findAllCertifications();
        $this->_view->set('certifications', $certifications);

        $this->_view->outPut();
    }

    public function livraisons($action = false){
        $listAxx = $this->secureAccess("admin/livraisons");
        $this->_view->set('listAxx', $listAxx);

        if($_POST){
            switch($_POST['action']){
                case('add') :
                    unset($_POST['action']);
                    $save = false;
                    $save = $this->_model->addLivraison($_POST);
                    $this->setViewResponse($save, "La livraison à bien été enregistrée.", "Un problème est survenu lors de la sauvegarde!");
                break;
                case('update') :
                    unset($_POST['action']);
                    $save = false;
                    $save = $this->_model->updateLivraison($_POST);
                    $this->setViewResponse($save, "La livraison à bien été modifiée.", "Un problème est survenu lors de l'opération!");
                break;
            }
        }

        if($action && !$_POST){
            $action = $this->formatAction($action);
            switch($action['path']){
                case('edit') :
                    $askLivraison = $this->_model->findLivraisonByID($action['query']['id']);
                    $this->_view->set('askLivraison', $askLivraison);
                break;
                case('delete') :
                    $this->_model->deleteLivraison($action['query']['id']);
                break;
            }
        }

        $vergers = $this->_model->findAllVergers();
        $this->_view->set('vergers', $vergers);
        $typesProduits = $this->_model->findAllTypesProduits();
        $this->_view->set('typesProduits', $typesProduits);


        $livraisons = $this->_model->findAllLivraisons();
        $this->_view->set('livraisons', $livraisons);

        $this->_view->outPut();
    }

    public function lots($action = false){
        $listAxx = $this->secureAccess("admin/lots");
        $this->_view->set('listAxx', $listAxx);

        if($_POST){
            switch($_POST['action']){
                case('add') :
                    unset($_POST['action']);
                    $save = false;
                    $save = $this->_model->addLot($_POST);
                    $this->setViewResponse($save, "Le lot à bien été enregistré.", "Un problème est survenu lors de la sauvegarde!");
                break;
                case('update') :
                    unset($_POST['action']);
                    $save = false;
                    $save = $this->_model->updateLot($_POST);
                    $this->setViewResponse($save, "Le lot à bien été modifié.", "Un problème est survenu lors de l'opération!");
                break;
            }
        }

        if($action && !$_POST){
            $action = $this->formatAction($action);
            switch($action['path']){
                case('edit') :
                    $askLot = $this->_model->findLotByID($action['query']['id']);
                    $this->_view->set('askLot', $askLot);
                break;
                case('delete') :
                    $this->_model->deleteLot($action['query']['id']);
                break;
            }
        }

        $lots = $this->_model->findAllLots();
        $this->_view->set('lots', $lots);
        $livraisons = $this->_model->findAllLivraisons();
        $this->_view->set('livraisons', $livraisons);
        $calibres = $this->_model->findAllCalibres();
        $this->_view->set('calibres', $calibres);

        $this->_view->outPut();
    }

    public function conditionnement($action = false){
        $listAxx = $this->secureAccess("admin/conditionnement");
        $this->_view->set('listAxx', $listAxx);

        if($_POST){
            switch($_POST['action']){
                case('add') :
                    unset($_POST['action']);
                    $save = false;
                    $save = $this->_model->addConditionnement($_POST);
                    $this->setViewResponse($save, "Le conditionnement à bien été enregistré.", "Un problème est survenu lors de la sauvegarde!");
                break;
                case('update') :
                    unset($_POST['action']);
                    $save = false;
                    $save = $this->_model->updateConditionnement($_POST);
                    $this->setViewResponse($save, "Le conditionnement à bien été modifié.", "Un problème est survenu lors de l'opération!");
                break;
            }
        }

        if($action && !$_POST){
            $action = $this->formatAction($action);
            switch($action['path']){
                case('details') :
                    $askConditionnement = $this->_model->findConditionnementByID($action['query']['id']);
                    $this->_view->set('askConditionnement', $askConditionnement);
                break;
                case('delete') :
                    $this->_model->deleteConditionnement($action['query']['id']);
                break;
            }
        }

        $lots = $this->_model->findAllLots();
        $this->_view->set('lots', $lots);
        $conditionnements = $this->_model->findAllConditionnement();
        $this->_view->set('conditionnements', $conditionnements);

        $this->_view->outPut();
    }

    public function commandes($action = false){
        $listAxx = $this->secureAccess("admin/commandes");
        $this->_view->set('listAxx', $listAxx);

        if($action){
            $action = $this->formatAction($action);
            $currentDateTime = new DateTime(null, new DateTimezone('Europe/Paris'));
            $data = array(  'dateTime' => $currentDateTime->format('Y-m-d H:i:s'),
                            'commande' => $action['query']['id']);
            switch($action['path']){
                case('attente') :
                    $this->_model->updateCommandeStatus($data, 1);
                    break;
                case('encours') :
                    $this->_model->updateCommandeStatus($data, 2);
                    break;
                case('expedie') :
                    $this->_model->updateCommandeStatus($data, 3);
                    break;
            }
        }

        $commandes = $this->_model->findAllCommandes();
        for($i = 0; $i < count($commandes); $i++){
            $detailCommande = $this->_model->findCommandeDetails($commandes[$i]['idCommande']);
            $commandes[$i]['nbrItem'] = 0;
            for($j = 0; $j < count($detailCommande); $j++){
                $commandes[$i]['nbrItem'] += $detailCommande[$j]['quantiteCommandee'];
            }
        }
        $commandes = $this->shortDateTime($commandes, 'soumission');
        $commandes = $this->shortDateTime($commandes, 'preparation');
        $commandes = $this->shortDateTime($commandes, 'expedition');
            /*  Si shortDate reçois un tableau contenant une unique commande, il renverra cet unique
        commande et non une liste de commandes. L'algo si dessous, si la commande est unique,
        l'insert dans une nouvelle liste pour ne pas provoquer d'erreurs dans le "foreach" de 
        la vue. */
        !empty($commandes) && !in_array('0', array_keys($commandes)) ?  $commandes = array($commandes) : false;

        $this->_view->set('commandes', $commandes);

        $this->_view->outPut();
    }

    private function shortDateTime($requestResult = null, $field){
        if(!empty($requestResult)){
            if(count($requestResult) > 1){
                for($i = 0; $i < count($requestResult); $i++){
                    if(!empty($requestResult[$i][$field])){
                        $date = new DateTime($requestResult[$i][$field]);
                        $requestResult[$i][$field] = $date->format('Y-m-d H:i');
                    }
                }
            } else {
                $date = new DateTime($requestResult[0][$field]);
                $requestResult[0][$field] = $date->format('Y-m-d H:i');
                $requestResult = array_shift($requestResult);
            }
        }
        return $requestResult;
    }
}