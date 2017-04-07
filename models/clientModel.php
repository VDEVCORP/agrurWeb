<?php

class ClientModel extends Model{

    public function __construct()
	{
		parent::__construct();
	}

// Table Client / Utilisateur

	public function findCustomer($id_user){
		$sql = "SELECT client.*, users.email
				FROM client
				JOIN users ON client.fk_id_user = users.id_user
				WHERE fk_id_user = ?";
		$this->_setSql($sql);
		
		return $this->getRow([$id_user]);
	}

	public function updateCustomer(array $data){
		$sql = "UPDATE client 
				SET nomClient = :societe, nomRepresentant = :nom, prenomRepresentant = :prenom, telephone = :telephone, adresse = :adresse, ville = :ville, codePostal = :codePostal 
				WHERE idClient = :idClient";
		$this->_setSql($sql);

		$success = $this->execSql($data);
		return $success;
	}

	public function updateUserEmail(array $data){
		$sql = "UPDATE users 
				SET email = ?
				WHERE id_user = ?";
		$this->_setSql($sql);

		$success = $this->execSql($data);
		return $success;
	}

// Table Conditionnement
	public function findAllConditionnementExpo(){
		$sql = "SELECT 	
			#TODO : Déterminer les infos affichées
				FROM conditionnement
				INNER JOIN lot ON conditionnement.idLot = lot.idLot
				INNER JOIN livraison ON lot.idLivraison = livraison.idLivraison
				INNER JOIN verger ON livraison.idVerger = verger.idVerger
				INNER JOIN variete ON verger.idVariete = variete.idVariete
				INNER JOIN commune ON verger.idCommune = commune.idCommune";
		$this->_setSql($sql);
		$results = $this->getAll();
		return $results;
	}

	public function findAllConditionnementForm(){
		$sql = "SELECT
			#TODO : Déterminer les infos du comboBox
				FROM conditionnement
				INNER JOIN lot ON conditionnement.idLot = lot.idLot
				INNER JOIN livraison ON lot.idLivraison = livraison.idLivraison
				INNER JOIN verger ON livraison.idVerger = verger.idVerger
				INNER JOIN variete ON verger.idVariete = variete.idVariete
				INNER JOIN commune ON verger.idCommune = commune.idCommune";
		$this->_setSql($sql);
		$results = $this->getAll();
		return $results;
	}

	public function findConditionnementByID($id_conditionnement){
		$sql = "SELECT *, producteur.nomResponsable, producteur.prenomResponsable FROM conditionnement
				INNER JOIN lot ON conditionnement.idLot = lot.idLot
				INNER JOIN calibre ON lot.idCalibre = calibre.idCalibre
				INNER JOIN livraison ON lot.idLivraison = livraison.idLivraison
				INNER JOIN verger ON livraison.idVerger = verger.idVerger
				INNER JOIN typeproduit ON livraison.idTypeProduit = typeproduit.idTypeProduit
				INNER JOIN variete ON verger.idVariete = variete.idVariete
				INNER JOIN commune ON verger.idCommune = commune.idCommune
				INNER JOIN producteur ON verger.idProducteur = producteur. idProducteur
				WHERE idConditionnement = ?";
		$this->_setSql($sql);
		$results = $this->getRow([$id_conditionnement]);
		return $results;
	}

// Table Commande
	public function findCustomerCommandes($id_customer){
		$sql = "SELECT * FROM commande
				INNER JOIN status ON commande.idStatus = status.idStatus
				WHERE idClient = ?";
		$this->_setSql($sql);

		return $this->getAll([$id_customer]);
	}

	public function findCommandeByID($id_commande){
		$sql = "SELECT * FROM commande
				INNER JOIN status ON commande.idStatus = status.idStatus
				INNER JOIN client ON commande.idClient = client.idClient
				WHERE idCommande = ?";
		$this->_setSql($sql);

		return $this->getRow();
	}

	public function deleteCommande($id_commande){
		$sql = "DELETE FROM commande
				WHERE idCommande = ?";
		$this->_setSql($sql);

		return $this->execSql($id_commande);
	}

	public function addCommande(array $data){
		$sql = "INSERT INTO commande(refCommande, soumission, idStatus, nbrUniteCommandee, idClient)
				VALUES (:refCommande, :soumission, :idStatus, :nbrUnite, :idClient)";
		$this->_setSql($sql);

		return $this->execSql($data);
	}

// Table Detailcommande
	public function findCommandeDetails($id_commande){
		$sql = "SELECT quantiteCommande, conditionnement.*
				FROM detailcommande
				INNER JOIN conditionnement ON detailcommande.idConditionnement = conditionnement.idConditionnement
				WHERE idCommande = ?";
		$this->_setSql($sql);

		$results = $this->getAll([$id_commande]);
		return $results;
	}

	public function modifQuantiteCommandee(array $data){
		$sql = "UPDATE detailcommande
				SET quantiteCommandee = :nbrUnite
				WHERE idConditionnement = :conditionnement
				AND idCommande = :commande";
		$this->_setSql($sql);

		return $this->execSql($data);
	}

	public function addConditionnementCommande(array $data){
		$sql = "INSERT INTO detailcommande(quantiteCommandee, idCommande, idConditionnement)
				VALUES (:nbrUnite, :commande, :conditionnement)";
		$this->_setSql($sql);

		return $this->execSql($data);
	}

	public function deleteConditionnementCommande(array $data){
		$sql = "DELETE FROM detailcommande
				WHERE idConditionnement = :conditionnement
				AND idCommande = :commande";
		$this->_setSql($sql);

		return $this->execSql($data);
	}
}