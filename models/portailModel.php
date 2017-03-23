<?php

class PortailModel extends Model{
    
    public function __construct()
	{
		parent::__construct();
	}

	public function findUserlogin($email){
		$tabParam = array();
		$sql = "SELECT * 
				FROM users_login 
				WHERE fk_id_user = (
					SELECT DISTINCT id_user
					FROM users
					WHERE email = ?)";
		
		$tabParam[] = $email;
		$this->_setSql($sql);
		
		$requests = $this->getRow($tabParam);
		
		return $requests; 
	}
}