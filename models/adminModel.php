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
		$sql = "INSERT INTO variete(nomVariete, AOC)
				VALUES (?, ?)";
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
		
		$sql = "INSERT INTO commune(nomCommune, codePostal, AOC)
				VALUES (?, ?, ?)";
		$this->_setSql($sql);

		$success = $this->execSql($data);
		return $success;
	}


}