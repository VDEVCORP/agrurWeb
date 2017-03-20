<h1>Inscription</h1>
<form action="" method="POST" class="form">
    <p>Vous souhaitez inscrire un :</p>
    <div class="radio-inline">
        <label>
            <input type="radio" name="option" id="optionProducteur" value="producteur">
            Producteur
        </label>
    </div>
    <div class="radio-inline">
        <label>
            <input type="radio" name="option" id="optionClient" value="client">
            Client
        </label>
    </div>

    <div class="form-group">
        <label for="societe">Société</label>
        <input type="text" name="societe" id="societe" class="form-control">
    </div>

    <div class="form-group">
        <label for="nom">Nom</label>
        <input type="text" name="nom" id="nom" class="form-control">
    </div>
    
    <div class="form-group">
        <label for="prenom">Prenom</label>
        <input type="text" name="prenom" id="prenom" class="form-control">
    </div>
    <tr>
    <h2>Contacts</h2>
    <div class="form-group">
        <label for="mail">Email</label>
        <input type="mail" name="mail" id="mail" class="form-control" placeholder="exemple@mail.fr">
    </div>
    <div class="form-group">
        <label for="telephone">Telephone</label>
        <input type="tel" name="telephone" id="telephone" class="form-control" placeholder="06 xx xx xx xx">
    </div>
    <tr>
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
        <tr>
         <div class="form-group">
                <label for="tempPassword">Mot de passe</label>
                <input type="text" name="tempPassword" id="tempPassword" class="form-control">
        </div>  
</form>