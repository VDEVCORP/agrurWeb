-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 20 Avril 2017 à 10:15
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

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

CREATE TABLE `calibre` (
  `idCalibre` int(11) NOT NULL,
  `intervalle` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `calibre`
--

INSERT INTO `calibre` (`idCalibre`, `intervalle`) VALUES
(1, '< 24mm'),
(2, '{24, 28}mm'),
(3, '{28, 30}mm'),
(4, '{30, 32}mm'),
(5, '{32, 34}mm'),
(6, '> 34mm');

-- --------------------------------------------------------

--
-- Structure de la table `certifdelivree`
--

CREATE TABLE `certifdelivree` (
  `dateCertification` date DEFAULT NULL,
  `idCertification` int(11) NOT NULL,
  `idProducteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `certifdelivree`
--

INSERT INTO `certifdelivree` (`dateCertification`, `idCertification`, `idProducteur`) VALUES
('2017-04-01', 10, 13),
('2016-11-10', 10, 14),
('2017-03-24', 13, 13),
('2016-07-14', 15, 13);

-- --------------------------------------------------------

--
-- Structure de la table `certification`
--

CREATE TABLE `certification` (
  `idCertification` int(11) NOT NULL,
  `libelleCertification` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `certification`
--

INSERT INTO `certification` (`idCertification`, `libelleCertification`) VALUES
(8, 'AREA'),
(10, 'CRITTERRES'),
(11, 'Qualenvi Lauréat'),
(12, 'Terr\'Avenir'),
(13, 'AB (Agriculture Biologique)'),
(14, 'IGP (Indication Géographique Protégée)'),
(15, 'GLOBALG.A.P.'),
(16, 'Label Rouge');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `idClient` int(11) NOT NULL,
  `nomClient` varchar(255) DEFAULT NULL,
  `nomRepresentant` varchar(255) DEFAULT NULL,
  `prenomRepresentant` varchar(255) NOT NULL,
  `telephone` varchar(10) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `codePostal` int(11) DEFAULT NULL,
  `fk_id_user` int(11) NOT NULL,
  `last_edit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`idClient`, `nomClient`, `nomRepresentant`, `prenomRepresentant`, `telephone`, `adresse`, `ville`, `codePostal`, `fk_id_user`, `last_edit`) VALUES
(9, 'Ferrero', 'Vainere', 'Dimitri', '0647586914', '18 Rue Jacques Monod', 'Mont-Saint-Aignan', 76130, 28, '2017-04-03 08:25:13'),
(10, 'Paul', 'Descamps', 'Marion', '0652637485', '344, avenue de la Marne', 'Marcq-en-Baroeul', 59700, 29, '2017-04-02 09:41:40'),
(11, 'La Saladerie', 'Dubois', 'Mathilde', '0652859674', '98 avenue de la République', 'Bordeaux', 33800, 30, '2017-04-02 09:39:31'),
(12, 'Carrefour Brive-la-Gaillarde', 'Cohen', 'Alexandre', '675153595', '56 rue Pierre Chaumeil', 'Brive-la-Gaillarde', 19100, 32, '2017-04-02 09:40:07');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `idCommande` int(11) NOT NULL,
  `refCommande` varchar(255) NOT NULL,
  `expedition` timestamp NULL DEFAULT NULL,
  `preparation` timestamp NULL DEFAULT NULL,
  `soumission` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idStatus` int(11) NOT NULL DEFAULT '1',
  `idClient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `commande`
--

INSERT INTO `commande` (`idCommande`, `refCommande`, `expedition`, `preparation`, `soumission`, `idStatus`, `idClient`) VALUES
(20, 'c72030afee', NULL, '2017-04-17 12:54:59', '2017-04-17 08:23:53', 2, 9),
(21, '97cb6d8fd8', '2017-04-17 12:55:01', '2017-04-17 12:54:59', '2017-04-17 08:24:29', 3, 9),
(22, '0b74812821', NULL, NULL, '2017-04-17 08:27:33', 1, 11),
(23, '94ef04c654', NULL, NULL, '2017-04-17 08:28:26', 1, 10),
(24, 'b70bdd78a8', NULL, NULL, '2017-04-17 08:28:55', 1, 10),
(26, 'ccd82d0947', NULL, NULL, '2017-04-17 12:58:44', 1, 9),
(28, '185d4be798', NULL, NULL, '2017-04-19 15:11:58', 1, 9);

-- --------------------------------------------------------

--
-- Structure de la table `commune`
--

CREATE TABLE `commune` (
  `idCommune` int(11) NOT NULL,
  `codePostal` int(11) DEFAULT NULL,
  `nomCommune` varchar(50) DEFAULT NULL,
  `aocCommune` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(15, 19800, 'Meyrignac-l\'Eglise', 1),
(16, 19190, 'Le Chastang', 0),
(17, 19160, 'Neuvic', 1),
(18, 16120, 'Bassac', 0),
(19, 16170, 'Bonneville', 1),
(20, 16200, 'Houlette', 0),
(21, 16270, 'Nieuil', 1);

-- --------------------------------------------------------

--
-- Structure de la table `conditionnement`
--

CREATE TABLE `conditionnement` (
  `idConditionnement` int(11) NOT NULL,
  `libelleConditionnement` varchar(255) DEFAULT NULL,
  `poidsConditionnee` int(11) DEFAULT NULL,
  `idLot` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `conditionnement`
--

INSERT INTO `conditionnement` (`idConditionnement`, `libelleConditionnement`, `poidsConditionnee`, `idLot`) VALUES
(1, 'Filet de petites Fernor Cov', 18, 1),
(2, 'Carton de Noix de Grenoble XL', 30, 2),
(4, 'Palette - Noix du Perigord XL', 200, 4),
(5, 'Palette - Noix du Perigord L', 200, 11),
(6, 'Filet de petites Lara Sèches', 10, 7),
(7, 'Filet de Lara Sèches', 10, 8),
(8, 'La belle Marbot Fraîche - Carton', 22, 9),
(9, 'Sac de petites Franquettes Fraîche', 3, 4),
(10, 'Parisiennes à Pâtisser - Grand filet', 18, 12),
(11, 'La Grand Jean L - Carton', 30, 13);

-- --------------------------------------------------------

--
-- Structure de la table `detailcommande`
--

CREATE TABLE `detailcommande` (
  `idConditionnement` int(11) NOT NULL,
  `idCommande` int(11) NOT NULL,
  `quantiteCommandee` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `detailcommande`
--

INSERT INTO `detailcommande` (`idConditionnement`, `idCommande`, `quantiteCommandee`) VALUES
(1, 22, 1),
(1, 28, 3),
(2, 21, 2),
(2, 28, 2),
(5, 22, 1),
(5, 28, 1),
(6, 24, 10),
(6, 28, 15),
(7, 21, 5),
(7, 22, 2),
(8, 22, 2),
(8, 26, 2),
(8, 28, 5),
(9, 23, 25),
(10, 22, 3),
(10, 24, 5),
(10, 26, 6),
(10, 28, 3),
(11, 20, 6),
(11, 28, 2);

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

CREATE TABLE `livraison` (
  `idLivraison` int(11) NOT NULL,
  `dateLivraison` date DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `idVerger` int(11) NOT NULL,
  `idTypeProduit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `livraison`
--

INSERT INTO `livraison` (`idLivraison`, `dateLivraison`, `quantite`, `idVerger`, `idTypeProduit`) VALUES
(2, '2017-04-01', 400, 6, 2),
(3, '2017-02-17', 200, 4, 1),
(4, '2017-03-24', 400, 8, 2),
(6, '2017-03-28', 170, 17, 2),
(7, '2017-03-29', 120, 18, 2),
(8, '2017-03-17', 325, 13, 1),
(9, '2017-04-05', 1100, 15, 1),
(10, '2017-04-07', 400, 14, 1),
(11, '2017-04-08', 575, 10, 2),
(12, '2017-03-31', 150, 10, 2);

-- --------------------------------------------------------

--
-- Structure de la table `lot`
--

CREATE TABLE `lot` (
  `idLot` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `idCalibre` int(11) DEFAULT NULL,
  `quantiteLot` int(11) NOT NULL,
  `idLivraison` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `lot`
--

INSERT INTO `lot` (`idLot`, `reference`, `idCalibre`, `quantiteLot`, `idLivraison`) VALUES
(1, 'FERNOR2428S', 3, 100, 2),
(2, 'NDGR3032S1', 4, 250, 4),
(3, 'NDGR3234S2', 5, 250, 4),
(4, '1FRANQM241', 1, 100, 3),
(7, '1LARAMAR28', 1, 75, 6),
(8, '2LARAMAR28', 2, 75, 6),
(9, '1marb040734', 6, 213, 10),
(10, 'Peri0405m341', 6, 320, 9),
(11, 'Peri04052342', 5, 362, 9),
(12, '170317PARIS1L', 3, 545, 8),
(13, 'GrandJean481', 3, 200, 11),
(14, 'GrandJean482', 3, 220, 12);

-- --------------------------------------------------------

--
-- Structure de la table `page`
--

CREATE TABLE `page` (
  `id_page` int(11) NOT NULL,
  `url_page` varchar(100) NOT NULL,
  `name_page` varchar(100) NOT NULL,
  `description_page` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `page`
--

INSERT INTO `page` (`id_page`, `url_page`, `name_page`, `description_page`) VALUES
(1, 'producteur/home', 'Informations Personnelles', 'Espace du producteur'),
(2, 'admin/home', 'Vue générale', 'Espace de l\'administrateur'),
(3, 'client/home', 'Catalogue des produits', 'Espace du client'),
(4, 'admin/inscription', 'Inscription', 'Permet d\'inscrire dans l\'application des producteurs ou des clients'),
(5, 'admin/utilisateurs', 'Gestion des Utilisateurs', 'Liste et outils de gestion relatifs aux différents utilisateurs '),
(6, 'admin/communes', 'Communes', 'Liste et ajouts des communes'),
(7, 'admin/varietes', 'Variétés de noix', 'Liste et ajouts des variétés de noix'),
(9, 'producteur/vergers', 'Mes vergers', 'Administration pour les producteurs de leurs vergers et toutes les informations associées'),
(10, 'admin/certifications', 'Certifications', 'Liste et ajout des certifications reconnu par la société'),
(11, 'admin/livraisons', 'Livraisons', 'Liste et ajout des livraisons de fournisseurs'),
(12, 'admin/lots', 'Administration des lots', 'Liste et ajout des lots de noix.'),
(13, 'producteur/profil', 'Mon profil', 'Espace profil du producteur; vu et possibilité de modifier ses informations. Liste des différentes certifications attribuées'),
(14, 'producteur/contact', 'Contact Administrateur', 'Page de prise de contact avec l\'administrateur pour un producteur'),
(15, 'client/profil', 'Mon profil', 'Espace d\'administration du profil d\'un client'),
(16, 'client/commandes', 'Commandes', 'Page permettant de passer commande et de garder un visuel sur le status des commandes'),
(17, 'admin/conditionnement', 'Conditionnement', 'Liste et ajout de différents modes de conditionnement de la coopérative'),
(18, 'admin/commandes', 'Commandes', 'Espace de gestion et de vue sur les commandes formulés par les clients de la coopérative'),
(19, 'client/bonCommande', 'Edition du bon de commande', 'Affichage du bon de commande avec tout ses détails et possibilité d\'impression du bon'),
(20, 'client/bonCommandePDF', 'PDF du bon de commande', 'Génération du format PDF du bon de commande, il est imprimable et enregistrable');

-- --------------------------------------------------------

--
-- Structure de la table `producteur`
--

CREATE TABLE `producteur` (
  `idProducteur` int(11) NOT NULL,
  `nomSociete` varchar(255) DEFAULT NULL,
  `nomResponsable` varchar(255) DEFAULT NULL,
  `prenomResponsable` varchar(255) DEFAULT NULL,
  `telephone` varchar(10) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `codePostal` int(11) DEFAULT NULL,
  `adherent` tinyint(1) DEFAULT NULL,
  `fk_id_user` int(11) DEFAULT NULL,
  `last_edit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Structure de la table `status`
--

CREATE TABLE `status` (
  `idStatus` int(11) NOT NULL,
  `libelleStatus` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `status`
--

INSERT INTO `status` (`idStatus`, `libelleStatus`) VALUES
(1, 'en attente'),
(2, 'en cours'),
(3, 'expedié');

-- --------------------------------------------------------

--
-- Structure de la table `typeproduit`
--

CREATE TABLE `typeproduit` (
  `idTypeProduit` int(11) NOT NULL,
  `libelleTypeProduit` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `users_access` (
  `users_access_id` int(11) NOT NULL,
  `fk_id_rank` int(11) NOT NULL,
  `fk_id_page` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(19, 2, 14),
(20, 3, 15),
(21, 3, 16),
(22, 1, 17),
(23, 1, 18),
(24, 1, 19),
(25, 3, 19),
(26, 1, 20),
(27, 3, 20);

-- --------------------------------------------------------

--
-- Structure de la table `users_login`
--

CREATE TABLE `users_login` (
  `id_login` int(11) NOT NULL,
  `fk_id_user` int(11) NOT NULL,
  `password_user` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `users_rank` (
  `id_rank` int(11) NOT NULL,
  `name_rank` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `variete` (
  `idVariete` int(11) NOT NULL,
  `nomVariete` varchar(25) DEFAULT NULL,
  `aocVariete` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `verger` (
  `idVerger` int(11) NOT NULL,
  `nomVerger` varchar(255) NOT NULL,
  `superficie` int(11) DEFAULT NULL,
  `nbrArbreParHect` int(11) DEFAULT NULL,
  `idProducteur` int(11) DEFAULT NULL,
  `idVariete` int(11) NOT NULL,
  `idCommune` int(11) DEFAULT NULL,
  `verger_last_edit` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `verger`
--

INSERT INTO `verger` (`idVerger`, `nomVerger`, `superficie`, `nbrArbreParHect`, `idProducteur`, `idVariete`, `idCommune`, `verger_last_edit`) VALUES
(4, '1FRANQ1MAUR', 4, 100, 13, 15, 9, '2017-04-05 09:40:54'),
(5, '1CORN1BONN', 6, 70, 13, 10, 19, '2017-04-05 08:47:33'),
(6, '1FERNOR1NIEU', 2, 120, 13, 16, 12, '2017-04-05 09:40:43'),
(7, '1PERI2NIEU', 5, 90, 13, 11, 21, '2017-04-02 18:28:46'),
(8, '198MEENdG1', 20, 125, 14, 15, 15, '2017-04-02 18:44:00'),
(9, '191LCSGNdP1', 15, 100, 14, 11, 16, '2017-04-02 18:45:32'),
(10, '162HOULGJ2', 5, 60, 14, 9, 20, '2017-04-02 18:46:51'),
(11, '162HOULGJ1', 7, 65, 14, 9, 20, '2017-04-02 18:47:17'),
(13, 'Parisienne16120', 10, 110, 15, 14, 18, '2017-04-09 10:51:44'),
(14, 'Marbot16200', 10, 110, 15, 8, 20, '2017-04-09 10:52:02'),
(15, 'Perigord16200', 20, 90, 15, 11, 20, '2017-04-09 10:53:20'),
(16, '1Loubr46130LLR', 5, 80, 16, 12, 13, '2017-04-09 10:56:15'),
(17, '1SarrLLR19800', 7, 85, 16, 12, 14, '2017-04-09 10:56:01'),
(18, '2SarrLLR19800', 3, 85, 16, 12, 14, '2017-04-09 10:56:48');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `calibre`
--
ALTER TABLE `calibre`
  ADD PRIMARY KEY (`idCalibre`);

--
-- Index pour la table `certifdelivree`
--
ALTER TABLE `certifdelivree`
  ADD PRIMARY KEY (`idCertification`,`idProducteur`),
  ADD KEY `FK_certifDelivree_idProducteur` (`idProducteur`);

--
-- Index pour la table `certification`
--
ALTER TABLE `certification`
  ADD PRIMARY KEY (`idCertification`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`idClient`),
  ADD KEY `fk_id_user` (`fk_id_user`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`idCommande`),
  ADD KEY `FK_COMMANDE_idClient` (`idClient`),
  ADD KEY `idStatus` (`idStatus`);

--
-- Index pour la table `commune`
--
ALTER TABLE `commune`
  ADD PRIMARY KEY (`idCommune`);

--
-- Index pour la table `conditionnement`
--
ALTER TABLE `conditionnement`
  ADD PRIMARY KEY (`idConditionnement`),
  ADD KEY `FK_CONDITIONNEMENT_idLot` (`idLot`);

--
-- Index pour la table `detailcommande`
--
ALTER TABLE `detailcommande`
  ADD PRIMARY KEY (`idConditionnement`,`idCommande`),
  ADD KEY `FK_detailCommande_numeroCommande` (`idCommande`);

--
-- Index pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD PRIMARY KEY (`idLivraison`),
  ADD KEY `FK_LIVRAISON_idVerger` (`idVerger`),
  ADD KEY `FK_LIVRAISON_idTypeProduit` (`idTypeProduit`);

--
-- Index pour la table `lot`
--
ALTER TABLE `lot`
  ADD PRIMARY KEY (`idLot`),
  ADD KEY `FK_LOT_idLivraison` (`idLivraison`),
  ADD KEY `idCalibre` (`idCalibre`);

--
-- Index pour la table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id_page`);

--
-- Index pour la table `producteur`
--
ALTER TABLE `producteur`
  ADD PRIMARY KEY (`idProducteur`),
  ADD KEY `fk_id_user` (`fk_id_user`);

--
-- Index pour la table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`idStatus`);

--
-- Index pour la table `typeproduit`
--
ALTER TABLE `typeproduit`
  ADD PRIMARY KEY (`idTypeProduit`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `rank` (`rank`);

--
-- Index pour la table `users_access`
--
ALTER TABLE `users_access`
  ADD PRIMARY KEY (`users_access_id`),
  ADD KEY `fk_id_page` (`fk_id_page`),
  ADD KEY `fk_id_rank` (`fk_id_rank`);

--
-- Index pour la table `users_login`
--
ALTER TABLE `users_login`
  ADD PRIMARY KEY (`id_login`),
  ADD KEY `fk_id_user` (`fk_id_user`);

--
-- Index pour la table `users_rank`
--
ALTER TABLE `users_rank`
  ADD PRIMARY KEY (`id_rank`);

--
-- Index pour la table `variete`
--
ALTER TABLE `variete`
  ADD PRIMARY KEY (`idVariete`);

--
-- Index pour la table `verger`
--
ALTER TABLE `verger`
  ADD PRIMARY KEY (`idVerger`),
  ADD KEY `FK_VERGER_idProducteur` (`idProducteur`),
  ADD KEY `FK_VERGER_idVariete` (`idVariete`),
  ADD KEY `FK_VERGER_idCommune` (`idCommune`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `calibre`
--
ALTER TABLE `calibre`
  MODIFY `idCalibre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `certification`
--
ALTER TABLE `certification`
  MODIFY `idCertification` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `idClient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `idCommande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT pour la table `commune`
--
ALTER TABLE `commune`
  MODIFY `idCommune` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT pour la table `conditionnement`
--
ALTER TABLE `conditionnement`
  MODIFY `idConditionnement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `livraison`
--
ALTER TABLE `livraison`
  MODIFY `idLivraison` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT pour la table `lot`
--
ALTER TABLE `lot`
  MODIFY `idLot` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT pour la table `page`
--
ALTER TABLE `page`
  MODIFY `id_page` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT pour la table `producteur`
--
ALTER TABLE `producteur`
  MODIFY `idProducteur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `status`
--
ALTER TABLE `status`
  MODIFY `idStatus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `typeproduit`
--
ALTER TABLE `typeproduit`
  MODIFY `idTypeProduit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT pour la table `users_access`
--
ALTER TABLE `users_access`
  MODIFY `users_access_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT pour la table `users_login`
--
ALTER TABLE `users_login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT pour la table `users_rank`
--
ALTER TABLE `users_rank`
  MODIFY `id_rank` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `variete`
--
ALTER TABLE `variete`
  MODIFY `idVariete` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT pour la table `verger`
--
ALTER TABLE `verger`
  MODIFY `idVerger` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
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
  ADD CONSTRAINT `FK_COMMANDE_idClient` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`),
  ADD CONSTRAINT `Fk_commande_idStatus_status` FOREIGN KEY (`idStatus`) REFERENCES `status` (`idStatus`);

--
-- Contraintes pour la table `conditionnement`
--
ALTER TABLE `conditionnement`
  ADD CONSTRAINT `FK_CONDITIONNEMENT_idLot` FOREIGN KEY (`idLot`) REFERENCES `lot` (`idLot`);

--
-- Contraintes pour la table `detailcommande`
--
ALTER TABLE `detailcommande`
  ADD CONSTRAINT `FK_detailCommande_idConditionnement` FOREIGN KEY (`idConditionnement`) REFERENCES `conditionnement` (`idConditionnement`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_detailCommande_numeroCommande` FOREIGN KEY (`idCommande`) REFERENCES `commande` (`idCommande`) ON DELETE CASCADE ON UPDATE CASCADE;

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
