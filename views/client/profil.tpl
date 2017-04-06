<div class="row">
	<div class="col-lg-2"></div>
	<div class="col-lg-8">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>INFORMATIONS <small>Dernières modification le <b><?= $customer['last_edit'] ?></b></small></h5>
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
				<form action="" method="POST" class="form-horizontal">
					<p>Prenez soin de tenir à jour vos informations</p>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">Société</label>
						<div class="col-sm-10"><input type="text" title="Nom de la société" name="societe" value="<?= $customer["nomClient"] ?>" class="form-control" required></div>
					</div>
					
					<div class="form-group">
						<label class="col-md-2 control-label">Représentant</label>
						<div class="col-md-5"><input type="text" title="Nom du responsable" name="nom" value="<?= $customer["nomRepresentant"] ?>" class="form-control" required></div>
						<div class="col-md-5"><input type="text" title="Prénom du responsable" name="prenom" value="<?= $customer["prenomRepresentant"] ?>" class="form-control" required></div>	
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">Email</label>
						<div class="col-sm-10"><input type="email" title="Email" name="email" value="<?= $customer["email"] ?>" class="form-control" required></div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">Téléphone</label>
						<div class="col-sm-10"><input type="text" title="Numéro de téléphone" name="telephone" value="<?= $customer["telephone"] ?>" class="form-control" required></div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">Adresse</label>
						<div class="col-sm-10"><input type="text" title="Adresse professionnelle" name="adresse" value="<?= $customer["adresse"] ?>" class="form-control" required></div>
					</div>
					
					<div class="form-group">
						<label class="col-md-2 control-label">Ville</label>
						<div class="col-md-7"><input type="text" title="Ville" name="ville" value="<?= $customer["ville"] ?>" class="form-control" required></div>
						<div class="col-md-3"><input type="text" title="Code postal" name="codePostal" value="<?= $customer["codePostal"] ?>" class="form-control" required></div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-4"></div>
						<button class="btn btn-lg btn-primary col-sm-4" type="submit">Enregistrer</button>
						<div class="col-sm-4"></div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="col-lg-2"></div>
</div>