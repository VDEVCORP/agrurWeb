<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	
	<!--[if lt IE 9]>
	<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
	<![endif]-->	

    <title>AGRUR |   <?php foreach($listAxx as $page){
                                if($page['url_page'] == substr($_SERVER['REQUEST_URI'], 1)){
                                    echo $page['name_page'];
                                }
                            }
                        ?>
    </title>

    <link href="/includes/css/bootstrap.min.css" rel="stylesheet">
    <link href="/includes/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="/includes/css/style.css" rel="stylesheet">
    <link href="/includes/css/animate.css" rel="stylesheet">

    <link href="/includes/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
</head>

<body>

    <div id="wrapper">

    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav metismenu" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element"> <span>
                            <img alt="agrur" width="180" src="/includes/images/Agrur_logo.png" /></span>
                    </div>
                    <div class="logo-element">
                       <img alt="agrur_mini" width="48" src="/includes/images/Agrur_logo.png" />
                    </div>
                <li>
                    <a href="<?php
                                switch($_SESSION['user']['rank']){
                                    case('admin'):
                                        echo '/admin/home';
                                        break;
                                    case('producer'):
                                        echo '/producteur/home';
                                        break;
                                    case('customer'):
                                        echo '/client/home';
                                        break;
                                }
                                ?>"><i class="fa fa-home"></i><span class="nav-label">Accueil</span></a>
                </li>

                <!-- MENU LINKS ADMIN -->
                
                <?php foreach($listAxx as $page){if($page['url_page'] == "admin/commandes"){ ?>
                    <li class="<?php if (substr($_SERVER['REQUEST_URI'],1)=='admin/commandes') echo 'active'; ?>">
                        <a href="/admin/commandes"><i class="fa fa-tasks"></i><span class="nav-label">Commandes</span></a>
                    </li>
                <?php }} ?>

                <?php foreach($listAxx as $page){if($page['url_page'] == "admin/livraisons"){ ?>
                    <li class="<?php if (substr($_SERVER['REQUEST_URI'],1)=='admin/livraisons') echo 'active'; ?>">
                        <a href="/admin/livraisons"><i class="fa fa-truck"></i><span class="nav-label">Livraisons</span></a>
                    </li>
                <?php }} ?>

                <?php foreach($listAxx as $page){if($page['url_page'] == "admin/lots"){ ?>
                    <li class="<?php if (substr($_SERVER['REQUEST_URI'],1)=='admin/lots') echo 'active'; ?>">
                        <a href="/admin/lots"><i class="fa fa-barcode"></i><span class="nav-label">Lots</span></a>
                    </li>
                <?php }} ?>
                
                <?php foreach($listAxx as $page){if($page['url_page'] == "admin/conditionnement"){ ?>
                    <li class="<?php if (substr($_SERVER['REQUEST_URI'],1)=='admin/conditionnement') echo 'active'; ?>">
                        <a href="/admin/conditionnement"><i class="fa fa-dropbox"></i><span class="nav-label">Conditionnement</span></a>
                    </li>
                <?php }} ?>

                <?php foreach($listAxx as $page){if($page['url_page'] == "admin/utilisateurs"){ ?>
                    <li class="<?php if (substr($_SERVER['REQUEST_URI'],1)=='admin/utilisateurs') echo 'active'; ?>">
                        <a href="/admin/utilisateurs"><i class="fa fa-users"></i><span class="nav-label">Utilisateurs</span></a>
                    </li>
                <?php }} ?>

                <?php foreach($listAxx as $page){if($page['url_page'] == "admin/inscription"){ ?>
                    <li class="<?php if (substr($_SERVER['REQUEST_URI'],1)=='admin/inscription') echo 'active'; ?>">
                        <a href="/admin/inscription"><i class="fa fa-plus"></i><span class="nav-label">Inscription</span></a>
                    </li>
                <?php }} ?>

                <?php foreach($listAxx as $page){if($page['url_page'] == "admin/certifications"){ ?>
                    <li class="<?php if (substr($_SERVER['REQUEST_URI'],1)=='admin/certifications') echo 'active'; ?>">
                        <a href="/admin/certifications"><i class="fa fa-certificate"></i><span class="nav-label">Certifications</span></a>
                    </li>
                <?php }} ?>

                <?php foreach($listAxx as $page){if($page['url_page'] == "admin/communes"){ ?>
                    <li class="<?php if (substr($_SERVER['REQUEST_URI'],1)=='admin/communes') echo 'active'; ?>">
                        <a href="/admin/communes"><i class="fa fa-road"></i><span class="nav-label">Communes</span></a>
                    </li>
                <?php }} ?>

                <?php foreach($listAxx as $page){if($page['url_page'] == "admin/varietes"){ ?>
                    <li class="<?php if (substr($_SERVER['REQUEST_URI'],1)=='admin/varietes') echo 'active'; ?>">
                        <a href="/admin/varietes"><i class="fa fa-leaf"></i><span class="nav-label">Varietes</span></a>
                    </li>
                <?php }} ?>

                <!-- MENU LINKS PRODUCTEUR -->
                <?php foreach($listAxx as $page){if($page['url_page'] == "producteur/profil"){ ?>
                    <li class="<?php if (substr($_SERVER['REQUEST_URI'],1)=='producteur/profil') echo 'active'; ?>">
                        <a href="/producteur/profil"><i class="fa fa-user"></i><span class="nav-label">Mon profil</span></a>
                    </li>
                <?php }} ?>

                <?php foreach($listAxx as $page){if($page['url_page'] == "producteur/vergers"){ ?>
                    <li class="<?php if (substr($_SERVER['REQUEST_URI'],1)=='producteur/vergers') echo 'active'; ?>">
                        <a href="/producteur/vergers"><i class="fa fa-tree"></i><span class="nav-label">Mes Vergers</span></a>
                    </li>
                <?php }} ?>

                <?php foreach($listAxx as $page){if($page['url_page'] == "producteur/contact"){ ?>
                    <li class="<?php if (substr($_SERVER['REQUEST_URI'],1)=='producteur/contact') echo 'active'; ?>">
                        <a href="/producteur/contact"><i class="fa fa-pencil-square-o"></i><span class="nav-label">Contact</span></a>
                    </li>
                <?php }} ?>

                <!-- MENU LINKS CLIENT -->

                <?php foreach($listAxx as $page){if($page['url_page'] == "client/commandes"){ ?>
                    <li class="<?php if (substr($_SERVER['REQUEST_URI'],1)=='client/commandes') echo 'active'; ?>">
                        <a href="/client/commandes"><i class="fa fa-shopping-cart"></i><span class="nav-label">Ma commande</span></a>
                    </li>
                <?php }} ?>

                <?php foreach($listAxx as $page){if($page['url_page'] == "client/profil"){ ?>
                    <li class="<?php if (substr($_SERVER['REQUEST_URI'],1)=='client/profil') echo 'active'; ?>">
                        <a href="/client/profil"><i class="fa fa-user"></i><span class="nav-label">Mon profil</span></a>
                    </li>
                <?php }} ?>

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
				        <span class="m-r-sm text-muted welcome-message">Bienvenue sur l'intranet de la coopérative agricole AGRUR!</span>
			        </li>

			        <li>
				        <a href="/portail/logout"><i class="fa fa-sign-out"></i><span class="nav-label"> Déconnexion </span></a>
			        </li>
		        </ul>
	        </nav>
	    </div>

        <div class="row wrapper border-bottom white-bg page-heading">
        <!-- Les traitements PHP qui suivent sont très moche et devront donner lieu à Refactor 
                - Ces traitements doivent être déplacé dans le controller parent de tous les controllers
                - Une variable d'infos de page est à imaginer(?)
        -->
        <?php
            $url_access = substr($_SERVER['REQUEST_URI'],1);
            if(substr_count($url_access, "/") > 1){
                /*Expression retournant les deux premiers paramètres de l'URL si un troisième
                est passé pour ne pas froisser l'écriture du chemin de la page => à débugger*/
                $url_access = str_replace(strrchr(substr($_SERVER['REQUEST_URI'],1), "/"), "", substr($_SERVER['REQUEST_URI'],1));
            } 
            foreach($listAxx as $page){
                if($page['url_page'] == $url_access){ 
                    $treeInfs[] = current(explode("/", $page['url_page']));
                    $treeInfs[] = $page['name_page'];
                }
            }
        ?>
            <div class="col-lg-10">
                <h2><?php echo ucfirst($treeInfs[0]) ?></h2>
                    <ol class="breadcrumb">
                        <?php
                            for($i = 0; $i < count($treeInfs); $i++){
                                $echo = '<li>';
                                if(($i +1) == count($treeInfs)){
                                    $echo .= '<strong>' . ucfirst($treeInfs[$i]) . '</strong>';
                                } else {
                                    $echo .= ucfirst($treeInfs[$i]) . '</li>';
                                }
                                echo $echo;
                            }
                        ?>
                    </ol>
            </div>
            <div class="col-lg-2"></div>
        </div>

        <div class="wrapper wrapper-content animated fadeInRight"> <!-- Fermée dans le footer -->

            <?php if(isset($success)){ ?>
                <div class="alert alert-success alert-dismissable">
                    <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                    <?= $success ?>
                </div>
            <?php } ?>

            <?php if(isset($error)){ ?>
                <div class="alert alert-danger alert-dismissable">
                    <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                    <?= $error ?>
                </div>
            <?php } ?>