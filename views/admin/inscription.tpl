<div class="row">
    <div class="col-lg-2"></div>

    <div class="col-lg-8">
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
                <form action="" method="POST" class="form-horizontal">
                    <h2>Informations</h2>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">Vous souhaitez inscrire un : </label>
                        <div class="radio-inline">
                            <label>
                                <input type="radio" name="option" class="profession" value="producteur">
                                Producteur
                            </label>
                        </div>
                        <div class="radio-inline">
                            <label>
                                <input type="radio" name="option" class="profession" value="client">
                                Client
                            </label>
                        </div>
                    </div>

                    <div id="adherent" style="display:none">
                        <label class="col-sm-4 control-label">Adhérent : </label>
                        <div class="radio-inline">
                            <label> 
                                <input type="radio" name="adherent" value="1">
                                Oui
                            </label>
                        </div>
                        <div class="radio-inline">
                            <label> 
                                <input type="radio" name="adherent" value="0">
                                Non
                            </label>
                        </div>
                    </div>

                    <hr>

                    <div class="form-group">
                        <label for="societe" class="col-sm-2 control-label">Société</label>
                            <div class="col-sm-10">
                                <input type="text" name="societe" id="societe" class="form-control" placeholder="* Facultatif pour les producteurs">
                            </div>
                    </div>

                    <div class="form-group">
                        <label for="nom" class="col-sm-2 control-label">Nom</label>
                        <div class="col-sm-10">
                            <input type="text" name="nom" id="nom" class="form-control" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="prenom" class="col-sm-2 control-label">Prenom</label>
                        <div class="col-sm-10">
                            <input type="text" name="prenom" id="prenom" class="form-control" required>
                        </div>
                    </div>

                    <hr>
                    <h2>Contacts</h2>

                    <div class="form-group">
                        <label for="mail" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input type="mail" name="mail" id="mail" class="form-control" placeholder="exemple@mail.fr" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="telephone" class="col-sm-2 control-label">Telephone</label>
                        <div class="col-sm-10">
                            <input type="tel" name="telephone" id="telephone" class="form-control" placeholder="0612345678" required>
                        </div>
                    </div>

                    <hr>
                    <h2>Adresse</h2>

                    <div class="form-group">
                        <label for="adresse" class="col-sm-2 control-label">Rue</label>
                        <div class="col-sm-10">
                            <input type="text" name="adresse" id="adresse" class="form-control" placeholder="27 rue des Saules" required>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="ville" class="col-sm-2 control-label">Ville</label>
                        <div class="col-sm-10">
                            <input type="text" name="ville" id="ville" class="form-control" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="codePostal" class="col-sm-2 control-label">Code Postal</label>
                        <div class="col-sm-5">
                            <input type="text" name="codePostal" id="codePostal" class="form-control" required>
                        </div> 
                    </div>

                    <hr>

                    <div class="form-group">
                        <label for="tempPassword" class="col-sm-2 control-label">Mot de passe</label>
                        <div class="col-sm-5">
                            <input type="text" name="tempPassword" id="tempPassword" class="form-control" placeholder="* Celui-ci est provisoire" required>
                        </div>    
                    </div>

                    <button type="submit" class="btn btn-primary btn-lg">Enregistrer</button>
                </form>
            </div>
        </div>
    </div>

    <div class="col-lg-2"></div>

</div>