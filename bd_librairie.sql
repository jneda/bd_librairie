-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 14 oct. 2022 à 09:24
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bd_librairie`
--

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

DROP TABLE IF EXISTS `auteur`;
CREATE TABLE IF NOT EXISTS `auteur` (
  `id_auteur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  PRIMARY KEY (`id_auteur`) USING BTREE,
  KEY `index_nom_auteur` (`nom`),
  KEY `index_prenom_auteur` (`prenom`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `auteur`
--

INSERT INTO `auteur` (`id_auteur`, `nom`, `prenom`) VALUES
(1, 'apollinaire', 'guillaume'),
(2, 'baudelaire', 'charles'),
(3, 'beaumarchais', 'pierre-augustin'),
(4, 'camus', 'albert'),
(5, 'stevenson', 'robert louis'),
(6, 'carroll', 'lewis'),
(7, 'wilde', 'oscar'),
(8, 'cohen', 'leonard'),
(9, 'cervantes', 'miguel'),
(10, 'borges', 'jorge luis');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id_commande` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `prix` decimal(6,2) NOT NULL,
  `quantite` int(3) NOT NULL,
  `id_livre` int(11) NOT NULL,
  `id_fournisseur` int(11) NOT NULL,
  PRIMARY KEY (`id_commande`) USING BTREE,
  KEY `id_livre` (`id_livre`) USING BTREE,
  KEY `id_fournisseur` (`id_fournisseur`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id_commande`, `date`, `prix`, `quantite`, `id_livre`, `id_fournisseur`) VALUES
(1, '2020-07-14', '12.99', 6, 7, 1),
(2, '2020-08-27', '8.49', 13, 4, 8),
(3, '2020-10-21', '38.99', 12, 1, 5),
(4, '2020-10-21', '7.49', 8, 7, 3),
(5, '2021-01-01', '22.99', 8, 5, 1),
(6, '2021-02-02', '7.99', 4, 10, 9),
(7, '2021-02-28', '7.00', 6, 10, 9),
(8, '2021-03-21', '12.00', 8, 8, 6),
(9, '2021-03-21', '35.99', 12, 1, 1),
(10, '2021-06-21', '18.99', 11, 2, 10);

-- --------------------------------------------------------

--
-- Structure de la table `editeur`
--

