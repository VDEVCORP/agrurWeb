<?php

if(isset($_COOKIE['lang']))
{
	$lang = $_COOKIE['lang'];
}
else 
{
      // si aucune langue n'est déclarée on tente de reconnaitre la langue par défaut du navigateur
    $lang = substr($_SERVER['HTTP_ACCEPT_LANGUAGE'],0,2); 
}
 	 
  	
if ($lang=='fr')
{           // si la langue est 'fr' (français) on inclut le fichier fr-lang.php
 include('fr-lang.php'); 
}
elseif ($lang=='nl')
{      // si la langue est 'nl' (Belge) on inclut le fichier en-lang.php
 include('nl-lang.php'); 
} 
 	 
 	 
 	 //définition de la durée du cookie (1 an)
$expire = 10; 
 	 
 	 //enregistrement du cookie au nom de lang
setcookie('lang', $lang, time() + $expire);
 	  
?>