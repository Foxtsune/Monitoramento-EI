-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 04-Mar-2020 às 12:22
-- Versão do servidor: 5.7.26
-- versão do PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `infantil_education_mch`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `addresses`
--

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE IF NOT EXISTS `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `street` varchar(255) NOT NULL,
  `number` int(11) NOT NULL,
  `neighborhood` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `addresses`
--

INSERT INTO `addresses` (`id`, `street`, `number`, `neighborhood`) VALUES
(69, 'Ernesto Pereira de Carvalho', 55, 'Centro'),
(70, 'Armando José', 489, 'Cavaco'),
(71, 'Praça Coronel Reinaldo', 879, 'Jardim das Oliveiras II'),
(76, 'Praça Coronel Reinaldo', 55, 'Centro'),
(77, 'Praça Coronel Reinaldo', 55, 'Centro'),
(78, 'Rua C', 25, 'Jardim das Oliveiras'),
(79, 'Rua das Flores', 56, 'Morada da Serra'),
(80, 'Rua A', 9999, 'Chacara de Shailó'),
(81, 'Rua São Paulo', 89, 'Jardim Novo Milênio'),
(82, 'Rua Bahia', 74, 'Centro'),
(83, 'Rua Bahia', 15, 'Centro');

-- --------------------------------------------------------

--
-- Estrutura da tabela `addresses_has_candidates`
--

DROP TABLE IF EXISTS `addresses_has_candidates`;
CREATE TABLE IF NOT EXISTS `addresses_has_candidates` (
  `addresses_id` int(11) NOT NULL,
  `candidates_id` int(11) NOT NULL,
  PRIMARY KEY (`addresses_id`,`candidates_id`),
  KEY `fk_addresses_has_candidates_candidates1_idx` (`candidates_id`),
  KEY `fk_addresses_has_candidates_addresses1_idx` (`addresses_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `addresses_has_candidates`
--

INSERT INTO `addresses_has_candidates` (`addresses_id`, `candidates_id`) VALUES
(69, 37),
(70, 38),
(71, 39),
(76, 44),
(77, 45),
(78, 46),
(79, 47),
(80, 48),
(81, 49),
(82, 50),
(83, 51);

-- --------------------------------------------------------

--
-- Estrutura da tabela `candidates`
--

