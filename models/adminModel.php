<?php

class AdminModel extends Model{

    public function __construct()
	{
		parent::__construct();
	}

	public function addUser($userEmail, $rank){
		$tabParam = array($rank, $userEmail);
		$sql = "INSERT INTO users(rank, email, valid)
				VALUES (?, ?, true)";
		$this->_setSql($sql);

		$success = $this->execSql($tabParam, true);
		return $success;
	}
	/**
	* Ne supprime pas l'user de la bdd
	* Update du champ "valid" à 0.
	*/
	public function removeUser($id){
		$sql = "UPDATE users 
				SET valid = 0
				WHERE id_user = ?";
		$this->_setSql($sql);

		$success = $this->execSql([$id]);
		return $success;
	}

	public function addLog($userPassword, $userID){
		$tabParam = array($userID, $userPassword);
		
		$sql = "INSERT INTO users_login(fk_id_user, password_user)
				VALUES (?, ?)";
		$this->_setSql($sql);

		$success = $this->execSql($tabParam);
		return $success;
	}

// Table Producteur
	public function findAllProducers(){
		$sql = "SELECT * FROM producteur";
		$this->_setSql($sql);
		$results = $this->getAll();
		return $results;
	}

	public function addProducer(array $data){
		$sql = "INSERT INTO producteur(nomSociete, nomResponsable, prenomResponsable, telephone, adresse, ville, codePostal, adherent, fk_id_user) 
				VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		$this->_setSql($sql);

		$success = $this->execSql($data);
		return $success;
	}

// Table Client
	public function findAllCustomers(){
		$sql = "SELECT * FROM client";
		$this->_setSql($sql);
		$results = $this->getAll();
		return $results;
	}

	public function addCustomer(array $data){
		$sql = "INSERT INTO client(nomClient, nomRepresentant, prenomRepresentant, telephone, adresse, ville, codePostal, fk_id_user)
				VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		$this->_setSql($sql);

		$success = $this->execSql($data);
		return $success;
	}

// Table Variete
	public function findAllVarietes(){
		$sql = "SELECT * FROM variete";
		$this->_setSql($sql);
		$results = $this->getAll();
		return $results;
	}

	public function addVariete(array $data){
		$sql = "INSERT INTO variete(nomVariete, aoc)
				VALUES (:nom, :aoc)";
		$this->_setSql($sql);

		$success = $this->execSql($data);
		return $success;
	}

	public function deleteVariete($id){
		$sql = "DELETE FROM variete
				WHERE idVariete = ?";
		$this->_setSql($sql);

		$success = $this->execSql([$id]);
		return $success;
	}

	public function updateVariete($id, $data){
		$sql = "UPDATE variete
				SET nomVariete = :nom, aoc = :aoc";
		$this->_setSql($sql);

		$success = $this->execSql($data);
		return $success;		
	}

// Table Verger
	public function findAllVergers(){
		$sql = "SELECT * FROM verger";
		$this->_setSql($sql);
		$results = $this->getAll();
		return $results;
	}

	public function addVerger(array $data){
		$sql = "INSERT INTO verger(idProducteur, idVariete, idCommune, superficie, nbrArbreParHect)
				VALUES (?, ?, ?, ?, ?)";
		$this->_setSql($sql);

		$success = $this->execSql($data);
		return $success;
	}

// Table Commune
	public function findAllCommunes(){
		$sql = "SELECT * FROM commune";
		$this->_setSql($sql);
		$results = $this->getAll();
		return $results;
	}

	public function addCommune(array $data){
		
		$sql = "INSERT INTO commune(nomCommune, codePostal, aoc)
				VALUES (:nom, :codePostal, :aoc)";
		$this->_setSql($sql);

		$success = $this->execSql($data);
		return $success;
	}
}