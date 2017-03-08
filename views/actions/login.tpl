<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	
	<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->

    <title>Agrur | Login</title>

    <link href="/includes/css/bootstrap.min.css" rel="stylesheet">
    <link href="/includes/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="/includes/css/animate.css" rel="stylesheet">
    <link href="/includes/css/style.css" rel="stylesheet">

</head>

<body class="gray-bg">

	<div class="middle-box text-center loginscreen animated fadeInDown">
        <div>
            <div>

                <h1 class="logo-name">AGR</h1>

            </div>
            <h3>Bienvenue dans l'espace Agrur!</h3>
            <p>
			Conçu pour les producteurs adhérents de la coopérative Agrur et ses clients.
            </p>
            <p>Connexion | Authentification</p>
            <div class="m-t">
                <div class="form-group">
                    <input id="login" name="login" type="email" class="form-control" placeholder="@ Email" required="">
                </div>
                <div class="form-group">
                    <input id="password" name="password" type="password" class="form-control" placeholder="Mot de passe" required="">
                </div>
                <button type="submit" id="connexion" class="btn btn-primary block full-width m-b">Login</button>

                <a href="#"><small>Mot de passe oublié?</small></a>
                <p class="text-muted text-center"><small>Pas encore inscrit? Rejoignez-nous</small></p>
                <a class="btn btn-sm btn-white btn-block" href="/actions/inscription">Inscription</a>
            </div>
            <p class="m-t"> <small>Web solution by VDEV &copy; 2017</small> </p>
        </div>
    </div>


    <!-- Mainly scripts -->
    <script src="/includes/js/jquery-2.1.1.js"></script>
    <script src="/includes/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
		$("#connexion").on("click", function(){
			var login = document.getElementById("login").value;
			var password = document.getElementById("password").value;
					$.post("/actions/ajax/checkLogin",{loginU : login, passwordU : password}, function(retour){
					console.log(retour);
					retour = retour.substring(0,1);
					if (retour == 1){
						document.location.href="/actions/producteur";
					} else if(retour == 2){
						document.location.href="/actions/producteur";
					} else if(retour == 3){
						document.Location.href="/actions/client";
					} else {
						alert('BAD LOGIN OR PASSWORD !')
					}}, "text");
				});
	</script>

</body>
</html>