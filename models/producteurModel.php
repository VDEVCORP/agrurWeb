<?php

class ProducteurModel extends Model{

    public function __construct()
	{
		parent::__construct();
	}

// Table Producteur / Utilisateur 
	public function findProducer($id_user){
		$sql = "SELECT producteur.*, users.email
				FROM producteur
				JOIN users ON producteur.fk_id_user = users.id_user
				WHERE fk_id_user = ?";
		$this->_setSql($sql);
		
		return $this->getRow([$id_user]);
	}

	public function updateProducer(array $data){
		$sql = "UPDATE producteur 
				SET nomSociete = :societe, nomResponsable = :nom, prenomResponsable = :prenom, telephone = :telephone, adresse = :adresse, ville = :ville, codePostal = :codePostal 
				WHERE idProducteur = :idProducteur";
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

// Table verger

	public function findProducerVergers($id_user){
		$sql = "SELECT *
				FROM verger
				INNER JOIN producteur ON verger.idProducteur = producteur.idProducteur
				INNER JOIN variete ON verger.idVariete = variete.idVariete
				INNER JOIN commune ON verger.idCommune = commune.idCommune
				WHERE verger.idProducteur = ?";
		$this->_setSql($sql);

		return $this->getAll([$id_user]);
	}

	public function findVergerByID($id){
		$sql = "SELECT *
				FROM verger
				INNER JOIN producteur ON verger.idProducteur = producteur.idProducteur
				INNER JOIN variete ON verger.idVariete = variete.idVariete
				INNER JOIN commune ON verger.idCommune = commune.idCommune
				WHERE verger.idVerger = ?";
		$this->_setSql($sql);

		return $this->getRow([$id]);
	}
	
	public function addVerger(array $data){
		$sql = "INSERT INTO verger(nomVerger, superficie, nbrArbreParHect, idProducteur, idVariete, idCommune)
				VALUES (:name, :superficie, :nbArbres, :idProducteur, :variete, :commune)";
		$this->_setSql($sql);

		$success = $this->execSql($data);
		return $success;
	}

	public function updateVerger(array $data){
		$sql = "UPDATE verger
				SET nomVerger = :name, superficie = superficie, nbrArbreParHect = :nbArbres, idVariete = :variete, idCommune = :findAllCommunes
				WHERE idVerger = :idVerger";
		$this->_setSql($sql);

		$success = $this->execSql($data);
		return $success;
	}

	public function deleteVerger($id_verger){
		$sql = "DELETE FROM verger
				WHERE idVerger = ?";
		$this->_setSql($sql);

		$success = $this->execSql([$id_verger]);
		return $success;
	}

// Table Variete

	public function findAllVarietes(){
		$sql = "SELECT * FROM variete";
		$this->_setSql($sql);
		$results = $this->getAll();
		return $results;
	}

// Table Commune

	public function findAllCommunes(){
		$sql = "SELECT * FROM commune";
		$this->_setSql($sql);
		$results = $this->getAll();
		return $results;
	}

// Table Certification

	public function findCertifDelivrees($id_producer){
		$sql = "SELECT dateCertification, certification.*
				FROM certifdelivree
				INNER JOIN certification ON certifdelivree.idCertification = certification.idCertification
				WHERE idProducteur = ?";
		$this->_setSql($sql);
		$results = $this->getAll([$id_producer]);
		return $results;
	}

// Table Livraison

	public function findProducerLivraisons($id_producer){
		$sql = "SELECT *
				FROM livraison
				INNER JOIN verger ON livraison.idVerger = verger.idVerger
				INNER JOIN typeproduit ON livraison.idTypeProduit = typeproduit.idTypeProduit
				WHERE verger.idProducteur = ?";
		$this->_setSql($sql);
		$results = $this->getAll([$id_producer]);
		return $results;
	}
}