DROP TABLE IF EXISTS `candidates`;
CREATE TABLE IF NOT EXISTS `candidates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `birth_date` date NOT NULL,
  `tel1` bigint(12) NOT NULL,
  `tel2` bigint(12) DEFAULT NULL,
  `inscription_date` date NOT NULL,
  `situation` tinyint(3) NOT NULL,
  `obs` varchar(255) DEFAULT NULL,
  `conf_date` date DEFAULT NULL,
  `units_id` int(11) DEFAULT NULL,
  `classrooms_id` int(11) DEFAULT NULL,
  `parents_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`parents_id`),
  KEY `fk_candidates_classrooms_idx` (`classrooms_id`),
  KEY `fk_candidates_units_idx` (`units_id`),
  KEY `fk_candidates_parents1_idx` (`parents_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `candidates`
--

INSERT INTO `candidates` (`id`, `name`, `birth_date`, `tel1`, `tel2`, `inscription_date`, `situation`, `obs`, `conf_date`, `units_id`, `classrooms_id`, `parents_id`) VALUES
(37, 'Elena Guimarães', '2017-05-12', 35489568455, 358944854, '2019-11-25', 0, '', NULL, NULL, NULL, 69),
(38, 'Marcos Pereira', '2015-02-05', 3548561456, NULL, '2019-11-25', 0, '', NULL, NULL, NULL, 70),
(39, 'Mariana Tereza Ferreira', '2018-12-01', 2315651155, NULL, '2019-11-25', -1, 'DESISTÊNCIA: não apareceu', NULL, NULL, NULL, 71),
(44, 'Junior Pereira Santos', '2020-03-01', 35987001234, 3532958700, '2019-12-04', 0, 'Prefere vaga no CEMEAI', NULL, NULL, NULL, 76),
(45, 'Julio Pereira', '2020-03-01', 35987001234, NULL, '2019-12-04', 1, 'Prefere vaga com  Gêmeo Junior', '2019-12-04', 15, 28, 77),
(46, 'Ana Maria dos Santos', '2017-02-14', 3532954551, NULL, '2020-03-04', 0, '', NULL, NULL, NULL, 78),
(47, 'Anderson Nascimento', '2018-08-10', 35948956254, 35988484845, '2020-03-04', 0, 'Tem irmão na creche CEMEAI', NULL, 15, NULL, 79),
(48, 'Carolina Pereira', '2019-04-14', 3589456123, NULL, '2020-03-04', 0, '', NULL, 15, NULL, 80),
(49, 'Mariana Carvalho', '2015-04-14', 35856848545, 3589484584, '2020-03-04', 0, '', NULL, NULL, NULL, 81),
(50, 'Ricardo Pimenta Junior', '2015-05-16', 3532958945, NULL, '2020-03-04', 0, '', NULL, NULL, NULL, 82),
(51, 'Ramiro Leão', '2017-12-05', 35889568532, NULL, '2020-03-04', 0, '', NULL, NULL, NULL, 83);

-- --------------------------------------------------------

--
-- Estrutura da tabela `classrooms`
--

DROP TABLE IF EXISTS `classrooms`;
CREATE TABLE IF NOT EXISTS `classrooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `units_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `units_id` (`units_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `classrooms`
--

INSERT INTO `classrooms` (`id`, `description`, `units_id`) VALUES
(27, 'Infantil I', 12),
(28, 'Infantil IV A', 15),
(29, 'Infantil I', 15),
(30, 'Infantil II', 15);

-- --------------------------------------------------------

--
-- Estrutura da tabela `parents`
--

DROP TABLE IF EXISTS `parents`;
CREATE TABLE IF NOT EXISTS `parents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mother` varchar(255) DEFAULT NULL,
  `father` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `parents`
--

INSERT INTO `parents` (`id`, `mother`, `father`) VALUES
(69, 'Ana Maria do Carmo', 'Roberto Vieira'),
(70, 'Maria Santos', 'Tomaz Pereira'),
(71, 'Aline Tereza', 'Marcos Ferreira'),
(76, 'Rita Pereira', 'Armando dos Santos'),
(77, 'Rita Pereira', 'Armando dos Santos'),
(78, 'Ana Viana', 'Armando José'),
(79, 'Rita da Silva', 'Arnaldo da Silva'),
(80, 'Suellen Tavares', 'Reginaldo Pereira'),
(81, 'Marina Carvalho', 'Felipe Romão'),
(82, 'Ana Carolina Santos', 'Ricardo Pimenta'),
(83, 'Bruna Leão', 'Renato Leão');

-- --------------------------------------------------------

--
-- Estrutura da tabela `units`
--

DROP TABLE IF EXISTS `units`;
CREATE TABLE IF NOT EXISTS `units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `users_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_units_users1_idx` (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `units`
--

INSERT INTO `units` (`id`, `name`, `users_id`) VALUES
(8, 'CEIM Vovó Donana', NULL),
(10, 'CEIM Vovó Iracema', 11),
(12, 'CEIM Vovó Donana', 9),
(15, 'CEMEAI', 18);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `admin` enum('0','1') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `admin`) VALUES
(8, 'Admin', 'admin@mail.com', '202cb962ac59075b964b07152d234b70', '1'),
(9, 'Rubia', 'rubia@gmail.com', '202cb962ac59075b964b07152d234b70', '0'),
(11, 'Élio', 'elio@gmail.com', '202cb962ac59075b964b07152d234b70', '0'),
(12, 'Júlio', 'juliopeluciofox@gmail.com', '83d1ca1a419fc7307742fe510f781a2e', '1'),
(13, 'Edna', 'edna@gmail.com', 'ec5dc02a6474cc095620e984af243d19', '0'),
(14, 'Eliana', 'eliana@gmail.com', '202cb962ac59075b964b07152d234b70', '0'),
(15, 'Ana Luisa', 'analuisa@hotmail.com', '202cb962ac59075b964b07152d234b70', '0'),
(16, 'Patricia', 'patricia@outlook.com.br', '202cb962ac59075b964b07152d234b70', '0'),
(17, 'Administrador Convidado', 'adm.convidado@gmail.com', 'ec5dc02a6474cc095620e984af243d19', '1'),
(18, 'Diretor Convidado', 'dir.convidado@gmail.com', 'ec5dc02a6474cc095620e984af243d19', '0');

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `addresses_has_candidates`
--
ALTER TABLE `addresses_has_candidates`
  ADD CONSTRAINT `fk_addresses_has_candidates_addresses1` FOREIGN KEY (`addresses_id`) REFERENCES `addresses` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_addresses_has_candidates_candidates1` FOREIGN KEY (`candidates_id`) REFERENCES `candidates` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `candidates`
--
ALTER TABLE `candidates`
  ADD CONSTRAINT `fk_candidates_classrooms` FOREIGN KEY (`classrooms_id`) REFERENCES `classrooms` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_candidates_parents1` FOREIGN KEY (`parents_id`) REFERENCES `parents` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_candidates_units` FOREIGN KEY (`units_id`) REFERENCES `units` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `classrooms`
--
ALTER TABLE `classrooms`
  ADD CONSTRAINT `units_id` FOREIGN KEY (`units_id`) REFERENCES `units` (`id`);

--
-- Limitadores para a tabela `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `fk_units_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
