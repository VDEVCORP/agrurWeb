<?php

class Db
{
	private static $db;
	public static function init()
	{
		if (!self::$db)
		{
			try {
				$dsn = 'mysql:host='.DB_HOST.';dbname='.DB_NAME.';charset=utf8;';
				self::$db = new PDO($dsn, DB_USER, DB_PASS);
				self::$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
				//self::$db->setAttribute(1002, "SET NAMES utf8");
				//self::$db->setAttribute(PDO::MYSQL_ATTR_INIT_COMMAND, "SET NAMES utf8"); 
				//self::$db->setAttribute(PDO::MYSQL_ATTR_USE_BUFFERED_QUERY, true);
				self::$db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
				//self::$db->setAttribute(PDO::ATTR_TIMEOUT,90);
				self::$db->exec('SET NAMES utf8');
			} catch (PDOException $e) {
				die('Connection error: ' . $e->getMessage());
			}
		}
		return self::$db;
	}
	

}
