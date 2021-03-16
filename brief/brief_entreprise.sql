-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 16 mars 2021 à 08:10
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `brief_entreprise`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `num_cat` int(11) NOT NULL AUTO_INCREMENT,
  `nom_cat` varchar(10) DEFAULT NULL,
  `montant` double NOT NULL,
  PRIMARY KEY (`num_cat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `correspondant`
--

DROP TABLE IF EXISTS `correspondant`;
CREATE TABLE IF NOT EXISTS `correspondant` (
  `num_cor` int(11) NOT NULL AUTO_INCREMENT,
  `num_tp` int(11) DEFAULT NULL,
  `num_partenaire` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_cor`),
  KEY `num_tp` (`num_tp`,`num_partenaire`),
  KEY `num_partenaire` (`num_partenaire`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

DROP TABLE IF EXISTS `employe`;
CREATE TABLE IF NOT EXISTS `employe` (
  `num_emp` int(11) NOT NULL AUTO_INCREMENT,
  `nom_emp` varchar(10) DEFAULT NULL,
  `Sexe` tinyint(1) NOT NULL,
  `num_cat` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_emp`),
  KEY `num_cat` (`num_cat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `partenaire`
--

DROP TABLE IF EXISTS `partenaire`;
CREATE TABLE IF NOT EXISTS `partenaire` (
  `num_partenaire` int(11) NOT NULL AUTO_INCREMENT,
  `nom_partenaire` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`num_partenaire`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `participer`
--

DROP TABLE IF EXISTS `participer`;
CREATE TABLE IF NOT EXISTS `participer` (
  `num_participer` int(11) NOT NULL AUTO_INCREMENT,
  `nul_projet` int(11) DEFAULT NULL,
  `num_partenaire` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_participer`),
  KEY `nul_projet` (`nul_projet`,`num_partenaire`),
  KEY `num_partenaire` (`num_partenaire`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

DROP TABLE IF EXISTS `pays`;
CREATE TABLE IF NOT EXISTS `pays` (
  `num_pays` int(11) NOT NULL AUTO_INCREMENT,
  `nom_pays` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`num_pays`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

DROP TABLE IF EXISTS `projet`;
CREATE TABLE IF NOT EXISTS `projet` (
  `nul_projet` int(11) NOT NULL AUTO_INCREMENT,
  `nom_projet` varchar(10) DEFAULT NULL,
  `budget` double DEFAULT NULL,
  `num_emp` int(11) DEFAULT NULL,
  PRIMARY KEY (`nul_projet`),
  KEY `num_emp` (`num_emp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

DROP TABLE IF EXISTS `service`;
CREATE TABLE IF NOT EXISTS `service` (
  `num_service` int(11) NOT NULL AUTO_INCREMENT,
  `nom_service` varchar(10) DEFAULT NULL,
  `num_emp` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_service`),
  KEY `num_emp` (`num_emp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `travail`
--

DROP TABLE IF EXISTS `travail`;
CREATE TABLE IF NOT EXISTS `travail` (
  `num_tr` int(11) NOT NULL AUTO_INCREMENT,
  `num_emp` int(11) DEFAULT NULL,
  `num_service` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_tr`),
  KEY `num_emp` (`num_emp`,`num_service`),
  KEY `num_service` (`num_service`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `travaill`
--

DROP TABLE IF EXISTS `travaill`;
CREATE TABLE IF NOT EXISTS `travaill` (
  `num_travaill` int(11) NOT NULL AUTO_INCREMENT,
  `num_emp` int(11) DEFAULT NULL,
  `nul_projet` int(11) DEFAULT NULL,
  PRIMARY KEY (`num_travaill`),
  KEY `num_emp` (`num_emp`,`nul_projet`),
  KEY `nul_projet` (`nul_projet`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `type_part`
--

DROP TABLE IF EXISTS `type_part`;
CREATE TABLE IF NOT EXISTS `type_part` (
  `num_tp` int(11) NOT NULL AUTO_INCREMENT,
  `nom_tp` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`num_tp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `_`
--

DROP TABLE IF EXISTS `_`;
CREATE TABLE IF NOT EXISTS `_` (
  `num1` int(11) NOT NULL AUTO_INCREMENT,
  `num_pays` int(11) DEFAULT NULL,
  `num_partenaire` int(11) DEFAULT NULL,
  PRIMARY KEY (`num1`),
  KEY `num_pays` (`num_pays`,`num_partenaire`),
  KEY `num_partenaire` (`num_partenaire`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `correspondant`
--
ALTER TABLE `correspondant`
  ADD CONSTRAINT `correspondant_ibfk_1` FOREIGN KEY (`num_tp`) REFERENCES `type_part` (`num_tp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `correspondant_ibfk_2` FOREIGN KEY (`num_partenaire`) REFERENCES `partenaire` (`num_partenaire`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `employe`
--
ALTER TABLE `employe`
  ADD CONSTRAINT `employe_ibfk_1` FOREIGN KEY (`num_cat`) REFERENCES `categorie` (`num_cat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `participer`
--
ALTER TABLE `participer`
  ADD CONSTRAINT `participer_ibfk_1` FOREIGN KEY (`nul_projet`) REFERENCES `projet` (`nul_projet`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `participer_ibfk_2` FOREIGN KEY (`num_partenaire`) REFERENCES `partenaire` (`num_partenaire`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `projet`
--
ALTER TABLE `projet`
  ADD CONSTRAINT `projet_ibfk_1` FOREIGN KEY (`num_emp`) REFERENCES `employe` (`num_emp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `service_ibfk_1` FOREIGN KEY (`num_emp`) REFERENCES `employe` (`num_emp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `travail`
--
ALTER TABLE `travail`
  ADD CONSTRAINT `travail_ibfk_1` FOREIGN KEY (`num_emp`) REFERENCES `employe` (`num_emp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `travail_ibfk_2` FOREIGN KEY (`num_service`) REFERENCES `service` (`num_service`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `travaill`
--
ALTER TABLE `travaill`
  ADD CONSTRAINT `travaill_ibfk_1` FOREIGN KEY (`num_emp`) REFERENCES `employe` (`num_emp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `travaill_ibfk_2` FOREIGN KEY (`nul_projet`) REFERENCES `projet` (`nul_projet`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `_`
--
ALTER TABLE `_`
  ADD CONSTRAINT `__ibfk_1` FOREIGN KEY (`num_pays`) REFERENCES `pays` (`num_pays`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `__ibfk_2` FOREIGN KEY (`num_partenaire`) REFERENCES `partenaire` (`num_partenaire`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
