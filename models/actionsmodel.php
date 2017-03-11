<?php

class ActionsModel extends Model{

	/* --------------------------------- Début Requêtes création projet/tâche -------------------------------------------------- */

	public function findUserlogin($email){
		$tabParam = array();
		$sql = "SELECT * 
				FROM users_login 
				WHERE fk_id_user = (
					SELECT id_user
					FROM users
					WHERE email = ?)";
		
		$tabParam[] = $email;
		$this->_setSql($sql);
		
		$requests = $this->getRow($tabParam);
		
		return $requests; 
	}
	
	public function getRankUser($id_user)
	{
		$tabParam = Array();
		$sql = "SELECT name_rank 
				FROM users u
				INNER JOIN users_rank ur ON ur.id_rank = u.rank
				WHERE id_user = ?
				AND valid = 1";
		
		$tabParam[] =  $id_user;
		
		$this->_setSql($sql);
		
		return $this->getRow($tabParam);
	}
	
	public function getAccessUser($rank,$page)
	{
		$tabParam = Array();
		$sql = "SELECT url_page    
				FROM users_access ua, page p
				WHERE ua.fk_id_rank = (	SELECT id_rank
										FROM users_rank
										WHERE name_rank = ?)
				AND p.url_page = ?
				AND p.id_page = ua.fk_id_page";
				
		$tabParam[] =  $rank;
		$tabParam[] =  $page;
		
		$this->_setSql($sql);
		
		return $this->getRow($tabParam);
		
	}
	
	public function getAllAccessUser($rank)
	{
		$tabParam = Array();
		$sql = "SELECT url_page    
				FROM users_access ua, page p
				WHERE ua.fk_id_rank = (	SELECT id_rank
										FROM users_rank
										WHERE name_rank = ?) 
				AND p.id_page = ua.fk_id_page";
		
		$tabParam[] =  $rank;
		$this->_setSql($sql);
		$list = $this->getAll($tabParam);
		
		return $list;
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