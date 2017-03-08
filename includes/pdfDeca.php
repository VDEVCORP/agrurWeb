<?php

require('Class/Fpdf/fpdf.php');
require('locales/decide-lang.php');
class pdfDeca extends FPDF
{			
		protected $donnees = [];
		protected $customer = [];
		protected $idQuote = [];
		protected $addresseCustomer = [];
		protected $addresseDelivery = [];
		function __construct($donnees , $customer , $idQuote , $addresseCustomer , $addresseDelivery){
		parent::__construct();
	

	self::AddPage();
	self::AliasNbPages();
	// self::LoadData($file);
	self::Facturation($customer , $idQuote , $addresseCustomer , $addresseDelivery);
	self::Devis($donnees , $idQuote );
	self::FinPage();
	self::Output('Facture.pdf', 'I');
										}
	// En-tête
	public function Header()
	{
		$this->SetMargins(5,10,5);
		// Logo
		 $this->Image('includes/images/decathlon-logo.jpg',5,6,48);
		$this->Ln(11);
		$this->SetFont('Arial','B',9);
		$this->Cell(0,3,'Decathlon Belgium',0,1);
		$this->SetFont('Arial','',9);
		$this->Cell(0,3,'Belgium',0,1);
		$this->Cell(0,3,'Avenue Jules Bordet 1',0,1);
		$this->Cell(0,3,'1140 EVERE',0,1);
		$this->Cell(0,3,'No TVA : BE0449296278',0,1);
		$this->Cell(0,3,'Compte B2B : BE37 0015 3786 9928(GEBABEBB)',0,1);
		$this->Ln(5);
	}

	// Pied de page
	public function Footer()
	{ 
		$this->SetY(-15);
		$this->SetFont('Arial','I',8);
		$this->Cell(0,10,'Page '.$this->PageNo().'/{nb}',0,0,'C');
	}

	//données FACTURATION
	public function LoadData($file)
	{
		// Lecture des lignes du fichier
		$lines = file($file);
		$data = array();
		foreach($lines as $line)
		$data[] = explode(';',trim($line));
		return $data;
	}

	//Tableau Facturation
	public function Facturation($customer , $idQuote , $addresseCustomer , $addresseDelivery)
	{
		$header= array(TXT_RELEVE_FAC,TXT_ADRESSE_FAC ,TXT_ADRESSE_LIV);
	
	
		
		// Largeurs des colonnes
		$w=array(65, 70, 65);
		// En-tête
		$this->SetFont('Arial','B',9);
		for($i=0;$i<count($header);$i++)
		{
			$this->SetFillColor(200,200,200);
			$this->Cell($w[$i],8,utf8_decode($header[$i]),1,0,'C','True');
		}
		$this->Ln();
		$infos=array(TXT_NDEVIS,TXT_DATE_DEVIS,TXT_CARTE);
		$p=-1;
		// Données
		$this->SetFont('Arial','',9);
		//Devis
		$posX = $this->getX();
		$posY = $this->getY();
			$this->Cell($w[0],5,utf8_decode($infos[0].$idQuote[0]['number']),'LR');$this->Ln();
			$this->Cell($w[0],5,utf8_decode($infos[1].$idQuote[0]['dateQuote']),'LR');$this->Ln();
			$this->Cell($w[0],5,utf8_decode($infos[2]),'LR');$this->Ln();
			$this->Cell($w[0],5,utf8_decode($customer[0]['numCard']),'LR');$this->Ln();
		$this->SetXY($posX + $w[0],$posY);
		//FACTURATION
			$this->Cell($w[1],5,utf8_decode($customer[0]['name'].' '.$customer[0]['firstname']),'LR');$this->Ln();
			$this->SetX($posX + $w[0]);
			$this->Cell($w[1],5,utf8_decode($addresseCustomer[0]['street']),'LR');$this->Ln();
			$this->SetX($posX + $w[0]);
			$this->Cell($w[1],5,utf8_decode($addresseCustomer[0]['postCode'].' '.$addresseCustomer[0]['city']),'LR');$this->Ln();
			$this->SetX($posX + $w[0]);
			$this->Cell($w[1],5,utf8_decode($addresseCustomer[0]['country']),'LR');$this->Ln();
			
			$this->SetXY($posX + $w[1]+$w[0], $posY);

		//Livraison
			$this->Cell($w[2],5,utf8_decode($addresseDelivery[0]['name']),'LR');$this->Ln();
			$this->SetX($posX + $w[1]+$w[0]);
			$this->Cell($w[2],5,utf8_decode($addresseDelivery[0]['street']),'LR');$this->Ln();
			$this->SetX($posX + $w[1]+$w[0]);
			$this->Cell($w[2],5,utf8_decode($addresseDelivery[0]['postCode'].' '.$addresseDelivery[0]['city'] ),'LR');$this->Ln();
			$this->SetX($posX + $w[1]+$w[0]);
			$this->Cell($w[2],5,utf8_decode($addresseDelivery[0]['country']),'LR');$this->Ln();
						
				
			
		
		// Trait de terminaison
		$this->Cell(array_sum($w),0,'','T');
	
		$this->Ln(7);
	}

