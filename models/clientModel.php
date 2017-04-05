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
}