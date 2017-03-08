<?php
date_default_timezone_set("Europe/Paris");
$nameController = ACTION;
$nameAction = METHOD;   
$listParameters = array();

$called = substr($_SERVER['REQUEST_URI'], 1);

if (isset($called) && !empty($called)){
	list($nameController, $nameAction) = explode("/", $called);
	$called = substr($_SERVER['REQUEST_URI'], (strlen($nameController . $nameAction) + 3));
	$listParameters[] = explode("/", $called);
}

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