	// Tableau Facture
	public function Devis($donnees, $idQuote)
	{
		$euro =chr(128);
		$header= array(TXT_REF,TXT_ARTICLE,TXT_QUANTITE,TXT_PRIX_U_BRUT,TXT_REMISE,TXT_PRIX_U_NET,TXT_TVA,TXT_TVA_INCLUSE,TXT_PRIX_U,TXT_PT);
		$this->SetTextColor(250,0,0);
		$this->SetFillColor(200,200,200);
		$this->Cell(200,10,utf8_decode(TXT_DEVIS_NUM_HEADER .$idQuote[0]['number']),1,0,'L','True');
		$this->SetTextColor(0,0,0);
		$this->Ln();
		$totalMontantHt=0.00;
		$totalTva=0.00;
		$w=array(14,40,19,22,15,22,12,17,22,17);
	// En-tête
		$this->SetFont('Arial','B',8);
		for($i=0;$i<count($header);$i++)
		{
			$this->SetFillColor(200,200,200);
			$posX = $this->getX();
			$posY = $this->getY();
			if(strlen($header[$i])>=16)
				$taille=5;
			else if($w[$i]==17 && $header[$i]!='Prix Total')
				$taille=5;
			else
				$taille=10;
			$this->MultiCell($w[$i],$taille,utf8_decode($header[$i]),1,'C','True');
			$this->SetXY($posX + $w[$i],$posY);
		}
		$this->Ln(10);
		$this->SetFont('Arial','',9);
		//fin En-tête
	
		
			
			
		// Données a modifier seulement dans le row[]
		foreach($donnees as $row)
		{
			//reference
			$this->Cell($w[0],10,$row["model_id"],1);
			//article name
			$posX = $this->getX();
			$posY = $this->getY();
			//var_dump($row[1]);
			if(strlen($row["name"])>=21)
			$taille=5;
			else
			$taille=10;
			$this->MultiCell($w[1],$taille,utf8_decode($row['name']),1);
			$this->SetXY($posX + 40, $posY);
			//qtte
			$this->Cell($w[2],10,$row['qtte'],1,0,'C');
			//PUB
			$this->Cell($w[3],10,$row['price'].$euro,1,0,'R');
			//remise
			$this->Cell($w[4],10,$row['promo_percentage'].$euro,1,0,'C');
			//PUN
			$this->Cell($w[5],10,$row['display_price'].$euro,1,0,'R');
			//TVA
			$tva = 21;
			$this->Cell($w[6],10,$tva.'%',1,0,'C');
			//TVA Incluse
			$tvaIncluse = Round($row['display_price']*$tva/100,2);
			$this->Cell($w[7],10,$tvaIncluse.$euro,1,0,'R');
			//PrixU
			$prixU = Round($row['display_price']+$tvaIncluse,2);
			$this->Cell($w[8],10,$prixU.$euro,1,0,'R');
			//TOTAL
			$TotalPrix = Round($prixU * $row['qtte'],2);
			$this->Cell($w[9],10,$TotalPrix.$euro,1,0,'R');
			
			$totalMontantHt=Round($totalMontantHt+$row['qtte']*$row['display_price'],2);
			$totalTva=Round($totalTva+$row['qtte']*$tvaIncluse,2);
			$this->Ln();
			
		}
		
		$montant=$totalMontantHt+$totalTva;
		// Trait de terminaison
		$this->Cell(array_sum($w),0,'','T');
		$this->Ln();
		//Frais de livraison
		//Modifier les valeurs PrxU,Remise,PrxU.Net,TVA incluse, PrxU et PrxTotal
		$this->Cell(73,9,'Frais de livraison',1,0,'R');
		$this->Cell($w[3],9,'3.30'.$euro,1,0,'R');
		$this->Cell($w[4],9,'-3.30'.$euro,1,0,'C');
		$this->Cell($w[5],9,'0.00'.$euro,1,0,'R');
		$this->Cell($w[6],9,'21.00%',1);
		$this->Cell($w[7],9,'0.00'.$euro,1,0,'R');
		$this->Cell($w[8],9,'0.00'.$euro,1,0,'R');
		$this->Cell($w[9],9,'0.00'.$euro,1,0,'R');
		//fin de frais de livraison
		$this->Ln();
		//Total des prix
		$this->SetFont('Arial','B',9);
		$this->Cell(132);$this->Cell(51,10,TXT_TOTAL_HT,1);$this->Cell(17,10,$totalMontantHt.$euro,1);$this->Ln();
		$this->Cell(132);$this->Cell(51,10,TXT_TOTAL_TVA,1);$this->Cell(17,10,$totalTva.$euro,1);$this->Ln();
		$this->SetFillColor(200,200,200);
		$this->Cell(132);$this->Cell(51,10,TXT_TOTAL_TTC,1,0,'L','True');$this->Cell(17,10,$montant.$euro,1,0,'L','True');
		$this->SetFont('Arial','',9);
		$this->Ln(20);

	}

	
	public function FinPage()
	{
		$this->SetFont('Arial','',9);
		// Sortie du texte justifié
		$this->MultiCell(0,10,utf8_decode(TXT_QUESTION));
		$this->Ln(2);
		$this->SetFont('Arial','B',9);
		$this->Cell(200,7,utf8_decode(TXT_REMERCIEMENT),0,0,'C','True');
	}



// var_dump($donnees);
	public function textEnTete()
	{
	//Tableau des informations du relevé de factures, client et livraison
	$header= array(TXT_RELEVE_FAC,TXT_ADRESSE_FAC ,TXT_ADRESSE_LIV);
	
	// Chargement des données
	$data= $pdf->LoadData('doc/Facturation.txt');
	$pdf->Facturation($header,$data);

	//Tableau des détailles de la facture
	//a changer data
	//$data=$pdf->LoadData('doc/Facture.txt');
	$header= array(TXT_REF,TXT_ARTICLE,TXT_QUANTITE,TXT_PRIX_U_BRUT,TXT_REMISE,TXT_PRIX_U_NET,TXT_TVA,TXT_TVA_INCLUSE,TXT_PRIX_U,TXT_PT);

	//Modifier les variables pour la bdd 
	$pdf->Facture($header,$donnees,'111 16 000 0000184560');

	//$pdf->Paiement($InformationPaiement,$DatePaiement,$MontantPaiement);
	}
}