DROP TABLE IF EXISTS `editeur`;
CREATE TABLE IF NOT EXISTS `editeur` (
  `id_editeur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(40) NOT NULL,
  PRIMARY KEY (`id_editeur`) USING BTREE,
  KEY `index_nom_editeur` (`nom`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `editeur`
--

INSERT INTO `editeur` (`id_editeur`, `nom`) VALUES
(4, 'actes sud'),
(5, 'catedra'),
(3, 'editions de minuit'),
(2, 'editis'),
(8, 'faber and faber'),
(1, 'hachette'),
(9, 'harlequin enterprises'),
(6, 'iberlibro'),
(10, 'osprey publishing'),
(7, 'penguin books');

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
CREATE TABLE IF NOT EXISTS `fournisseur` (
  `id_fournisseur` int(11) NOT NULL AUTO_INCREMENT,
  `raison_sociale` varchar(40) NOT NULL,
  `code_postal` varchar(10) NOT NULL,
  `rue` varchar(40) NOT NULL,
  `localite` varchar(20) NOT NULL,
  `pays` varchar(20) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `url` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `fax` varchar(20) NOT NULL,
  PRIMARY KEY (`id_fournisseur`) USING BTREE,
  KEY `index_pays_fournisseur` (`pays`),
  KEY `index_code_postal_fournisseur` (`code_postal`),
  KEY `index_localite_fournisseur` (`localite`),
  KEY `index_raison_sociale` (`raison_sociale`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `fournisseur`
--

INSERT INTO `fournisseur` (`id_fournisseur`, `raison_sociale`, `code_postal`, `rue`, `localite`, `pays`, `telephone`, `url`, `email`, `fax`) VALUES
(1, 'comptoir du livre', '31120', '10 b bd de l\'europe', 'portet sur garonne', 'france', '+33 562117333', 'https://www.comptoirdulivre.fr', 'contact@comptoirdulivre.fr', '+33 561724773'),
(2, 'hachette livre', '92300', '10 rue thierry le luron', 'levallois perret', 'france', '+33 141346000', 'https://www.hachette.fr', 'support@hachettepro.fr', '+33 141346775'),
(3, 'expodif', '92270', '27 bis rue henry litolff', 'bois-colombes', 'france', '+33 143337424', 'https://expodif.fr', 'contact@expodif.fr', ''),
(4, 'librairie de l\'echo', '75006', '13 rue de sevres', 'paris', 'france', '+33 145488790', 'https://www.chantelivre-paris.com', '', ''),
(5, 'gallimard jeunesse', '75007', '5 rue sebastien bottin', 'paris', 'france', '+33 149544200', 'https://www.gallimard-jeunesse.fr', 'contact@gallimard-jeunesse.fr', '+33 145443946'),
(6, 'book depot', 'l2v 1x3', '67 front street north', 'thorold ontario', 'canada', '1-800-801-7193', 'https://www.bookdepot.com', 'service@bookdepot.com', '1-905-680-7230'),
(7, 'gardners books limited', 'bn23 6qh', '1 whittle drive', 'eastbourne', 'royaume-uni', '+44 1323 521777', 'https://www.gardners.com', 'uksales@gardners.com', '+44 1323 521666'),
(8, 'world of books ltd', 'bn12 4qy', 'mulberry house woods way', 'goring by sea', 'royaume-uni', '', 'https://www.wob.com', 'biblio@worldofbooks.com', ''),
(9, 'biblaria sccl', '08027', 'calle l espiga 1', 'barcelona', 'espagne', '+34 933524027', '', '', '+34 933524008'),
(10, 'irish library suppliers ltd', 'd06 c8y8', '270 rathmines rd lr', 'dublin', 'irlande', '+353 14967398', '', '', '+353 14960228');

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

DROP TABLE IF EXISTS `livre`;
CREATE TABLE IF NOT EXISTS `livre` (
  `id_livre` int(11) NOT NULL AUTO_INCREMENT,
  `isbn` varchar(20) NOT NULL,
  `titre` varchar(40) NOT NULL,
  `theme` varchar(40) NOT NULL,
  `nombre_pages` int(4) NOT NULL,
  `format` varchar(20) NOT NULL,
  `annee_edition` year(4) NOT NULL,
  `prix_vente` decimal(5,2) NOT NULL,
  `langue` varchar(20) NOT NULL,
  `id_auteur` int(11) NOT NULL,
  `id_editeur` int(11) NOT NULL,
  PRIMARY KEY (`id_livre`) USING BTREE,
  KEY `index_auteur` (`id_auteur`) USING BTREE,
  KEY `index_editeur` (`id_editeur`) USING BTREE,
  KEY `index_theme` (`theme`),
  KEY `index_langue` (`langue`),
  KEY `index_titre` (`titre`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livre`
--

INSERT INTO `livre` (`id_livre`, `isbn`, `titre`, `theme`, `nombre_pages`, `format`, `annee_edition`, `prix_vente`, `langue`, `id_auteur`, `id_editeur`) VALUES
(1, '978-0-4908-2842-1', 'mes meilleures recettes de saucisses', 'cuisine', 452, '14 x 21.6 cm', 1999, '39.99', 'français', 2, 2),
(2, '978-9-9058-9761-8', 'oh boy what a night', 'anecdotes', 129, '16 x 24 cm', 2001, '19.49', 'anglais', 7, 7),
(3, '978-7-8445-1570-9', 'novelas ejemplares', 'picaresque', 666, '15 x 21 cm', 2016, '44.49', 'espagnol', 9, 5),
(4, '978-8-4974-3965-7', 'dolor de cabeza', 'anecdotes', 42, '11 x 18 cm', 1986, '7.59', 'espagnol', 10, 6),
(5, '978-6-0785-1906-4', 'tajines au micro-ondes', 'cuisine', 121, '14 x 21.6 cm', 1964, '24.99', 'français', 4, 4),
(6, '978-5-9803-9328-1', 'my good old donkey', 'biographie', 69, '21 x 29.7 cm', 2011, '33.33', 'anglais', 5, 10),
(7, '978-7-0491-8150-1', 'a mes ennemis jures', 'polemique', 24, '15 x 21 cm', 2016, '8.99', 'français', 2, 3),
(8, '978-9-2010-2577-7', 'grasshopper snacks', 'cuisine', 86, '21 x 29.7 cm', 2021, '12.49', 'anglais', 8, 8),
(9, '978-7-9546-0379-2', 'quand j\'etais bouvier', 'picaresque', 321, '11 x 18 cm', 1989, '12.99', 'français', 1, 1),
(10, '978-4-3688-8464-9', 'vete a tocar la hierba', 'polemique', 46, '14 x 21.6 cm', 2001, '8.99', 'espagnol', 9, 5);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`id_livre`) REFERENCES `livre` (`id_livre`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`id_fournisseur`) REFERENCES `fournisseur` (`id_fournisseur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `livre_ibfk_1` FOREIGN KEY (`id_auteur`) REFERENCES `auteur` (`id_auteur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `livre_ibfk_2` FOREIGN KEY (`id_editeur`) REFERENCES `editeur` (`id_editeur`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
