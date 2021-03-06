<div class="row">
	<div class="col-lg-7">
		<div class="ibox float-e-margins">
			<div class="ibox-title">
				<h5>INFORMATIONS <small>Dernières modification le <b><?= $producer['last_edit'] ?></b></small></h5>
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
						<div class="col-sm-10"><input type="text" title="Nom de la société" name="societe" value="<?= $producer["nomSociete"] ?>" class="form-control" required></div>
					</div>
					
					<div class="form-group">
						<label class="col-md-2 control-label">Représentant</label>
						<div class="col-md-5"><input type="text" title="Nom du représentant" name="nom" value="<?= $producer["nomResponsable"] ?>" class="form-control" required></div>
						<div class="col-md-5"><input type="text" title="Prénom du représentant" name="prenom" value="<?= $producer["prenomResponsable"] ?>" class="form-control" required></div>	
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">Email</label>
						<div class="col-sm-10"><input type="email" title="Email" name="email" value="<?= $producer["email"] ?>" class="form-control" required></div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">Téléphone</label>
						<div class="col-sm-10"><input type="text" title="Numéro de téléphone" name="telephone" value="<?= $producer["telephone"] ?>" class="form-control" required></div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">Adresse</label>
						<div class="col-sm-10"><input type="text" title="Adresse professionnelle" name="adresse" value="<?= $producer["adresse"] ?>" class="form-control" required></div>
					</div>
					
					<div class="form-group">
						<label class="col-md-2 control-label">Ville</label>
						<div class="col-md-7"><input type="text" title="Ville" name="ville" value="<?= $producer["ville"] ?>" class="form-control" required></div>
						<div class="col-md-3"><input type="text" title="Code postal" name="codePostal" value="<?= $producer["codePostal"] ?>" class="form-control" required></div>
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
				<?php if(!empty($certifDelivrees)){ ?>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Libelle</th>
                            <th>Reçu le<th>
                        </tr>
                    <thead>
                    <tbody>
                    <?php foreach($certifDelivrees as $certifDelivree){ ?>
                        <tr>
                            <td><?= $certifDelivree["libelleCertification"] ?></td>
                            <td><?= $certifDelivree["dateCertification"] ?></td>
                        </tr>
                    <?php }?>
                    </tbody>
                </table>
                <?php } else { echo '<p class="text-center">Aucune certification</p>'; } ?>
			</div>
		</div>
	</div>
</div>