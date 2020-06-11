-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  Dim 15 mars 2020 à 21:51
-- Version du serveur :  8.0.18
-- Version de PHP :  7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `ecommerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actif` tinyint(1) NOT NULL DEFAULT '1',
  `prix` double NOT NULL,
  `nom` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `primary_image` varchar(255) NOT NULL,
  `quantit` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='liste des articles et leurs descriptions';

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`id`, `actif`, `prix`, `nom`, `description`, `primary_image`, `quantit`) VALUES
(1, 1, 100, 'Test', 'tettestse', '', 0),
(2, 1, 1500, 'Chaise', 'une chaise de bureau', '', 0),
(11, 1, 0, 'Enfant espagnol', 'Un enfant né en Espagne', '', 0);

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

DROP TABLE IF EXISTS `commandes`;
CREATE TABLE IF NOT EXISTS `commandes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addresse` text NOT NULL,
  `post_code` int(11) NOT NULL,
  `nom` varchar(128) NOT NULL,
  `id_pays` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `commandes_articles`
--

DROP TABLE IF EXISTS `commandes_articles`;
CREATE TABLE IF NOT EXISTS `commandes_articles` (
  `commandes_id` int(11) NOT NULL,
  `articles_id` int(11) NOT NULL,
  PRIMARY KEY (`commandes_id`,`articles_id`),
  KEY `IDX_D470CD148BF5C2E6` (`commandes_id`),
  KEY `IDX_D470CD141EBAF6CC` (`articles_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(128) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_articles_id` int(11) NOT NULL,
  `primary_image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E01FBE6A6A83B3B` (`id_articles_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20200306161030', '2020-03-12 00:00:00'),
('20200312164525', '2020-03-12 16:56:57'),
('20200313104214', '2020-03-13 10:42:32'),
('20200313105123', '2020-03-13 10:51:34'),
('20200313154826', '2020-03-13 15:49:16'),
('20200313161009', '2020-03-13 16:10:17'),
('20200314175812', '2020-03-14 17:58:23'),
('20200315155726', '2020-03-15 15:57:35'),
('20200315210555', '2020-03-15 21:06:18');

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

DROP TABLE IF EXISTS `panier`;
CREATE TABLE IF NOT EXISTS `panier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_panier` int(11) NOT NULL,
  `id_article` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `panier`
--

INSERT INTO `panier` (`id`, `id_panier`, `id_article`, `quantity`) VALUES
(1, 50, 1, 1),
(2, 50, 10, 5),
(3, 50, 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

DROP TABLE IF EXISTS `pays`;
CREATE TABLE IF NOT EXISTS `pays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` int(11) NOT NULL,
  `prefix_tel` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(128) NOT NULL,
  `tel` bigint(20) UNSIGNED DEFAULT NULL,
  `email` varchar(128) NOT NULL,
  `addresse` text NOT NULL,
  `id_pays` int(11) NOT NULL,
  `post_code` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commandes_articles`
--
ALTER TABLE `commandes_articles`
  ADD CONSTRAINT `FK_D470CD141EBAF6CC` FOREIGN KEY (`articles_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D470CD148BF5C2E6` FOREIGN KEY (`commandes_id`) REFERENCES `commandes` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `FK_E01FBE6A6A83B3B` FOREIGN KEY (`id_articles_id`) REFERENCES `articles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
