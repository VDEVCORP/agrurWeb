<?php

class View
{
	protected $_file;
	protected $_data = array();
	protected $_commons = array();
	
	public function __construct($file)
	{
		$this->_file = $file;
	}
    
	public function set($key, $value)
	{
		$this->_data[$key] = $value;
	}

	public function setCommons($key, $file){
		$this->_commons[$key] = $file;
	}
	
	public function get($key)
	{
   		return $this->_data[$key];
  	}
	
	public function output()
	{
		if (!file_exists($this->_file))
		{
			throw new Exception("View " . $this->_file . " doesn't exist.");
		}
		
		extract($this->_data);
		ob_start();
		isset($this->_commons["nav"]) ? include($this->_commons["nav"]) : false;
		include($this->_file);
		isset ($this->_commons["footer"]) ? include($this->_commons["footer"]) : false;
		$output = ob_get_contents();
		ob_end_clean();
		echo $output;
		/* MAGIE */
	}
}