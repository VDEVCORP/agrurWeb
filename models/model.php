<?php

class Model 
{
	protected $_db;
	protected $_sql;
	
	public function __construct()
	{
		$this->_db = Db::init();
	}
	
	protected function _setSql($sql)
	{
		$this->_sql = $sql;
	}
	
	public function getAll($data = null)
	{
		if (!$this->_sql)
		{
			throw new Exception("No SQL query!");
		}
		
		$sth = $this->_db->prepare($this->_sql);
		try {
			$sth->execute($data);
		}
		catch (PDOException $e) {
		
			if (isset($_SESSION["userOxy"]["identifier"]))
			{
				//if ($_SESSION["userOxy"]["identifier"] == "Z27JDELV" || $_SESSION["userOxy"]["identifier"] == "CED2015" )
					die('Connection error SQL : ' . $e->getMessage());
				//else
				//	die("An error has been detected on application.");
			}
			else
				die("An error has been detected on application.");
		}
		return $sth->fetchAll();
	}
	
	
	public function getRow($data = null)
	{
		if (!$this->_sql)
		{
			throw new Exception("No SQL query!");
		}
		
		$sth = $this->_db->prepare($this->_sql);
		try {
			$sth->execute($data);
		}
		catch (PDOException $e) {
		
		}
		return $sth->fetch();
	}
	
	public function execSql($data = null, $getLastID = false)
	{
		if (!$this->_sql)
		{
			throw new Exception("No SQL query!");
		}
		
		$sth = $this->_db->prepare($this->_sql);
		try {
			$sth->execute($data);
			if($getLastID)
				return $this->_db->lastInsertId();
		}
		catch (PDOException $e) {
		
			if (isset($_SESSION["userOxy"]["identifier"]))
			{
				//if ($_SESSION["userOxy"]["identifier"] == "Z27JDELV" || $_SESSION["userOxy"]["identifier"] == "CED2015" )
					die('Connection error SQL : ' . $e->getMessage());
				//else
					//die("An error has been detected on application.");
			}
			else
				die("An error has been detected on application.");
		}
	}
	
	protected function printSql()
	{
		echo $this->_sql;
	}

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
		$sql = "SELECT url_page, name_page    
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
}