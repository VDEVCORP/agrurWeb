<?php

class ProducteurModel extends Model{

    public function __construct()
	{
		parent::__construct();
	}

	public function findProducer($id_user){
		$sql = "SELECT producteur.*, users.email
				FROM producteur
				JOIN users ON producteur.fk_id_user = users.id_user
				WHERE fk_id_user = ?";
		$this->_setSql($sql);
		
		return $this->getRow([$id_user]);
	}

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

	public function findAllVarietes(){
		$sql = "SELECT * FROM variete";
		$this->_setSql($sql);
		$results = $this->getAll();
		return $results;
	}

	public function findAllCommunes(){
		$sql = "SELECT * FROM commune";
		$this->_setSql($sql);
		$results = $this->getAll();
		return $results;
	}
	
	public function addVerger(array $data){
		$sql = "INSERT INTO verger(nomVerger, superficie, nbrArbreParHect, idProducteur, idVariete, idCommune)
				VALUES (:name, :superficie, :nbArbres, :idProducteur, :variete, :commune)";
		$this->_setSql($sql);

		$success = $this->execSql($data);
		return $success;
	}
}