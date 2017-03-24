<div class="row">
    <div class="col-lg-7">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>Inscription</h5>
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
                <form action="" method="POST" class="form">
                    <div class="form-group">
                        <label>Vous souhaitez inscrire un : </label>
                        <div class="radio-inline">
                            <label>
                                <input type="radio" name="option" class="profession" id="optionProducteur" value="producteur">
                                Producteur
                            </label>
                        </div>
                        <div class="radio-inline">
                            <label>
                                <input type="radio" name="option" class="profession" id="optionClient" value="client">
                                Client
                            </label>
                        </div>
                    </div>

                    <div id="adherent" style="display:none">
                        <label>Adhérent : </label>
                        <div class="checkbox-inline">
                            <label> 
                                <input type="checkbox" name="adherent" value="1">
                                Oui
                            </label>
                        </div>
                        <div class="checkbox-inline">
                            <label> 
                                <input type="checkbox" name="adherent" value="0">
                                Non
                            </label>
                        </div>
                    </div>

                    <hr>

                    <div class="form-group">
                        <label for="societe">Société</label>
                        <input type="text" name="societe" id="societe" class="form-control" placeholder="* Facultatif pour les producteurs">
                    </div>
                    <div class="form-group">
                        <label for="nom">Nom</label>
                        <input type="text" name="nom" id="nom" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="prenom">Prenom</label>
                        <input type="text" name="prenom" id="prenom" class="form-control">
                    </div>

                    <hr>
                    <h2>Contacts</h2>

                    <div class="form-group">
                        <label for="mail">Email</label>
                        <input type="mail" name="mail" id="mail" class="form-control" placeholder="exemple@mail.fr">
                    </div>
                    <div class="form-group">
                        <label for="telephone">Telephone</label>
                        <input type="tel" name="telephone" id="telephone" class="form-control" placeholder="06 xx xx xx xx">
                    </div>

                    <hr>
                    <h2>Adresse</h2>

                    <div class="form-group">
                        <label for="adresse">Rue</label>
                        <input type="text" name="adresse" id="adresse" class="form-control" placeholder="27 rue des Saules">
                    </div>
                
                    <div class="form-inline">
                        <div class="form-group">
                            <label for="ville">Ville</label>
                            <input type="text" name="ville" id="ville" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="codePostal">Code Postal</label>
                            <input type="text" name="codePostal" id="codePostal" class="form-control">
                        </div>
                    </div>

                    <hr>

                    <div class="form-group">
                            <label for="tempPassword">Mot de passe</label>
                            <input type="text" name="tempPassword" id="tempPassword" class="form-control" placeholder="* Celui-ci est provisoire">
                    </div>

                    <input type="submit" class="btn btn-primary" value="Enregistrer">  
                </form>
            </div>
        </div>
    </div>
</div>
<?php include(HOME . DS . "includes" . DS . "common.footer.php"); ?>