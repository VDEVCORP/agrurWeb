$("#connexion").on("click", function(){
			var login = document.getElementById("login").value;
			var password = document.getElementById("password").value;
					$.post("/portail/auth",{loginU : login, passwordU : password}, function(retour){
					retour.replace(/^\s+|\s+$/gm,'');
                    console.log(retour);
					if (retour == "producer"){
						document.location.href="/producteur/home";
					} else if(retour == "customer"){
						document.location.href="/client/home";
					} else if(retour == "admin"){
						document.location.href="/admin/home";
					} else {
						alert('BAD LOGIN OR PASSWORD !')
					}}, "text");
				});