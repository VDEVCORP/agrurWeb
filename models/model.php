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
}