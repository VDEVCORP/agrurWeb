-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 30 Mars 2017 à 15:22
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
-- Structure de la table `certifdelivree`
--

CREATE TABLE `certifdelivree` (
  `dateCertification` date DEFAULT NULL,
  `idCertification` int(11) NOT NULL,
  `idProducteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `certification`
--

CREATE TABLE `certification` (
  `idCertification` int(11) NOT NULL,
  `libelleCertification` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `idClient` int(11) NOT NULL,
  `nomClient` varchar(25) DEFAULT NULL,
  `nomRepresentant` varchar(255) DEFAULT NULL,
  `prenomRepresentant` varchar(25) NOT NULL,
  `telephone` varchar(10) NOT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `codePostal` int(11) DEFAULT NULL,
  `fk_id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`idClient`, `nomClient`, `nomRepresentant`, `prenomRepresentant`, `telephone`, `adresse`, `ville`, `codePostal`, `fk_id_user`) VALUES
(1, 'Ferrero', 'Piazini', 'Marc', '0612345678', '30 rue de l\'agroalimentaire', 'Patanpoint', 99321, 3),
(2, 'Carrefour', 'Moulin', 'Thibault', '0668696563', '27 rue Rachel Lempeur', 'Lille', 5900, 4),
(3, 'azeza', 'azda', 'azdaz', '325698746', '32 azdazda azdaz', 'zefzefaz', 65231, 8),
(4, 'aZQSD', 'QSDF', 'SDF', '65896547', '33 zefz', 'zefze', 25417, 9),
(5, 'aZQSD', 'QSDF', 'SDF', '65896547', '33 zefz', 'zefze', 25417, 10),
(6, 'edrftgh', 'dfg', 'dfvg', '4789652314', '564 rue truc', 'poldfre', 698745, 18),
(7, 'azdazd', 'azda', 'azdazd', '98654712', '654 azdazd', 'azdazda', 98745, 20),
(8, 'azdazd', 'azda', 'azdazd', '98654712', '654 azdazd', 'azdazda', 98745, 21);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `numeroCommande` int(11) NOT NULL,
  `dateDEnvoi` date DEFAULT NULL,
  `nbrUniteCommandee` int(11) DEFAULT NULL,
  `dateConditionnement` date DEFAULT NULL,
  `idClient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `commune`
--

CREATE TABLE `commune` (
  `idCommune` int(11) NOT NULL,
  `codePostal` int(11) DEFAULT NULL,
  `nomCommune` varchar(50) DEFAULT NULL,
  `aoc` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `commune`
--

INSERT INTO `commune` (`idCommune`, `codePostal`, `nomCommune`, `aoc`) VALUES
(1, 59000, 'Lille', 1),
(2, 59000, 'Lille', 1);

-- --------------------------------------------------------

--
-- Structure de la table `conditionnement`
--

CREATE TABLE `conditionnement` (
  `idConditionnement` int(11) NOT NULL,
  `typeConditionnement` varchar(25) DEFAULT NULL,
  `poidsConditionnee` int(11) DEFAULT NULL,
  `idLot` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `detailcommande`
--

CREATE TABLE `detailcommande` (
  `quantiteCommande` int(11) DEFAULT NULL,
  `idConditionnement` int(11) NOT NULL,
  `numeroCommande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Structure de la table `lot`
--

