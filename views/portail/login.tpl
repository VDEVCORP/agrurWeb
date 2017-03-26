<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	
	<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->	

    <title>AGRUR | Log In </title>

    <link href="/includes/css/bootstrap.min.css" rel="stylesheet">
    <link href="/includes/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/includes/css/style.css" rel="stylesheet">
    <link href="/includes/css/animate.css" rel="stylesheet">

</head>

<body class="gray-bg">

	<div class="middle-box text-center loginscreen animated fadeInDown">
        <div>
            <div>

                <h1 class="logo-name"><img src="/includes/images/Agrur_logo.png" height="250"></h1>

            </div>
            <h3>Bienvenue dans l'espace Agrur!</h3>
            <p>
			Conçu pour les producteurs adhérents de la coopérative Agrur et ses clients.
            </p>
            <p>Connexion | Authentification</p>
            <form action="" class="m-t">
                <div class="form-group">
                    <input id="login" name="login" type="email" class="form-control" placeholder="@ Email" required="">
                </div>
                <div class="form-group">
                    <input id="password" name="password" type="password" class="form-control" placeholder="Mot de passe" required="">
                </div>
                <button type="submit" id="connexion" class="btn btn-primary block full-width m-b">Login</button>
            </div>
            <p class="m-t"> <small>Web solution by VDEV &copy; 2017</small> </p>
        </div>
    </div>


    <!-- Mainly scripts -->
    <script src="/includes/js/jquery-2.1.1.js"></script>
    <script src="/includes/js/app/main.js"></script>
    <script src="/includes/js/bootstrap.min.js"></script>
    <script src="/includes/js/inspinia.js"></script>

	<!-- scripts Plugin Inspinia -->
		<!-- Animation replis menu -->
		<script src="/includes/js/plugins/metisMenu/jquery.metisMenu.js"></script>
        <script src="/includes/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

        <!-- Authentification -->
	    <script src="/includes/js/app/auth.js"></script>

</body>
</html>