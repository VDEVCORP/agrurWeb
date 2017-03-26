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
                                    case('producteur'):
                                        echo '/producteur/home';
                                        break;
                                    case('client'):
                                        echo '/client/home';
                                        break;
                                }
                                ?>"><i class="fa fa-home"></i><span class="nav-label">Accueil</span></a>
                </li>

                <!-- MENU LINKS ADMIN -->
                <?php foreach($listAxx as $page){if($page['url_page'] == "admin/inscription"){ ?>
                    <li class="<?php if (substr($_SERVER['REQUEST_URI'],1)=='admin/inscription') echo 'active'; ?>">
                        <a href="/admin/inscription"><i class="fa fa-plus"></i><span class="nav-label">Inscription</span></a>
                    </li>
                <?php }} ?>

                <?php foreach($listAxx as $page){if($page['url_page'] == "admin/utilisateurs"){ ?>
                    <li class="<?php if (substr($_SERVER['REQUEST_URI'],1)=='admin/utilisateurs') echo 'active'; ?>">
                        <a href="/admin/utilisateurs"><i class="fa fa-users"></i><span class="nav-label">Utilisateurs</span></a>
                    </li>
                <?php }} ?>

                <?php foreach($listAxx as $page){if($page['url_page'] == "admin/communes"){ ?>
                    <li class="<?php if (substr($_SERVER['REQUEST_URI'],1)=='admin/communes') echo 'active'; ?>">
                        <a href="/admin/communes"><i class="fa fa-road"></i><span class="nav-label">Communes</span></a>
                    </li>
                <?php }} ?>

                <?php foreach($listAxx as $page){if($page['url_page'] == "admin/varietes"){ ?>
                    <li class="<?php if (substr($_SERVER['REQUEST_URI'],1)=='admin/varietes') echo 'active'; ?>">
                        <a href="/admin/varietes"><i class="fa fa-quote-right"></i><span class="nav-label">Varietes</span></a>
                    </li>
                <?php }} ?>

                <?php foreach($listAxx as $page){if($page['url_page'] == "admin/vergers"){ ?>
                    <li class="<?php if (substr($_SERVER['REQUEST_URI'],1)=='admin/vergers') echo 'active'; ?>">
                        <a href="/admin/vergers"><i class="fa fa-tree"></i><span class="nav-label">Vergers</span></a>
                    </li>
                <?php }} ?>

                <?php foreach($listAxx as $page){if($page['url_page'] == "admin/commandes"){ ?>
                    <li class="<?php if (substr($_SERVER['REQUEST_URI'],1)=='admin/commandes') echo 'active'; ?>">
                        <a href="/admin/commandes"><i class="fa fa-truck"></i><span class="nav-label">Commandes</span></a>
                    </li>
                <?php }} ?>


                <!-- MENU LINKS PRODUCTEUR -->
                <?php foreach($listAxx as $page){if($page['url_page'] == "regular/exempleRegular"){ ?>
                    <li class="<?php if (substr($_SERVER['REQUEST_URI'],1)=='regular/exempleRegular') echo 'active'; ?>">
                        <a href="/regular/exempleRegular"><i class="fa fa-cubes"></i><span class="nav-label">Lien autorisé Regular</span></a>
                    </li>
                <?php }} ?>

                <!-- MENU LINKS CLIENT -->

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
				        <span class="m-r-sm text-muted welcome-message">Bienvenue, visiteur inconnu</span>
			        </li>

			        <li>
				        <a href="/portail/logout"><i class="fa fa-sign-out"></i><span class="nav-label"> Déconnexion </span></a>
			        </li>
		        </ul>
	        </nav>
	    </div>

        <div class="row wrapper border-bottom white-bg page-heading">
        <!-- Les traitements PHP qui suivent sont très moche et devront donner lieu à Refactor 
                - Ces traitements doivent être déplacé dans le controller parent
                - Une variable d'infos de page est à imaginer'
        -->
        <?php
            foreach($listAxx as $page){
                if($page['url_page'] == substr($_SERVER['REQUEST_URI'],1)){ 
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