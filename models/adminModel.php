<?php

class AdminModel extends Model{

    public function __construct()
	{
		parent::__construct();
	}

	public function addProducer(array $data){
		$sql = "INSERT INTO producteur(nomSociete, nomResponsable, prenomResponsable, telephone, adresse, ville, codePostal, adherent, fk_id_user) 
				VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		$this->_setSql($sql);

		$success = $this->execSql($data);
		return $success;
	}

	public function addCustomer(array $data){
		$sql = "INSERT INTO client(nomClient, nomRepresentant, prenomRepresentant, telephone, adresse, ville, codePostal, fk_id_user)
				VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		$this->_setSql($sql);

		$success = $this->execSql($data);
		return $success;
	}

	public function addUser($userEmail, $rank){
		$tabParam = array($userEmail, $rank);
		$sql = "INSERT INTO users(rank, email, valid)
				VALUES (?, ?, 1)";

		$success = $this->execSql($tabParam, true);
		return $success;
	}

	public function addLog($userPassword, $userID){
		$tabParam = array($userPassword, $userID);
		
		$sql = "INSERT INTO users_login(fk_id_users, user_password)
				VALUES (?, ?)";

		$success = $this->execSql($tabParam);
		return $success;
	}

	public function findAllProducers(){
		$sql = "SELECT * FROM producteur";
		$this->_setSql($sql);
		$results = $this->getAll();
		return $results;
	}

	public function findAllCustomers(){
		$sql = "SELECT * FROM client";
		$this->_setSql($sql);
		$results = $this->getAll();
		return $results;
	}
}