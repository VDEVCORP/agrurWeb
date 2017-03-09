<?php

class ActionsController extends Controller  
{
	
	public function __construct($model, $nameController, $nameAction)
	{
		parent::__construct($model, $nameController, $nameAction);
		$this->_setModel($model);
	}
	
	public function inscription(){
		return $this->_view->output();
	}
	
	public function producteur()
	{
		$listAxx=$this->secureAccess("actions/producteur");
		
		include_once(HOME.DS.'includes'.DS.'menu.inc.php');
		return $this->_view->output();
	}

	public function pdf()
	{
		
		include_once (HOME . DS . 'includes' . DS . 'pdfDeca.php');
		$session = session_id();
		// print_r($session);
		 // print_r("</br>");
		 $idClient= $this->_model->idSessionClient($session);
		 // print_r($idClient);
		 // print_r("</br>");
		$idQuote= $this->_model->infosQuotePDF($idClient['idCustomer']);
		$donnees= $this->_model->getElementPDF($idQuote[0]['number']);
		// print_r($idQuote);
		// print_r("</br>");
		
		
		 //print_r($donnees);
		
		 $customer= $this->_model->elementsClientPDF($idClient['idCustomer']);
		// print_r($customer);
		// print_r("</br>");
		 $idQuote = $this->_model->infosQuotePDF($idClient['idCustomer']);
		// print_r($idQuote[0]['number']);
		// print_r("</br>");
		 $addresseCustomer = $this->_model->adressFacture($idClient['idCustomer']);
		// print_r($idClient['idCustomer']);
 // print_r("</br>");
		 $addresseDelivery= $this->_model->adressLivraison($idClient['idCustomer'],$idQuote[0]['number']);
		$this->_model->valPDF($idQuote[0]['number']);
		  // print_r($addresseDelivery);
		$pdf = new pdfDeca($donnees,$customer,$idQuote,$addresseCustomer,$addresseDelivery);
		
		
		//partie creation du mail
		$mail = 'nelsondu59@live.fr';
		if (!preg_match("#^[a-z0-9._-]+@(hotmail|live|msn).[a-z]{2,4}$#", $mail)) // On filtre les serveurs qui rencontrent des bogues.
		{
			$passage_ligne = "\r\n";
		}
		else
		{
			$passage_ligne = "\n";
		}
		$filename = "DevisClient.pdf";
		$pdfdoc = $pdf->Output("","S");
		$attachment = chunk_split(base64_encode($pdfdoc));
		$message_txt = "Voici le devis de la facture que vous venez d'effectué. Decathlon vous remercie..";
		// $message_html = "<html><head></head><body>Merci,Decathlon vous remercis d'effectué votre Devis et vous envoie le PDF de votre devis par Mail. Merci beaucoup, nous espérons vous revoir très vite.</body></html>";
		
		$fichier   = fopen($pdf, "r");
		$attachement = fread($fichier, filesize($pdf));
		$attachement = chunk_split(base64_encode($attachement));
		fclose($fichier);
		$boundary = "-----=".md5(rand());
		
		// le sujet
		$sujet = "Envoie d'un PDF Decathlon !";
		
		
		// le header
		$header = "From: \"Decathlon.be\"<decathlon.be>".$passage_ligne;
		$header.= "Reply-to: \"decathlon belgique\" <deca>".$passage_ligne;
		$header.= "MIME-Version: 1.0".$passage_ligne;
		$header.= "Content-Type: multipart/mixed;".$passage_ligne." boundary=\"$boundary\"".$passage_ligne;
		
		// message du mail
		$message = $passage_ligne."--".$boundary.$passage_ligne;
		
		// $message.= "Content-Type: text/plain; charset=\"ISO-8859-1\"".$passage_ligne;
		// $message.= "Content-Transfer-Encoding: 8bit".$passage_ligne;
		$message.= $passage_ligne.$message_txt.$passage_ligne;
		
		$message.= $passage_ligne."--".$boundary.$passage_ligne;
		
		// $message.= "Content-Type: text/html; charset=\"ISO-8859-1\"".$passage_ligne;
		// $message.= "Content-Transfer-Encoding: 8bit".$passage_ligne;
		// $message.= $passage_ligne.$message_html.$passage_ligne;
		// attachment
		// $message .= "--".$boundary.$passage_ligne;
		$message .= "Content-Type: application/octet-stream; name=\"".$filename."\"".$passage_ligne; 
		$message .= "Content-Transfer-Encoding: base64".$passage_ligne;
		$message .= "Content-Disposition: attachment".$passage_ligne.$passage_ligne;
		$message .= $attachment.$passage_ligne;
		$message .= "--".$boundary."--";
		
		// $message.= "Content-Type: application/pdf;".$passage_ligne;
		// $message.= "Content-Transfer-Encoding: base64".$passage_ligne;
		// $message.= $passage_ligne.$message_txt.$passage_ligne;
		
		
		$message.= $passage_ligne."--".$boundary."--".$passage_ligne;
		$message.= $passage_ligne."--".$boundary."--".$passage_ligne;
		// le fichier en piece jointe
		$message_ .= "--".$boundary.$passage_ligne;
		
		mail($mail,$sujet,$message,$header);
	}

