<?php
date_default_timezone_set("Europe/Paris");

$nameController = ACTION;
$nameAction = METHOD;
$listParameters = array(null, null);
$arg = array();
$forbidden = false;

$called = $_SERVER["REQUEST_URI"];

if (!empty($called) && $called != "/"){
	$called = substr($called, 1);
	$listParameters = explode("/", $called);
	$nameController = $listParameters[0];
	$nameAction = $listParameters[1];

	if(isset($listParameters[2])){
		$arg[] = $listParameters[2];
	}
}

foreach($listParameters as $parameter){
	$forbidden = in_array($parameter, LIST_EXCEPTION) ? true : false;
}

if(!$forbidden){

	$nameModel = $nameController . 'Model';
	$controller = $nameController . 'Controller';
	unset($listParameters);

	if(!isset($_SESSION)){
		session_start();           
	}

	if (file_exists(HOME . DS . 'views' . DS . strtolower($nameController) . DS . $nameAction . '.tpl')){
		$load = new $controller($nameModel, $nameController, $nameAction);
	} else {
		die("PROBLEM ON CLASSES LOAD");
		//header("Location: /error/404") ;
	}

	if (method_exists($load, $nameAction)) {
		call_user_func_array(array($load, $nameAction), $arg);
		unset($arg);
	} else {
		die("PROBLEM ON call_user_func_array");
		//header("Location: /error/404") ;
	}
}