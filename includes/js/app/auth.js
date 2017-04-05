$("#connexion").on("click", function(){
	event.preventDefault()
	var login = document.getElementById("login").value;
	var password = document.getElementById("password").value;
		$.post("/portail/auth",{loginU : login, passwordU : password}, function(retour){
		retour.replace(/^\s+|\s+$/gm,'');
		if (retour == "producer"){
			document.location.href="/producteur/home";
			return true
		} else if(retour == "customer"){
			document.location.href="/client/home";
			return true
		} else if(retour == "admin"){
			document.location.href="/admin/home";
			return true
		} else {
			alert('Erreur d\'identifiant ou de mot de passe!')
			return false
		}
	});
});