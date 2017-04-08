<?php

class Panier {

    private $DB;

    public function __construct($DB){
        if(!isset($_SESSION['panier'])){
            $_SESSION['panier'] = array();
        }
        $this->DB = $DB;
    }

    public function addProduct($id_produit, $quantite){
        if(isset($_SESSION['panier'][$id_produit])){
            $_SESSION['panier'][$id_produit]++;
        } else {
            $_SESSION['panier'][$id_produit] = $quantite;
        }
    }

    public function delProduct($id_produit){
        unset($_SESSION['panier'][$id_produit]);
    }
}