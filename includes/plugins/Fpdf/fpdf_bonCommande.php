<?php
require('fpdf.php');

class fpdf_bonCommande extends FPDF {

        public function __construct($commande, $commandeDetails){  
            define('EURO', utf8_encode(chr(128)));
            parent::__construct('P', 'mm', [210, 297]);
            self::AddPage();
            self::infosClient($commande);
            self::titre($commande);
            self::tableEntete();
            self::tableContenu($commandeDetails);
            self::tablePrix();
        }

        // Surcharge de la fonction parente "Cell" pour passer l'encodage de police d'UTF8 à ISO-8859-1
        function Cell($w, $h = 0, $txt = '', $border = 0, $ln = 0, $align = '', $fill = 0, $link = '') {
            parent::Cell($w, $h, utf8_decode($txt), $border, $ln, $align, $fill, $link);
        }

        public function Header(){
            $this->SetMargins(10,10,10);
            
            $this->Image(HOME . DS . 'includes' . DS . 'images' . DS . 'Agrur_logo.png', 5, 5, 40);

            $this->SetFont('Arial','', 10);
            $this->SetX(45);
            $this->Cell(100, 5, 'De :', 0, 2);
            $this->SetFont('Arial','B', 10);
            $this->Cell(100, 5, 'AGRUR Coopérative', 0, 2);
            $this->SetFont('Arial','', 10);
            $this->Cell(100, 5, '36 quai Bolivar, 47400', 0, 2);
            $this->Cell(100, 5, 'Tonneins, CEDEX', 0, 2);
            $this->Cell(100, 5, 'Tel: +33 951 02 94 77', 0, 2);

            $this->setXY(140, 10);
            $this->Cell(70, 5, 'A :', 0, 2);
        }

        public function infosClient($commande){
            $this->SetFont('Arial','B', 10);
            $this->Cell(70, 5, $commande['nomClient'], 0, 2);
            $this->SetFont('Arial','', 10);
            $this->Cell(70, 5, $commande['adresse'], 0, 2);
            $this->Cell(70, 5, $commande['ville'] . ', ' . $commande['codePostal'], 0, 2);
            $this->Cell(70, 5, 'Tel: ' . $commande['telephone'], 0, 2);

            $this->Ln();
            $this->SetX(140);
            $this->SetFont('Arial','B', 10);
            $this->Cell(70, 5, 'Représentant : ', 0, 2);
            $this->SetFont('Arial','', 10);
            $this->Cell(70, 5, $commande['prenomRepresentant'] . ' ' . $commande['nomRepresentant'], 0, 0);
        }

        public function titre($commande){
            $this->Ln(15);
            $this->SetX(20);
            $this->SetFont('Arial','', 20);
            $this->Cell(71, 10, 'Bon de Commande N° ', 0, 0);
            $this->SetTextColor(26, 179, 148);
            $this->Cell(90, 10, $commande['refCommande'], 0, 1);
            $this->SetX(25);
            $this->SetTextColor(0);
            $this->SetFont('Arial','I', 10);
            $this->Cell(70, 5, 'Emis le ' . $commande['soumission'], 0, 0);
            $this->Line(20, 75, 190, 75);
        }

        public function tableEntete(){
            $this->Ln(20);
            $this->SetFont('Arial','B', 10);
            $this->Cell(95, 5, 'Articles', 0, 0);
            $this->Cell(23.75, 5, 'Qté', 0, 0, 'C');
            $this->Cell(23.75, 5, 'Prix/u', 0, 0, 'C');
            $this->Cell(23.75, 5, 'TVA/u (7%)', 0, 0, 'C');  
            $this->Cell(23.75, 5, 'Total HT', 0, 0, 'C');
            $this->SetLineWidth(0.5);
            $this->Line(10, 95, 200, 95);
            $this->Ln();
        }

        public function tableContenu($commandeDetails){
            $this->SetLineWidth(0.2);
            foreach($commandeDetails as $commandeDetail){
                $this->Ln();
                $this->SetFont('Arial','B', 10);
                $this->Cell(95, 5, $commandeDetail['libelleConditionnement'], 'R', 0);
                $this->SetFont('Arial','', 10);
                $this->Cell(23.75, 5, $commandeDetail['quantiteCommandee'], 'R', 0, 'C');
                $this->Cell(23.75, 5, EURO . 'Prix', 'R', 0, 'C');
                $this->Cell(23.75, 5, EURO . 'Tva', 'R', 0, 'C');
                $this->SetFont('Arial','B', 10);
                $this->Cell(23.75, 5, EURO . 'PRIX', 0, 1, 'C');
                $this->SetFont('Arial','', 10);
                $this->Cell(19, 5, 'Poids (kg) :', 0, 0);
                $this->Cell(10, 5, $commandeDetail['poidsConditionnee'], 0, 0);
                $this->Cell(18, 5, '||  Calibre :', 0, 0);
                $this->Cell(48, 5, $commandeDetail['intervalle'], 'R', 0);
                $this->Cell(23.75, 5, '', 'R', 0);
                $this->Cell(23.75, 5, '', 'R', 0);
                $this->Cell(23.75, 5, '', 'R', 0);
                $this->Cell(23.75, 5, '', 0, 1);
                $this->Cell(95, 3, '', 'RB', 0);
                $this->Cell(23.75, 3, '', 'RB', 0);
                $this->Cell(23.75, 3, '', 'RB', 0);
                $this->Cell(23.75, 3, '', 'RB', 0);
                $this->Cell(23.75, 3, '', 'BB', 1);
            }
        }

        public function tablePrix(){
            $this->Ln(10);
            $this->SetX(130);
            $this->SetFont('Arial','B', 13);
            $this->Cell(35, 9, 'TOTAL HT', 'B', 0);
            $this->SetFont('Arial','', 12);
            $this->Cell(35, 9, EURO . 'Prix HT', 'B', 2);
            $this->setX($this->getX() - 35);
            $this->SetFont('Arial','B', 13);
            $this->Cell(35, 9, 'TOTAL TVA', 'B', 0);
            $this->SetFont('Arial','', 12);
            $this->Cell(35, 9, EURO . 'Montant TVA', 'B', 2);
            $this->setX($this->getX() - 35);
            $this->SetFont('Arial','B', 13);
            $this->Cell(35, 9, 'TOTAL TTC', 'B', 0);
            $this->SetFont('Arial','', 12);
            $this->Cell(35, 9, EURO . 'Prix TTC', 'B', 0);
        }

        public function Footer(){
            $this->SetY(-15);
            $this->SetFont('Arial','I',10);
            $this->Cell(0,10,'Page '.$this->PageNo(),0,0,'C');
        }

}