	public function ajax($id)
	{
		if ($id[0] == "checkLogin"){
			if(isset($_POST['loginU']) && isset($_POST['passwordU']))
			{
				$user =  $this->_model->findUserlogin($_POST['loginU']);
				if($user["password_user"] === sha1($_POST['passwordU']))
				{
					$_SESSION['user'] = array(	"user_session" => session_id(),
												"user_key" => $user["fk_id_user"]
												);
					$return = $this->_model->getRankUser($user["fk_id_user"]);

					$success = $return["name_rank"];
				} else {
					$success = false;
				}
			} else {
				$success = false;
			}
			
			echo $success;
		}

		if($id=="devis")
		{
			$numRef=$_POST['numRef'];
			$listProduct=$this->_model->getListProductRecherche($numRef);
			$this->_view->set('listProduct', $listProduct);
			$this->_view->set('page', "donneProduits");
			return $this->_view->output();
		}
		if($id=="ajoutTab")
		{
			$refAjout=$_POST['refAjout'];
			$this->_model->InsertPanier($refAjout);
			$sess=session_id();
			$listProduct=$this->_model->ListProductSession($sess);
			$this->_view->set('listProduct', $listProduct);
			$this->_view->set('page', "ajoutTab");
			return $this->_view->output();
			
		}
		if($id=="ajoutQtte")
		{
			$refAjoutQtte=$_POST['refAjoutQtte'];
			$qtte=$_POST['qtte'];
			$sess=session_id();
			$this->_model->ajoutQtte($refAjoutQtte,$qtte,$sess);
			$listProduct=$this->_model->ListProductSession($sess);
			$this->_view->set('listProduct', $listProduct);
			$this->_view->set('page', "ajoutTab");
			return $this->_view->output();
			
		}
		if($id=="delLine")
		{
			$refDel=$_POST['refDel'];

			$sess=session_id();
			$this->_model->DelLinePanier($refDel,$sess);
			$listProduct=$this->_model->ListProductSession($sess);
			$this->_view->set('listProduct', $listProduct);
			$this->_view->set('page', "ajoutTab");
			return $this->_view->output();
		}
		if($id=="validerPanier")
		{
			$sess=session_id();
			$name="";
			$adr = "";
			$lt=$_POST['list'];
			//Verif client
			$this->_model->verifClientExist($lt[6],$sess,$lt[3],$lt[4]);
			if(count($lt) >11)
							{
								$this->_model->verifAdress($lt[5],$lt[7],$lt[8],$lt[9],'Home',$lt[6]);
								$this->_model->verifAdress($lt[11],$lt[12],$lt[13],$lt[14],$lt[10],$lt[6]);
								$name=$lt[10];
								

							}
							else
							{
								 $this->_model->verifAdress($lt[5],$lt[7],$lt[8],$lt[9],'Home',$lt[6]);
								 $name="Home";
								
							 }
					
			
			$idCl=$this->_model->clientId($lt[6]);
			//print_r($idCl);
			// validation commande
			 $this->_model->validerCommande($lt[0],$lt[1],$lt[2],$sess,$idCl['customerId']);
			$this->_model->ajoutQuoteCommand($sess);
			$this->_model->panierValider($sess);
			// Delivery
			
			// Si home = delivery
			 $idQuote=$this->_model->donneIdQuote($idCl['customerId']);
			 $idAdd=$this->_model->donneIdAdress($name,$idCl['customerId'],$adr);
			
			 // print_r($idAdd);
			$this->_model->livraison($idQuote['number'],$idAdd['idAddresses'],$idCl['customerId']);
			 
			 
			// retour
			$listProduct=$this->_model->ListProductSession($sess);
			$this->_view->set('listProduct', $listProduct);
			$this->_view->set('page', "ajoutTab");
			return $this->_view->output();
			
		}
		if($id=="loadDevis")
		{
			$sess=session_id();
			$listProduct=$this->_model->ListProductSession($sess);
			$this->_view->set('listProduct', $listProduct);
			$this->_view->set('page', "ajoutTab");
			return $this->_view->output();
			
		}
		if($id=="addresseLivraison")
		{
			
			$this->_view->set('page', "addresseLivraison");
			return $this->_view->output();
		}
		else{

		$this->_view->set('page', 'echo');
		$this->_view->set('echo', 'Err_Connect_Timed_Out');
		$this->_view->output();
		}
	}
	
	/* ------------------------------------------ Accès sécurisé -------------------------------------------------------*/

	public function secureAccess($page)
	{
		$rank =  $this->_model->getRankUser($_SESSION['user']['user_key']);
		$axx = $this->_model->getAccessUser($rank['name_rank'], $page);
		
		if (!$axx){
			header("Location: http://agrur.fr");
		} else {
			$allAxx = $this->_model->getAllAccessUser($rank['name_rank']);
			$tabAxx = Array();
			foreach ($allAxx as $list)
			{
				$tabAxx[] = $list['url_page'];
			}
		}
			return $tabAxx;
	}
	
	/* ------------------------------------ Fin de l'accès sécurisé ---------------------------------------------------*/
	
	/* ------------------------------------------ Connexion -----------------------------------------------------------*/
	
	public function login()
	{
		return $this->_view->output();
	}
	
	/* --------------------------------------- Fin de la connexion -----------------------------------------------------*/
	
	/* ------------------------------------------ Deconnexion ----------------------------------------------------------*/
	
	public function logout()
	{
		try {
				session_destroy();
				header("Location: http://agrur.fr");
			 
		} catch (Exception $e) {
			echo '<h1>Application error:</h1>' . $e->getMessage();
		}
	}
	
	/* -------------------------------------- Fin de la deconnexion ----------------------------------------------------*/

}