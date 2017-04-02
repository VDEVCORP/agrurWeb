-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Dim 02 Avril 2017 à 22:18
-- Version du serveur :  5.7.9
-- Version de PHP :  5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `agrurproducer`
--

-- --------------------------------------------------------

--
-- Structure de la table `calibre`
--

DROP TABLE IF EXISTS `calibre`;
CREATE TABLE IF NOT EXISTS `calibre` (
  `idCalibre` int(11) NOT NULL AUTO_INCREMENT,
  `intervalle` varchar(25) NOT NULL,
  PRIMARY KEY (`idCalibre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `calibre`
--

INSERT INTO `calibre` (`idCalibre`, `intervalle`) VALUES
(1, '< 24mm'),
(2, '{24, 28}mm'),
(3, '{24, 28}mm'),
(4, '{30, 32}mm'),
(5, '{32, 34}mm'),
(6, '> 34mm');

-- --------------------------------------------------------

--
-- Structure de la table `certifdelivree`
--

DROP TABLE IF EXISTS `certifdelivree`;
CREATE TABLE IF NOT EXISTS `certifdelivree` (
  `dateCertification` date DEFAULT NULL,
  `idCertification` int(11) NOT NULL,
  `idProducteur` int(11) NOT NULL,
  PRIMARY KEY (`idCertification`,`idProducteur`),
  KEY `FK_certifDelivree_idProducteur` (`idProducteur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `certifdelivree`
--

INSERT INTO `certifdelivree` (`dateCertification`, `idCertification`, `idProducteur`) VALUES
('2016-11-10', 10, 14),
('2017-03-24', 13, 13),
('2016-07-14', 15, 13);

-- --------------------------------------------------------

--
-- Structure de la table `certification`
--

DROP TABLE IF EXISTS `certification`;
CREATE TABLE IF NOT EXISTS `certification` (
  `idCertification` int(11) NOT NULL AUTO_INCREMENT,
  `libelleCertification` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idCertification`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `certification`
--

INSERT INTO `certification` (`idCertification`, `libelleCertification`) VALUES
(8, 'AREA'),
(10, 'CRITTERRES'),
(11, 'Qualenvi Lauréat'),
(12, 'Terr''Avenir'),
(13, 'AB (Agriculture Biologique)'),
(14, 'IGP (Indication Géographique Protégée)'),
(15, 'GLOBALG.A.P.'),
(16, 'Label Rouge');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `idClient` int(11) NOT NULL AUTO_INCREMENT,
  `nomClient` varchar(255) DEFAULT NULL,
  `nomRepresentant` varchar(255) DEFAULT NULL,
  `prenomRepresentant` varchar(255) NOT NULL,
  `telephone` varchar(10) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `codePostal` int(11) DEFAULT NULL,
  `fk_id_user` int(11) NOT NULL,
  `last_edit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idClient`),
  KEY `fk_id_user` (`fk_id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`idClient`, `nomClient`, `nomRepresentant`, `prenomRepresentant`, `telephone`, `adresse`, `ville`, `codePostal`, `fk_id_user`, `last_edit`) VALUES
(9, 'Ferrero', 'Vainere', 'Dimitri', '0647586914', '18 Rue Jacques Monod', 'Mont-Saint-Aignan', 76130, 28, '2017-04-02 09:40:07'),
(10, 'Paul', 'Descamps', 'Marion', '0652637485', '344, avenue de la Marne', 'Marcq-en-Baroeul', 59700, 29, '2017-04-02 09:40:07'),
(11, 'La Saladerie', 'Dubois', 'Mathilde', '0652859674', '98 avenue de la République', 'Bordeaux', 33800, 30, '2017-04-02 09:40:07'),
(12, 'Carrefour Brive-la-Gaillarde', 'Cohen', 'Alexandre', '675153595', '56 rue Pierre Chaumeil', 'Brive-la-Gaillarde', 19100, 32, '2017-04-02 09:40:07');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `numeroCommande` int(11) NOT NULL AUTO_INCREMENT,
  `dateDEnvoi` date DEFAULT NULL,
  `nbrUniteCommandee` int(11) DEFAULT NULL,
  `dateConditionnement` date DEFAULT NULL,
  `idClient` int(11) NOT NULL,
  PRIMARY KEY (`numeroCommande`),
  KEY `FK_COMMANDE_idClient` (`idClient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `commune`
--

DROP TABLE IF EXISTS `commune`;
CREATE TABLE IF NOT EXISTS `commune` (
  `idCommune` int(11) NOT NULL AUTO_INCREMENT,
  `codePostal` int(11) DEFAULT NULL,
  `nomCommune` varchar(50) DEFAULT NULL,
  `aocCommune` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idCommune`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `commune`
--

INSERT INTO `commune` (`idCommune`, `codePostal`, `nomCommune`, `aocCommune`) VALUES
(6, 24350, 'Bussac', 1),
(7, 24750, 'Cornille', 0),
(8, 24380, 'Cendrieux', 1),
(9, 24140, 'Maurens', 0),
(10, 46150, 'Lherm', 1),
(11, 46170, 'Cézac', 0),
(12, 46210, 'Gorses', 0),
(13, 46130, 'Loubressac', 1),
(14, 19800, 'Sarran', 1),
(15, 19800, 'Meyrignac-l''Eglise', 1),
(16, 19190, 'Le Chastang', 0),
(17, 19160, 'Neuvic', 1),
(18, 16120, 'Bassac', 0),
(19, 16170, 'Bonneville', 0),
(20, 16200, 'Houlette', 0),
(21, 16270, 'Nieuil', 1);

-- --------------------------------------------------------

--
-- Structure de la table `conditionnement`
--

DROP TABLE IF EXISTS `conditionnement`;
CREATE TABLE IF NOT EXISTS `conditionnement` (
  `idConditionnement` int(11) NOT NULL AUTO_INCREMENT,
  `typeConditionnement` varchar(25) DEFAULT NULL,
  `poidsConditionnee` int(11) DEFAULT NULL,
  `idLot` int(11) DEFAULT NULL,
  PRIMARY KEY (`idConditionnement`),
  KEY `FK_CONDITIONNEMENT_idLot` (`idLot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `detailcommande`
--

DROP TABLE IF EXISTS `detailcommande`;
CREATE TABLE IF NOT EXISTS `detailcommande` (
  `quantiteCommande` int(11) DEFAULT NULL,
  `idConditionnement` int(11) NOT NULL,
  `numeroCommande` int(11) NOT NULL,
  PRIMARY KEY (`idConditionnement`,`numeroCommande`),
  KEY `FK_detailCommande_numeroCommande` (`numeroCommande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

DROP TABLE IF EXISTS `livraison`;
CREATE TABLE IF NOT EXISTS `livraison` (
  `idLivraison` int(11) NOT NULL AUTO_INCREMENT,
  `dateLivraison` date DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `idVerger` int(11) NOT NULL,
  `idTypeProduit` int(11) DEFAULT NULL,
  PRIMARY KEY (`idLivraison`),
  KEY `FK_LIVRAISON_idVerger` (`idVerger`),
  KEY `FK_LIVRAISON_idTypeProduit` (`idTypeProduit`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `livraison`
--

INSERT INTO `livraison` (`idLivraison`, `dateLivraison`, `quantite`, `idVerger`, `idTypeProduit`) VALUES
(2, '2017-04-01', 400, 6, 2),
(3, '2017-02-17', 200, 4, 1),
(4, '2017-03-24', 500, 8, 2);

-- --------------------------------------------------------

--
-- Structure de la table `lot`
--

DROP TABLE IF EXISTS `lot`;
CREATE TABLE IF NOT EXISTS `lot` (
  `idLot` int(11) NOT NULL AUTO_INCREMENT,
  `reference` varchar(255) NOT NULL,
  `idCalibre` int(11) DEFAULT NULL,
  `quantiteLot` int(11) NOT NULL,
  `idLivraison` int(11) NOT NULL,
  PRIMARY KEY (`idLot`),
  KEY `FK_LOT_idLivraison` (`idLivraison`),
  KEY `idCalibre` (`idCalibre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `lot`
--

INSERT INTO `lot` (`idLot`, `reference`, `idCalibre`, `quantiteLot`, `idLivraison`) VALUES
(1, 'FERNOR2428S', 3, 100, 2),
(2, 'NDGR3032S1', 4, 250, 4),
(3, 'NDGR3234S2', 5, 250, 4),
(4, '1FRANQM241', 1, 100, 3);

-- --------------------------------------------------------

--
-- Structure de la table `page`
--

DROP TABLE IF EXISTS `page`;
CREATE TABLE IF NOT EXISTS `page` (
  `id_page` int(11) NOT NULL AUTO_INCREMENT,
  `url_page` varchar(100) NOT NULL,
  `name_page` varchar(100) NOT NULL,
  `description_page` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_page`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `page`
--

INSERT INTO `page` (`id_page`, `url_page`, `name_page`, `description_page`) VALUES
(1, 'producteur/home', 'Informations Personnelles', 'Espace du producteur'),
(2, 'admin/home', 'Vue générale', 'Espace de l''administrateur'),
(3, 'client/home', 'Accueil', 'Espace du client'),
(4, 'admin/inscription', 'Inscription', 'Permet d''inscrire dans l''application des producteurs ou des clients'),
(5, 'admin/utilisateurs', 'Gestion des Utilisateurs', 'Liste et outils de gestion relatifs aux différents utilisateurs '),
(6, 'admin/communes', 'Communes', 'Liste et ajouts des communes'),
(7, 'admin/varietes', 'Variétés de noix', 'Liste et ajouts des variétés de noix'),
(9, 'producteur/vergers', 'Mes vergers', 'Administration pour les producteurs de leurs vergers et toutes les informations associées'),
(10, 'admin/certifications', 'Certifications', 'Liste et ajout des certifications reconnu par la société'),
(11, 'admin/livraisons', 'Livraisons', 'Liste et ajout des livraisons de fournisseurs'),
(12, 'admin/lots', 'Administration des lots', 'Liste et ajout des lots de noix.'),
(13, 'producteur/profil', 'Mon profil', 'Espace profil du producteur; vu et possibilité de modifier ses informations. Liste des différentes certifications attribuées'),
(14, 'producteur/contact', 'Contact Administrateur', 'Page de prise de contact avec l''administrateur pour un producteur');

-- --------------------------------------------------------

--
-- Structure de la table `producteur`
--

DROP TABLE IF EXISTS `producteur`;
CREATE TABLE IF NOT EXISTS `producteur` (
  `idProducteur` int(11) NOT NULL AUTO_INCREMENT,
  `nomSociete` varchar(255) DEFAULT NULL,
  `nomResponsable` varchar(255) DEFAULT NULL,
  `prenomResponsable` varchar(255) DEFAULT NULL,
  `telephone` varchar(10) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `codePostal` int(11) DEFAULT NULL,
  `adherent` tinyint(1) DEFAULT NULL,
  `fk_id_user` int(11) DEFAULT NULL,
  `last_edit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`idProducteur`),
  KEY `fk_id_user` (`fk_id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `producteur`
--

INSERT INTO `producteur` (`idProducteur`, `nomSociete`, `nomResponsable`, `prenomResponsable`, `telephone`, `adresse`, `ville`, `codePostal`, `adherent`, `fk_id_user`, `last_edit`) VALUES
(13, 'Temp Society', 'Lefranc', 'Jacques', '0614253647', '13 rue des Resistantes', 'Cubjac', 24640, 1, 24, '2017-04-02 10:42:44'),
(14, 'La nouvelle Noix', 'Dentleux', 'Benjamin', '0658691425', '9 impasse du Dr Manville', 'Saint-Denis-Catus', 46150, 0, 25, '2017-04-02 09:38:32'),
(15, '', 'Guillotain', 'Daniel', '0625364758', '188 rue des près', 'Chaumeil', 19390, 1, 26, '2017-04-02 09:38:32'),
(16, '', 'Martin', 'Jean-Charles', '0669142536', '81 route de Chazelles', 'La Rochefoucauld', 16110, 0, 27, '2017-04-02 09:38:32');

-- --------------------------------------------------------

--
-- Structure de la table `typeproduit`
--

DROP TABLE IF EXISTS `typeproduit`;
CREATE TABLE IF NOT EXISTS `typeproduit` (
  `idTypeProduit` int(11) NOT NULL AUTO_INCREMENT,
  `libelleTypeProduit` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idTypeProduit`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `typeproduit`
--

INSERT INTO `typeproduit` (`idTypeProduit`, `libelleTypeProduit`) VALUES
(1, 'Fraîche'),
(2, 'Sèche');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_user`),
  KEY `rank` (`rank`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id_user`, `rank`, `email`, `valid`) VALUES
(1, 1, 'admin', 1),
(24, 2, 'prod1@a.fr', 1),
(25, 2, 'prod2@a.fr', 1),
(26, 2, 'prod3@a.fr', 1),
(27, 2, 'prod4@a.fr', 1),
(28, 3, 'cli1@a.fr', 1),
(29, 3, 'cli2@a.fr', 1),
(30, 3, 'cli3@a.fr', 1),
(31, 3, 'cli4@a.fr', 1),
(32, 3, 'cli4@a.fr', 1);

-- --------------------------------------------------------

--
-- Structure de la table `users_access`
--

DROP TABLE IF EXISTS `users_access`;
CREATE TABLE IF NOT EXISTS `users_access` (
  `users_access_id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_rank` int(11) NOT NULL,
  `fk_id_page` int(11) NOT NULL,
  PRIMARY KEY (`users_access_id`),
  KEY `fk_id_page` (`fk_id_page`),
  KEY `fk_id_rank` (`fk_id_rank`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `users_access`
--

INSERT INTO `users_access` (`users_access_id`, `fk_id_rank`, `fk_id_page`) VALUES
(6, 2, 1),
(7, 1, 2),
(8, 3, 3),
(9, 1, 4),
(10, 1, 5),
(11, 1, 6),
(12, 1, 7),
(14, 2, 9),
(15, 1, 10),
(16, 1, 11),
(17, 1, 12),
(18, 2, 13),
(19, 2, 14);

-- --------------------------------------------------------

--
-- Structure de la table `users_login`
--

DROP TABLE IF EXISTS `users_login`;
CREATE TABLE IF NOT EXISTS `users_login` (
  `id_login` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_user` int(11) NOT NULL,
  `password_user` varchar(255) NOT NULL,
  PRIMARY KEY (`id_login`),
  KEY `fk_id_user` (`fk_id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `users_login`
--

INSERT INTO `users_login` (`id_login`, `fk_id_user`, `password_user`) VALUES
(1, 1, 'd033e22ae348aeb5660fc2140aec35850c4da997'),
(24, 24, '2360932b6c99f7e80a932490be5db0c5dfa6c33f'),
(25, 25, '0f986b9ca0969d40b2ea7b844b98c7f39851b04c'),
(26, 26, 'cd18459489b7aec601a64eb6f8be7659cf8ff5be'),
(27, 27, '3faec58fc41d51b12ec045268f74f4c617a5ffea'),
(28, 28, 'c3b95e79a56e81177c67983303995204ea9c4a8d'),
(29, 29, 'ba72f2e59c95250846330c9512525e78f37916db'),
(30, 30, '15a7c5c8ba7f889c4105eacb4afeecc13f8b38e3'),
(31, 31, 'd461352a549dd9b5f3c98b6f49682c343f51eb0e'),
(32, 32, 'd461352a549dd9b5f3c98b6f49682c343f51eb0e');

-- --------------------------------------------------------

--
-- Structure de la table `users_rank`
--

DROP TABLE IF EXISTS `users_rank`;
CREATE TABLE IF NOT EXISTS `users_rank` (
  `id_rank` int(11) NOT NULL AUTO_INCREMENT,
  `name_rank` varchar(255) NOT NULL,
  PRIMARY KEY (`id_rank`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `users_rank`
--

INSERT INTO `users_rank` (`id_rank`, `name_rank`) VALUES
(1, 'admin'),
(2, 'producer'),
(3, 'customer');

-- --------------------------------------------------------

--
-- Structure de la table `variete`
--

DROP TABLE IF EXISTS `variete`;
CREATE TABLE IF NOT EXISTS `variete` (
  `idVariete` int(11) NOT NULL AUTO_INCREMENT,
  `nomVariete` varchar(25) DEFAULT NULL,
  `aocVariete` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idVariete`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `variete`
--

INSERT INTO `variete` (`idVariete`, `nomVariete`, `aocVariete`) VALUES
(8, 'La Marbot', 0),
(9, 'La Grandjean', 0),
(10, 'La Corne', 0),
(11, 'Noix du Périgord', 1),
(12, 'La Lara', 0),
(13, 'La Franquette', 0),
(14, 'La Parisienne', 0),
(15, 'Noix de Grenoble', 1),
(16, 'La Fernor cov', 0);

-- --------------------------------------------------------

--
-- Structure de la table `verger`
--

DROP TABLE IF EXISTS `verger`;
CREATE TABLE IF NOT EXISTS `verger` (
  `idVerger` int(11) NOT NULL AUTO_INCREMENT,
  `nomVerger` varchar(255) NOT NULL,
  `superficie` int(11) DEFAULT NULL,
  `nbrArbreParHect` int(11) DEFAULT NULL,
  `idProducteur` int(11) DEFAULT NULL,
  `idVariete` int(11) NOT NULL,
  `idCommune` int(11) DEFAULT NULL,
  `last_edit` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idVerger`),
  KEY `FK_VERGER_idProducteur` (`idProducteur`),
  KEY `FK_VERGER_idVariete` (`idVariete`),
  KEY `FK_VERGER_idCommune` (`idCommune`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `verger`
--

INSERT INTO `verger` (`idVerger`, `nomVerger`, `superficie`, `nbrArbreParHect`, `idProducteur`, `idVariete`, `idCommune`, `last_edit`) VALUES
(4, '1FRANQ1MAUR', 4, 100, 13, 13, 9, '2017-04-01 23:45:58'),
(5, '1CORN1BONN', 6, 70, 13, 10, 19, '2017-04-02 19:28:32'),
(6, '1FERNOR1NIEU', 2, 120, 13, 16, 21, '2017-04-02 20:27:20'),
(7, '1PERI2NIEU', 5, 90, 13, 11, 21, '2017-04-02 20:28:46'),
(8, '198MEENdG1', 20, 125, 14, 15, 15, '2017-04-02 20:44:00'),
(9, '191LCSGNdP1', 15, 100, 14, 11, 16, '2017-04-02 20:45:32'),
(10, '162HOULGJ2', 5, 60, 14, 9, 20, '2017-04-02 20:46:51'),
(11, '162HOULGJ1', 7, 65, 14, 9, 20, '2017-04-02 20:47:17');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `certifdelivree`
--
ALTER TABLE `certifdelivree`
  ADD CONSTRAINT `FK_certifDelivree_idCertification` FOREIGN KEY (`idCertification`) REFERENCES `certification` (`idCertification`),
  ADD CONSTRAINT `FK_certifDelivree_idProducteur` FOREIGN KEY (`idProducteur`) REFERENCES `producteur` (`idProducteur`);

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_id_user_client` FOREIGN KEY (`fk_id_user`) REFERENCES `users` (`id_user`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FK_COMMANDE_idClient` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`);

--
-- Contraintes pour la table `conditionnement`
--
ALTER TABLE `conditionnement`
  ADD CONSTRAINT `FK_CONDITIONNEMENT_idLot` FOREIGN KEY (`idLot`) REFERENCES `lot` (`idLot`);

--
-- Contraintes pour la table `detailcommande`
--
ALTER TABLE `detailcommande`
  ADD CONSTRAINT `FK_detailCommande_idConditionnement` FOREIGN KEY (`idConditionnement`) REFERENCES `conditionnement` (`idConditionnement`),
  ADD CONSTRAINT `FK_detailCommande_numeroCommande` FOREIGN KEY (`numeroCommande`) REFERENCES `commande` (`numeroCommande`);

--
-- Contraintes pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD CONSTRAINT `FK_LIVRAISON_idTypeProduit` FOREIGN KEY (`idTypeProduit`) REFERENCES `typeproduit` (`idTypeProduit`),
  ADD CONSTRAINT `FK_LIVRAISON_idVerger` FOREIGN KEY (`idVerger`) REFERENCES `verger` (`idVerger`);

--
-- Contraintes pour la table `lot`
--
ALTER TABLE `lot`
  ADD CONSTRAINT `FK_LOT_idLivraison` FOREIGN KEY (`idLivraison`) REFERENCES `livraison` (`idLivraison`),
  ADD CONSTRAINT `Fk_lot_calibre_id` FOREIGN KEY (`idCalibre`) REFERENCES `calibre` (`idCalibre`);

--
-- Contraintes pour la table `producteur`
--
ALTER TABLE `producteur`
  ADD CONSTRAINT `fk_id_user_producteur` FOREIGN KEY (`fk_id_user`) REFERENCES `users` (`id_user`);

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_id_rank_users` FOREIGN KEY (`rank`) REFERENCES `users_rank` (`id_rank`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `users_access`
--
ALTER TABLE `users_access`
  ADD CONSTRAINT `fk_id_page_user_access` FOREIGN KEY (`fk_id_page`) REFERENCES `page` (`id_page`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_rank_users_access` FOREIGN KEY (`fk_id_rank`) REFERENCES `users_rank` (`id_rank`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `users_login`
--
ALTER TABLE `users_login`
  ADD CONSTRAINT `fk_id_user_users_login` FOREIGN KEY (`fk_id_user`) REFERENCES `users` (`id_user`);

--
-- Contraintes pour la table `verger`
--
ALTER TABLE `verger`
  ADD CONSTRAINT `FK_VERGER_idCommune` FOREIGN KEY (`idCommune`) REFERENCES `commune` (`idCommune`),
  ADD CONSTRAINT `FK_VERGER_idProducteur` FOREIGN KEY (`idProducteur`) REFERENCES `producteur` (`idProducteur`),
  ADD CONSTRAINT `FK_VERGER_idVariete` FOREIGN KEY (`idVariete`) REFERENCES `variete` (`idVariete`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
