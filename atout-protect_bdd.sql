-- phpMyAdmin SQL Dump
-- version 4.0.10.6
-- http://www.phpmyadmin.net
--
-- Host: mysql-atout-protect.alwaysdata.net
-- Generation Time: Aug 30, 2017 at 09:33 AM
-- Server version: 10.1.20-MariaDB
-- PHP Version: 5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `atout-protect_bdd`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `check_licence`$$
CREATE DEFINER=`136225_root`@`%` PROCEDURE `check_licence`(IN licenceSerial varchar(255),IN email varchar(255))
BEGIN
SELECT *
FROM achat, user, licence
WHERE user.email = email
AND user.ID = achat.User_ID
AND achat.Achat_ID = licence.achat_ID
AND licence.Licence_Serial = licenceSerial;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `achat`
--

DROP TABLE IF EXISTS `achat`;
CREATE TABLE IF NOT EXISTS `achat` (
  `Achat_ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_ID` int(11) NOT NULL,
  `Prix_total` float NOT NULL,
  `Date_achat` datetime NOT NULL,
  PRIMARY KEY (`Achat_ID`),
  KEY `User_ID` (`User_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=71 ;

-- --------------------------------------------------------

--
-- Table structure for table `licence`
--

DROP TABLE IF EXISTS `licence`;
CREATE TABLE IF NOT EXISTS `licence` (
  `Licence_ID` int(3) NOT NULL AUTO_INCREMENT,
  `Licence_Type` int(3) NOT NULL,
  `Licence_Serial` varchar(255) NOT NULL,
  `Licence_Prix` float NOT NULL,
  `Licence_Logiciel` int(3) NOT NULL,
  `achat_ID` int(3) NOT NULL,
  `Licence_libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Licence_ID`),
  KEY `Licence_Type` (`Licence_Type`),
  KEY `Licence_Type_2` (`Licence_Type`),
  KEY `Licence_Prix` (`Licence_Prix`),
  KEY `Licence_Logiciel` (`Licence_Logiciel`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=86 ;

-- --------------------------------------------------------

--
-- Table structure for table `logiciel_atout_sa`
--

DROP TABLE IF EXISTS `logiciel_atout_sa`;
CREATE TABLE IF NOT EXISTS `logiciel_atout_sa` (
  `ID` int(3) NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `Prix` float NOT NULL,
  `Categorie` varchar(255) NOT NULL,
  `Description` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Logiciel_ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logiciel_atout_sa`
--

INSERT INTO `logiciel_atout_sa` (`ID`, `Nom`, `Prix`, `Categorie`, `Description`) VALUES
(1, 'Visual PHP 2017', 150, 'IDE', 'environnement de développement pour les développeurs PHP.'),
(2, 'Binary decrypt', 580, 'Editeur de code', 'Reverse enginnering pour editer code binaire d''executables.'),
(3, 'Photo soft', 200, 'edition photos', 'la suite d''edition photos'),
(4, 'Photo soft Premium', 560, 'edition photos', 'la suite d''edition photos');

-- --------------------------------------------------------

--
-- Table structure for table `type_licence`
--

DROP TABLE IF EXISTS `type_licence`;
CREATE TABLE IF NOT EXISTS `type_licence` (
  `Type_ID` int(3) NOT NULL,
  `Nom_type_licence` varchar(255) NOT NULL,
  `Coeficient_prix` float NOT NULL,
  `Duree_Licence` int(3) NOT NULL,
  PRIMARY KEY (`Type_ID`),
  KEY `Type_ID` (`Type_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type_licence`
--

INSERT INTO `type_licence` (`Type_ID`, `Nom_type_licence`, `Coeficient_prix`, `Duree_Licence`) VALUES
(1, 'mensuel', 0.5, 31),
(2, 'a vie', 2, 36500),
(3, 'annuel', 1, 365);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `ID` int(3) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 NOT NULL,
  `privilege` varchar(255) CHARACTER SET utf8 NOT NULL,
  `adresse` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Liste des utilisateurs' AUTO_INCREMENT=36 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `password`, `email`, `name`, `nickname`, `privilege`, `adresse`) VALUES
(23, '2a874ed1dcc8c0d3469d697dde643e268d1c5323', 'adrien.tigram@hotmail.fr', 'adri', 'carre', '1', 'null');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
