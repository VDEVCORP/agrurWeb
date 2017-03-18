<?php
date_default_timezone_set("Europe/Paris");

$nameController = ACTION;
$nameAction = METHOD;
$listParameters = array(null, null);

$called = $_SERVER["REQUEST_URI"];

if (!empty($called) && $called != "/"){
	$called = substr($called, 1);
	$listParameters = explode("/", $called);
	$nameController = $listParameters[0];
	$nameAction = $listParameters[1];
}

if(!in_array($listParameters[1], LIST_EXCEPTION)){

	$nameModel = $nameController . 'Model';
	$controller = $nameController . 'Controller';
	session_start();

	if (file_exists(HOME . DS . 'views' . DS . strtolower($nameController) . DS . $nameAction . '.tpl')){
		$load = new $controller($nameModel, $nameController, $nameAction);
	} else {
		die("PROBLEM ON CLASSES LOAD");
		//header("Location: /error/404") ;
	}

	if (method_exists($load, $nameAction)) {
		call_user_func_array(array($load, $nameAction), $listParameters);
		unset($listParameters);
	} else {
		die("PROBLEM ON call_user_func_array");
		//header("Location: /error/404") ;
	}
}