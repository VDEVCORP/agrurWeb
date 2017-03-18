<?php

class ProducteurModel extends Model{

    public function __construct()
	{
		parent::__construct();
	}

	public function findProducer($id_user){
		$tabParam = Array();
		$sql = "SELECT producteur.*, users.email
				FROM producteur
				JOIN users ON producteur.fk_id_user = users.id_user
				WHERE fk_id_user = ?";
				
		$tabParam[] =  $id_user;
		$this->_setSql($sql);
		
		return $this->getRow($tabParam);
	}
}