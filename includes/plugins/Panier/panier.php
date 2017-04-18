<?php

class Panier {

    private $_DB;

    public function __construct($DB){
        if(!isset($_SESSION['panier'])){
            $_SESSION['panier'] = array();
        }
        $this->_DB = $DB;
    }

    private function exist($product_id){
        $this->_DB->_setSql('SELECT idConditionnement FROM conditionnement WHERE idConditionnement = ?');
        $product = $this->_DB->getRow([$product_id]);
        return $product ? true : false; 
    }

    public function recalculate(){
        foreach($_SESSION['panier'] as $product_id => $quantity){
            if(isset($_POST['panier']['quantity'][$product_id])){
                $_SESSION['panier'][$product_id] = $_POST['panier']['quantity'][$product_id];
            }
        }
    }

    public function addProduct($product_id){
        $json = ['error' => true];
        if($this->exist($product_id)){
            if(isset($_SESSION['panier'][$product_id])){
                $_SESSION['panier'][$product_id]++;
            } else {
                $_SESSION['panier'][$product_id] = 1;
            }
            $json['error'] = false;
            $json['message'] = "Produit ajouté !";
        } else {
            $json['message'] = "Ce produit n'existe pas.";
        }
        return json_encode($json);
    }

    public function delProduct($product_id){
        unset($_SESSION['panier'][$product_id]);
    }

    public function clearPanier(){
        $_SESSION['panier'] = [];
    }

    public function count(){
        return array_sum($_SESSION['panier']);
    }

    // Fonction de DEMO dans notre cas, les produits agrur n'ont pas de prix.
    public function total(){
        $total = 0;
        $ids = array_keys($_SESSION['product_id']);
        if(empty($ids)){
            $products = [];
        } else {
            $this->_DB->_setSql('SELECT id, price FROM detailcommande WHERE id IN ('. implode(',', $ids) .')');
            $products = $this->_DB->getAll();
        }
        foreach($products as $product){
            $total += $product->price * $_SESSION['panier'][$product->id];
        }
        return $total;
    }

}