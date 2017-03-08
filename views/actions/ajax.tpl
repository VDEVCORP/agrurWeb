<?php
	if ($page == "donneProduits")
	{?>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>model</th>	
					<th>name</th>	
					<th>prix</th>
					<th>img</th>					
				</tr>
			<thead>
			<tbody>
			<?php foreach ($listProduct as $product) { ?>
			<tr>
				<th><?= $product['model_id']; ?></th>
				<th><?= $product['name'] ;?></th>
				<th><?= $product['price'].'€' ;?></th>
				<th><img src='<?= $product['smallimage'] ?>' style='width:50px;height:50px ;'/></th>
				<th><button type="button" id="btnAjout" onclick="ajoutTab(<?= $product['model_id'];?>)" value='<?= $product['model_id'];?>'>Valider</button>
			</tr>
			<?php }?>
			</tbody>
		</table>
	<?php }?>
	
	<?php
	if($page=="ajoutTab")
		{
			$lt=array();
			$totalHT=0;
			$totalTVA=0;
			$totalTTC=0;	
			?>
			<table class="table table-bordered " id="devis">
										<thead>
	                    					<tr>
												<th>ref</th>
												<th>article</th>
												<th>quantité</th>
												<th>Prix U Brut</th>
												<th>Remise</th>
												<th>Prix U Net</th>
												<th>Tva</th>
												<th>Tva incluse</th>
												<th>Prix U</th>
												<th>Prix Total</th>
											</tr>
										</thead>
										
							
			
			<tbody id="tligne" class="tligne">
			<?php foreach($listProduct as $product) { ?>	
					<tr>
					 
						<td name="ref"><?= $product['model_id'];?></td>
						<td name ="name"><?= $product['name'];?></td>
						<td name="qtte"><input type="number" onkeypress="return false;" onchange="calcul()"   value=<?=$qtte=1;?> min="1" id="qtte<?php echo $product['model_id'];?>" Class="input_cde"></td>
						<td name ="price"><?= $product['price'];?>€</td>
						<td name="promtion"><?= round (($product['promo_percentage']/100)*$product['price'],3);?>€</td>
						<td name="prixUNet" id="prixUNet<?=$product['model_id'];?>"><?= $prixUNet=$product['display_price'];?>€</td>
						<td>21%</td>
					 	<td name="TVAIncluse" id="TVAIncluse<?php echo $product['model_id'];?>"><?= $tvaI=round (($product['display_price'])*0.21,2);?>€</td>
						<td name="prixU" id="prixU<?=$product['model_id'];?>"><?= $prixU= round ((($product['display_price'])*0.21)+$product['display_price'],2);?>€</td>
						<td name="prixT" id="prixT<?php echo $product['model_id'];?>"><?= $prixT= round (((($product['display_price'])*0.21)+$product['display_price'])*$product['qtte'],2);?>€</td>
						<td><button type="button" id="btndelLine" onclick="delLine(<?= $product['model_id'];?>)">Supprimer</button></td>

					</tr>
					<?php $totalHT=$totalHT+($prixUNet*$product['qtte']);
						$totalTVA=$totalTVA+($tvaI*$product['qtte']);
						$totalTTC=$totalHT+$totalTVA;
					};
				?>
					
</tbody>
</table>
			<table class="table table-bordered " >
			<thead>
				<tr>
					<th>Total HT</th>
					<th>Total TVA</th>
					<th>Total TTC</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td id="tHt"><?= $totalHT ?>€</td>
					<td id ="tTVA"><?= $totalTVA ?>€</td>
					<td id="tTTC"><?= $totalTTC ?>€</td>
					
				</tr>
			</tbody>
			
			
			</table>
		
		<button type="button" id="validerDevis" onclick="validerDevis()">Enregistrer</button>
		<div id='test'></div>
<?php 	}?>
<?php 
if($page=="addresseLivraison"){ ?>	
		<label for="nomLivraison">Nom de la livraison : </label><br /><input type="text" name="nomLivraison" id="nomLivraison" size="30" /><br />
		<label for="adresseLivraison">Adresse : </label><br /><input type="text" name="adresseLivraison" id="adresseLivraison" size="30" /><br />
		<label for="codepostalLivraison">Code postal : </label><br /><input type="text" onkeypress="verifierCaracteres(event); return false;" name="codepostalLivraison" id="codepostalLivraison" maxlength="5" size="30" /><br />
		<label for="villeLivraison">Ville : </label><br /><input type="text" name="villeLivraison" id="villeLivraison" size="30" /><br /><br />
		<label for="paysLivraison">Pays : </label>
		<select name="paysLivraison" id="paysLivraison">
			<option value="belgique">Belgique</option>
			<option value="france">France</option>
		</select>
<?php }?>