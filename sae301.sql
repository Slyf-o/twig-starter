-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 09 déc. 2025 à 20:41
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sae301`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `categorie_id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`categorie_id`, `nom`) VALUES
(1, 'Produit'),
(2, 'Service');

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

CREATE TABLE `cours` (
  `cours_id` int(11) NOT NULL,
  `professeur_id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  `type_instrument` int(11) DEFAULT NULL,
  `titre` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `prix` decimal(10,2) NOT NULL,
  `type_cours` enum('Collectif','Individuel') NOT NULL,
  `modalite` enum('Presentiel','Distanciel') NOT NULL,
  `niveau` enum('Debutant','Intermediaire','Avance','Expert') NOT NULL,
  `duree` varchar(70) DEFAULT NULL,
  `localisation` varchar(255) DEFAULT NULL,
  `lien_visio` varchar(255) DEFAULT NULL,
  `statut` enum('Disponible','Complet','Annule') DEFAULT 'Disponible',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `instrument`
--

CREATE TABLE `instrument` (
  `instrument_id` int(11) NOT NULL,
  `vendeur_id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  `type_instrument` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `prix` decimal(10,2) NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `etat` enum('Neuf','Tres bon etat','Bon etat','Usage') NOT NULL,
  `statut` enum('Disponible','Vendu','Reserve') DEFAULT 'Disponible',
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `partitions`
--

CREATE TABLE `partitions` (
  `partition_id` int(11) NOT NULL,
  `vendeur_id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `prix` decimal(10,2) NOT NULL,
  `niveau` enum('Debutant','Intermediaire','Avance','Expert') DEFAULT NULL,
  `media` varchar(255) DEFAULT NULL,
  `compositeur` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `type_instrument`
--

CREATE TABLE `type_instrument` (
  `type_id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `type_instrument`
--

INSERT INTO `type_instrument` (`type_id`, `nom`) VALUES
(8, 'Basse'),
(4, 'Batterie'),
(6, 'Flute'),
(1, 'Guitare'),
(2, 'Piano'),
(5, 'Saxophone'),
(7, 'Trompette'),
(9, 'Ukulele'),
(3, 'Violon');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `user_id` int(11) NOT NULL,
  `nom` varchar(70) NOT NULL,
  `prenom` varchar(70) NOT NULL,
  `pseudo` varchar(70) NOT NULL,
  `email` varchar(155) NOT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Visiteur','Redacteur','Musicien','Admin') DEFAULT 'Visiteur',
  `date_inscription` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`categorie_id`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Index pour la table `cours`
--
ALTER TABLE `cours`
  ADD PRIMARY KEY (`cours_id`),
  ADD KEY `professeur_id` (`professeur_id`),
  ADD KEY `categorie_id` (`categorie_id`),
  ADD KEY `type_instrument` (`type_instrument`);

--
-- Index pour la table `instrument`
--
ALTER TABLE `instrument`
  ADD PRIMARY KEY (`instrument_id`),
  ADD KEY `vendeur_id` (`vendeur_id`),
  ADD KEY `categorie_id` (`categorie_id`),
  ADD KEY `type_instrument` (`type_instrument`);

--
-- Index pour la table `partitions`
--
ALTER TABLE `partitions`
  ADD PRIMARY KEY (`partition_id`),
  ADD KEY `vendeur_id` (`vendeur_id`),
  ADD KEY `categorie_id` (`categorie_id`);

--
-- Index pour la table `type_instrument`
--
ALTER TABLE `type_instrument`
  ADD PRIMARY KEY (`type_id`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `pseudo` (`pseudo`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `categorie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `cours`
--
ALTER TABLE `cours`
  MODIFY `cours_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `instrument`
--
ALTER TABLE `instrument`
  MODIFY `instrument_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `partitions`
--
ALTER TABLE `partitions`
  MODIFY `partition_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `type_instrument`
--
ALTER TABLE `type_instrument`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cours`
--
ALTER TABLE `cours`
  ADD CONSTRAINT `cours_ibfk_1` FOREIGN KEY (`professeur_id`) REFERENCES `utilisateur` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cours_ibfk_2` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`categorie_id`),
  ADD CONSTRAINT `cours_ibfk_3` FOREIGN KEY (`type_instrument`) REFERENCES `type_instrument` (`type_id`);

--
-- Contraintes pour la table `instrument`
--
ALTER TABLE `instrument`
  ADD CONSTRAINT `instrument_ibfk_1` FOREIGN KEY (`vendeur_id`) REFERENCES `utilisateur` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `instrument_ibfk_2` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`categorie_id`),
  ADD CONSTRAINT `instrument_ibfk_3` FOREIGN KEY (`type_instrument`) REFERENCES `type_instrument` (`type_id`);

--
-- Contraintes pour la table `partitions`
--
ALTER TABLE `partitions`
  ADD CONSTRAINT `partitions_ibfk_1` FOREIGN KEY (`vendeur_id`) REFERENCES `utilisateur` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `partitions_ibfk_2` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`categorie_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
