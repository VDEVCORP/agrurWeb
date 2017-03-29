<div class="row">
	<div class="col-lg-7">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>INFORMATIONS <small>Dernières modification le d/m/Y</small></h5>
				<div class="ibox-tools">
					<a class="collapse-link">
						<i class="fa fa-chevron-up"></i>
					</a>
					<a class="close-link">
						<i class="fa fa-times"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content">
				<form class="form-horizontal">
					<p>Prenez soin de tenir à jour vos informations</p>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">Société</label>
						<div class="col-sm-10"><input type="text" title="Nom de la société" name="societe" value="<?= $user["nomSociete"] ?>" class="form-control"></div>
					</div>
					
					<div class="form-group">
						<label class="col-md-2 control-label">Représentant</label>
						<div class="col-md-5"><input type="text" title="Nom du représentant" name="nom" value="<?= $user["nomResponsable"] ?>" class="form-control"></div>
						<div class="col-md-5"><input type="text" title="Prénom du représentant" name="prenom" value="<?= $user["prenomResponsable"] ?>" class="form-control"></div>	
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">Email</label>
						<div class="col-sm-10"><input type="email" title="Email" name="email" value="<?= $user["email"] ?>" class="form-control"></div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">Téléphone</label>
						<div class="col-sm-10"><input type="text" title="Numéro de téléphone" name="telephone" value="<?= $user["telephone"] ?>" class="form-control"></div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">Adresse</label>
						<div class="col-sm-10"><input type="text" title="Adresse professionnelle" name="adresse" value="<?= $user["adresse"] ?>" class="form-control"></div>
					</div>
					
					<div class="form-group">
						<label class="col-md-2 control-label">Ville</label>
						<div class="col-md-7"><input type="text" title="Ville" name="ville" value="<?= $user["ville"] ?>" class="form-control"></div>
						<div class="col-md-3"><input type="text" title="Code postal" name="codePostal" value="<?= $user["codePostal"] ?>" class="form-control"></div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-4">&nbsp;</div>
						<button class="btn btn-lg btn-primary col-sm-4" type="submit">Enregistrer</button>
						<div class="col-sm-4">&nbsp;</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<div class="col-lg-5">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>Certifications obtenues</h5>
				<div class="ibox-tools">
					<a class="collapse-link">
						<i class="fa fa-chevron-up"></i>
					</a>
					<a class="close-link">
						<i class="fa fa-times"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content">
				
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-lg-7">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>Vergers possedés</h5>
				<div class="ibox-tools">
					<a class="collapse-link">
						<i class="fa fa-chevron-up"></i>
					</a>
					<a class="close-link">
						<i class="fa fa-times"></i>
					</a>
				</div>
			</div>
			<div class="ibox-content">
				
			</div>
		</div>
	</div>
</div>

<?php include(HOME . DS . "includes" . DS . "common.footer.php"); ?>