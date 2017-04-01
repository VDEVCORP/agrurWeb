<?php

class AdminModel extends Model{

    public function __construct()
	{
		parent::__construct();
	}

// Tables relatives à l'utilisateur
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

	public function activateUser($id){
		$sql = "UPDATE users 
				SET valid = 1
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
	public function findProducerByID($id){
		$sql = "SELECT *, users.email, users.valid
				FROM producteur
				INNER JOIN users ON producteur.fk_id_user = users.id_user
				WHERE idProducteur = ?";
		$this->_setSql($sql);

		$producer = $this->getRow([$id]);
		return $producer;
	}

	public function findAllProducers(){
		$sql = "SELECT *, users.email, users.valid
				FROM producteur
				INNER JOIN users ON producteur.fk_id_user = users.id_user";
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
	public function findCustomerByID($id){
		$sql = "SELECT *, users.email, users.valid 
				FROM client
				INNER JOIN users ON client.fk_id_user = users.id_user
				WHERE idClient = ?";
		$this->_setSql($sql);

		$producer = $this->getRow([$id]);
		return $producer;
	}

	public function findAllCustomers(){
		$sql = "SELECT *, users.email, users.valid
				FROM client
				INNER JOIN users ON client.fk_id_user = users.id_user";
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
		$sql = "INSERT INTO variete(nomVariete, aocVariete)
				VALUES (:nom, :aocVariete)";
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
				SET nomVariete = :nom, aocVariete = :aocVariete";
		$this->_setSql($sql);

		$success = $this->execSql($data);
		return $success;		
	}

// Table Verger
	public function findAllVergers(){
		$sql = "SELECT * FROM verger
				INNER JOIN producteur ON verger.idProducteur = producteur.idProducteur
				INNER JOIN variete ON verger.idVariete = variete.idVariete
				INNER JOIN commune ON verger.idCommune = commune.idCommune";
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

	public function addCommune(array $data){
		
		$sql = "INSERT INTO commune(nomCommune, codePostal, aocCommune)
				VALUES (:nom, :codePostal, :aocCommune)";
		$this->_setSql($sql);

		$success = $this->execSql($data);
		return $success;
	}

// Table Certification
	public function findAllCertifications(){
		$sql = "SELECT * FROM certification";
		$this->_setSql($sql);
		$results = $this->getAll();
		return $results;
	}

	public function addCertification(array $data){
		
		$sql = "INSERT INTO certification(libelleCertification)
				VALUES (?)";
		$this->_setSql($sql);

		$success = $this->execSql([$data]);
		return $success;
	}

// Table Livraison
	public function findAllLivraisons(){
		$sql = "SELECT *, verger.nomVerger 
				FROM livraison
				INNER JOIN verger ON livraison.idVerger = verger.idVerger";
		$this->_setSql($sql);
		$results = $this->getAll();
		return $results;
	}

	public function findLivraisonByID($id){
		$sql = "SELECT *, verger.nomVerger 
				FROM livraison
				INNER JOIN verger ON livraison.idVerger = verger.idVerger
				INNER JOIN typeproduit ON livraison.idTypeProduit = verger.idTypeProduit
				WHERE idLivraison = ?";
		$this->_setSql($sql);

		$livraison = $this->getRow([$id]);
		return $livraison;
	}

	public function addLivraison(array $data){
		$sql = "INSERT INTO livraison(dateLivraison, quantite, idVerger, idTypeProduit)
				VALUES (:dateLivraison, :quantite, :verger, :typeProduit)";
		$this->_setSql($sql);

		$success = $this->execSql($data);
		return $success;
	}

// Table Typeproduit
	public function findAllTypesProduits(){
		$sql = "SELECT * FROM typeproduit";
		$this->_setSql($sql);
		$results = $this->getAll();
		return $results;
	}
}