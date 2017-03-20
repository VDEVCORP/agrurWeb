<?php

class AdminModel extends Model{

    public function __construct()
	{
		parent::__construct();
	}

	public function addProducer(array $datas){
		$tabParam = array();

		$sql = "INSERT INTO producteur(idProducteur, nomSociete, nomResponsable, prenomResponsable, telephone, adresse, ville, codePostal, fk_id_user) 
				VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		$tabParam = $data;
		$this->setSql($sql);

		$success = $this->execSql($data);
		return $success;
	}

	public function addCustomer(array $data){
		$tabParam = array();

		$sql = "INSERT INTO client(idClient, nomClient, nomRepresentant, prenomRepresentant, telephone, adresse, ville, codePostal, fk_id_user) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		$tabParam = $data;
		$this->setSql($sql);

		$success = $this->execSql($tabParam);
		return $success;
	}

	public function addUser($userEmail, $rank){
		$tabParam = array();

		$sql = "INSERT INTO users(rank, email, valid) VALUES (?, ?, 1)";
		$tabParam = $rank;
		$tabParam = $userEmail;

		$success = $this->execSql($tabParam);
	}

	public function addLog($userPassword){
		$tabParam = array();

		$user = $this->_db->lastInsertId();
		$sql = "INSERT INTO users_login(fk_id_users, user_password) VALUES (?, ?)";
	}

	public function findAllProducers(){
		$sql = "SELECT * FROM producteur";
		$this->setSql($sql);
		$results = $this->getAll();
		return $results;
	}

	public function findAllCustomers(){
		$sql = "SELECT * FROM client";
		$this->setSql($sql);
		$results = $this->getAll();
		return $results;
	}
}