CREATE TABLE `lot` (
  `idLot` int(11) NOT NULL,
  `calibre` varchar(25) DEFAULT NULL,
  `idLivraison` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(3, 'client/home', 'Accueil', 'Espace du client'),
(4, 'admin/inscription', 'Inscription', 'Permet d\'inscrire dans l\'application des producteurs ou des clients'),
(5, 'admin/utilisateurs', 'Gestion des Utilisateurs', 'Liste et outils de gestion relatifs aux différents utilisateurs '),
(6, 'admin/communes', 'Communes', 'Liste et ajouts des communes'),
(7, 'admin/varietes', 'Variétés de noix', 'Liste et ajouts des variétés de noix'),
(8, 'admin/vergers', 'Vergers', 'Liste et ajouts des vergers'),
(9, 'producteur/vergers', 'Mes vergers', 'Administration pour les producteurs de leurs vergers et toutes les informations associées'),
(10, 'admin/certifications', 'Certifications', 'Liste et ajout des certifications reconnu par la société');

-- --------------------------------------------------------

--
-- Structure de la table `producteur`
--

CREATE TABLE `producteur` (
  `idProducteur` int(11) NOT NULL,
  `nomSociete` varchar(50) DEFAULT NULL,
  `nomResponsable` varchar(25) DEFAULT NULL,
  `prenomResponsable` varchar(25) DEFAULT NULL,
  `telephone` varchar(10) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `codePostal` int(11) DEFAULT NULL,
  `adherent` tinyint(1) DEFAULT NULL,
  `fk_id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `producteur`
--

INSERT INTO `producteur` (`idProducteur`, `nomSociete`, `nomResponsable`, `prenomResponsable`, `telephone`, `adresse`, `ville`, `codePostal`, `adherent`, `fk_id_user`) VALUES
(1, 'Lanoix\'C\'lavie', 'Belbeuf', 'Jeans-louis', '0668667794', '2 rue du Bretonneux', 'Caligou', 19191, 1, 2),
(2, '', 'Bergougnou', 'Thierry', '0235059594', '2 impasse du champs', 'Paumé-sur-brousse', 22222, 1, 5),
(3, '', 'Poulloux', 'Bernard', '963254125', '55 rue lol', 'mdrville', 32561, 0, 7),
(4, '', 'rezrtfgh', 'edsrfg', '02145698', '33 eoihzeoifh', 'zeefihz', 65478, 0, 11),
(5, '', 'zsedffg', 'zsedfg', '5698745214', '684zefzefzfez', 'zefzef', 58741, 1, 12),
(6, '', 'zsedffg', 'zsedfg', '5698745214', '684zefzefzfez', 'zefzef', 58741, 1, 13),
(7, '', 'zsedffg', 'zsedfg', '0125634765', '684zefzefzfez', 'zefzef', 58741, 1, 15),
(8, '', 'zsedffg', 'zsedfg', '0125634765', '684zefzefzfez', 'zefzef', 58741, 1, 16),
(9, '', 'ezrgft', 'ezfdg', '9874563214', '88 zepfioojzpefj', 'ezfpojzepo', 54178, 1, 17),
(10, 'qdsfg', 'aqezsedfg', 'rdfgh', '3025147896', '689 zefgzef z', 'zefze', 98746, 1, 19),
(11, 'LolCorp', 'Boudieux', 'Patrick', '0632547896', 'adress', 'ville', 89654, 0, 22);

-- --------------------------------------------------------

--
-- Structure de la table `typeproduit`
--

CREATE TABLE `typeproduit` (
  `idTypeProduit` int(11) NOT NULL,
  `libelleTypeProduit` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(1, 1, 'admin@gmail.com', 1),
(2, 2, 'producer@gmail.com', 1),
(3, 3, 'customer@gmail.com', 1),
(4, 3, 'add@add.com', 1),
(5, 2, 't.bergou@lacampagne.fr', 1),
(6, 2, '', 1),
(7, 2, 'bernard.coso@truc.fr', 1),
(8, 3, 'azdaz@azda.fr', 1),
(9, 3, 'dzsfc@juhib.fr', 1),
(10, 3, 'dzsfc@juhib.fr', 1),
(11, 2, 'zesdf@sedf.fr', 1),
(12, 2, 'zqsdef@ezs.ir', 1),
(13, 2, 'zqsdef@ezs.ir', 1),
(14, 2, 'kjuyyjyjt@grerg.fr', 1),
(15, 2, 'zqsdef@ezs.ir', 1),
(16, 2, 'zqsdef@ezs.ir', 1),
(17, 2, 'ezrdfgb@truc.com', 1),
(18, 3, 'tokpg@rgoij.fr', 1),
(19, 2, 'tyuezrf@rege.com', 1),
(20, 3, 'azdazd@azdazda.fr', 1),
(21, 3, 'azdazd@azdazda.fr', 1),
(22, 2, 'p.boudieux@gmail.com', 1);

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
(13, 1, 8),
(14, 2, 9),
(15, 1, 10);

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
(2, 2, '101456bdd9c4c795662feaf29e9fd75f507a20ef'),
(3, 3, 'b39f008e318efd2bb988d724a161b61c6909677f'),
(4, 4, '81fe8bfe87576c3ecb22426f8e57847382917acf'),
(5, 5, '403926033d001b5279df37cbbe5287b7c7c267fa'),
(6, 6, '6880aa7be2aa9880386d8c50d16adf6cd52d229b'),
(7, 7, '4ae9fa0a8299a828a886c0eb30c930c7cf302a72'),
(8, 8, '91223fd10ce86fc852b449583aa2196c304bf6e0'),
(9, 9, 'da39a3ee5e6b4b0d3255bfef95601890afd80709'),
(10, 10, 'da39a3ee5e6b4b0d3255bfef95601890afd80709'),
(11, 11, '65d4c856b2284047046ce7d8f6cd10bf93eee6fa'),
(12, 12, 'e33b5c68ff88c0e207021131d90dc7f30c5058ef'),
(13, 13, 'e33b5c68ff88c0e207021131d90dc7f30c5058ef'),
(14, 14, '3f7b1e2a98dea15069fdc2542560c21bf5fd8234'),
(15, 15, 'e33b5c68ff88c0e207021131d90dc7f30c5058ef'),
(16, 16, 'e33b5c68ff88c0e207021131d90dc7f30c5058ef'),
(17, 17, '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2'),
(18, 18, 'e5b57d873853e559fbf88cd96dd2365b2d8fd7eb'),
(19, 19, '8578173555a47d4ea49e697badfda270dee0858f'),
(20, 20, 'b973b36a51022035fbb10599136cc6795e821fab'),
(21, 21, 'b973b36a51022035fbb10599136cc6795e821fab'),
(22, 22, '8578173555a47d4ea49e697badfda270dee0858f');

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
  `aoc` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `variete`
--

INSERT INTO `variete` (`idVariete`, `nomVariete`, `aoc`) VALUES
(1, 'noix', 1),
(2, 'Bonjour', 1),
(3, 'Lol', 0),
(4, 'Unautre', 1),
(5, 'Mort de lol', 0),
(6, 'Mort de lol', 0),
(7, 'Océane', 1);

-- --------------------------------------------------------

--
-- Structure de la table `verger`
--

CREATE TABLE `verger` (
  `idVerger` int(11) NOT NULL,
  `superficie` int(11) DEFAULT NULL,
  `nbrArbreParHect` int(11) DEFAULT NULL,
  `idProducteur` int(11) DEFAULT NULL,
  `idVariete` int(11) NOT NULL,
  `idCommune` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

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
  ADD PRIMARY KEY (`numeroCommande`),
  ADD KEY `FK_COMMANDE_idClient` (`idClient`);

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
  ADD PRIMARY KEY (`idConditionnement`,`numeroCommande`),
  ADD KEY `FK_detailCommande_numeroCommande` (`numeroCommande`);

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
  ADD KEY `FK_LOT_idLivraison` (`idLivraison`);

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
-- AUTO_INCREMENT pour la table `certification`
--
ALTER TABLE `certification`
  MODIFY `idCertification` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `idClient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `numeroCommande` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `commune`
--
ALTER TABLE `commune`
  MODIFY `idCommune` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `conditionnement`
--
ALTER TABLE `conditionnement`
  MODIFY `idConditionnement` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `livraison`
--
ALTER TABLE `livraison`
  MODIFY `idLivraison` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `lot`
--
ALTER TABLE `lot`
  MODIFY `idLot` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `page`
--
ALTER TABLE `page`
  MODIFY `id_page` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `producteur`
--
ALTER TABLE `producteur`
  MODIFY `idProducteur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `typeproduit`
--
ALTER TABLE `typeproduit`
  MODIFY `idTypeProduit` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT pour la table `users_access`
--
ALTER TABLE `users_access`
  MODIFY `users_access_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT pour la table `users_login`
--
ALTER TABLE `users_login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT pour la table `users_rank`
--
ALTER TABLE `users_rank`
  MODIFY `id_rank` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `variete`
--
ALTER TABLE `variete`
  MODIFY `idVariete` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `verger`
--
ALTER TABLE `verger`
  MODIFY `idVerger` int(11) NOT NULL AUTO_INCREMENT;
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
  ADD CONSTRAINT `FK_LOT_idLivraison` FOREIGN KEY (`idLivraison`) REFERENCES `livraison` (`idLivraison`);

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
