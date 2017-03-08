<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	
	<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->	

    <title>AGRUR | Espace</title>

    <link href="/includes/css/bootstrap.min.css" rel="stylesheet">
    <link href="/includes/font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="/includes/css/plugins/dataTables/datatables.min.css" rel="stylesheet">

    <link href="/includes/css/animate.css" rel="stylesheet">
    <link href="/includes/css/style.css" rel="stylesheet">

</head>

<body>

    <div id="wrapper">

    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav metismenu" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element"> <span>
                            <img alt="decathlon" width="180" src="/includes/img/Noix.png" /></span>
                    </div>
                    <div class="logo-element">
                       <img alt="decathlon_mini" width="48" src="/includes/img/Noix.png" />
                    </div>
                </li>
				
				<!-- DEBUT Elements du menu de l'application des retours Decatlhon
				
				<?php if (in_array("actions/retours", $listAxx)) { 
				?>
					<li class="<?php if (substr($_SERVER['REQUEST_URI'],1)=="actions/retours") echo "active"; ?>">
						<a href="/actions/retours"><i class="fa fa-th-large"></i> <span class="nav-label">Retours</span></a>
                </li>
				<?php } ?>
				
				<?php if (in_array("actions/retourmanuel", $listAxx)) { 
				?>
					<li class="<?php if (substr($_SERVER['REQUEST_URI'],1)=="actions/retourmanuel") echo "active"; ?>">
						<a href="/actions/retourmanuel"><i class="fa fa-edit"></i> <span class="nav-label">Retour Manuel</span></a>
					</li>
				<?php } ?>
				
				<?php if (in_array("actions/stat", $listAxx)) { 
				?>
					<li class="<?php if (substr($_SERVER['REQUEST_URI'],1)=="actions/stat") echo "active"; ?>">
						<a href="/actions/stat"><i class="fa fa-pie-chart"></i> <span class="nav-label">Statistiques</span></a>
					</li>
				<?php } ?>
				
				FIN Elements du menu de l'application des retours Decatlhon -->
            </ul>
        </div>
    </nav>

	<div id="page-wrapper" class="gray-bg">
	<div class="row border-bottom">
	<nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
	<div class="navbar-header">
		<a class="navbar-minimalize minimalize-styl-2 btn btn-primary "><i class="fa fa-bars"></i> </a>
	</div>
		<ul class="nav navbar-top-links navbar-right">
			<li>
				<span class="m-r-sm text-muted welcome-message">Bienvenue, visiteur inconnu!</span>
			</li>

			<li>
				<a href="/actions/logout"><i class="fa fa-sign-out"></i> Déconnexion </a>
			</li>
		</ul>

	</nav>
	</div>
