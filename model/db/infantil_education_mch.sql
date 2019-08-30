-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 30-Ago-2019 às 17:55
-- Versão do servidor: 10.1.40-MariaDB
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

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `street` varchar(255) NOT NULL,
  `number` int(11) NOT NULL,
  `neighborhood` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `addresses`
--

INSERT INTO `addresses` (`id`, `street`, `number`, `neighborhood`) VALUES
(21, 'Caetano Pelúcio', 85, 'Cavaco'),
(22, 'Jose Francisco', 15, 'Centro'),
(31, 'Armando José', 516, 'Residencial dos Nobres'),
(32, 'Bartolomeu Camargo', 48, 'Vila Centenário'),
(33, 'Avenida Oeste', 20, 'Morada da Serra'),
(34, 'Pavão', 952, 'Jardim Chamonix'),
(35, 'José Leite', 85, 'Nova Machado'),
(36, 'Rua Bélgica', 48, 'Jardim Novo Milênio'),
(37, 'Rua Madre Sebastiana', 89, 'Vila do Céu'),
(38, 'Antonieta Andrade Pedroso', 5, 'Bom Jesus'),
(39, 'Rua Renato Andrade', 98, 'Jardim das Oliveiras II');

-- --------------------------------------------------------

--
-- Estrutura da tabela `addresses_has_candidates`
--

CREATE TABLE `addresses_has_candidates` (
  `addresses_id` int(11) NOT NULL,
  `candidates_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `addresses_has_candidates`
--

INSERT INTO `addresses_has_candidates` (`addresses_id`, `candidates_id`) VALUES
(21, 6),
(22, 7),
(31, 13),
(32, 14),
(33, 15),
(34, 16),
(35, 17),
(36, 18),
(37, 19),
(38, 20),
(39, 21);

-- --------------------------------------------------------

--
-- Estrutura da tabela `candidates`
--

CREATE TABLE `candidates` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `birth_date` date NOT NULL,
  `tel1` bigint(12) NOT NULL,
  `tel2` bigint(12) DEFAULT NULL,
  `inscription_date` date NOT NULL,
  `situation` tinyint(3) NOT NULL,
  `obs` varchar(255) DEFAULT NULL,
  `conf_date` date DEFAULT NULL,
  `units_id` int(11) DEFAULT NULL,
  `parents_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `candidates`
--

INSERT INTO `candidates` (`id`, `name`, `birth_date`, `tel1`, `tel2`, `inscription_date`, `situation`, `obs`, `conf_date`, `units_id`, `parents_id`) VALUES
(6, 'Marcos Pereira', '1997-01-31', 3574512445, 3574574524, '2019-08-14', 1, ' ', '2019-08-29', 2, 21),
(7, 'Bryam Maicom', '2017-05-07', 4523564558, 84512852225, '2019-08-23', 0, ' Irmão no CEMEAI', NULL, NULL, 22),
(13, 'Kayron Martins', '2017-08-22', 3584956554, 0, '2019-08-28', 1, '    Prefere Iracema', '2019-08-29', 2, 31),
(14, 'Anna Eduarda', '2015-12-06', 3588161379, 0, '2019-08-29', 0, 'Irmão na Vovó Donana', NULL, NULL, 32),
(15, 'Livia Andrade', '2015-02-21', 35987139546, 35988076671, '2019-08-29', -1, 'Pai trabalha no Alvorada', NULL, NULL, 33),
(16, 'Miguel Henrique ', '2017-02-14', 3588225467, 0, '2019-08-29', 1, ' ', '2019-08-29', 4, 34),
(17, 'Gabriely da Silva', '2014-06-15', 35997084491, 35997073040, '2019-08-29', 1, 'Irmão no Jardim', '2019-08-29', 3, 35),
(18, 'Kethelyn Gonçalves', '2013-09-09', 35988722806, 0, '2019-08-29', 0, 'Reside na casa da Avó(Matilde).', NULL, 2, 36),
(19, 'Yuri dos Santos', '2018-03-29', 35845245546, 3589454854, '2019-08-30', -1, '', NULL, NULL, 37),
(20, 'Gabriel Lucas', '2016-08-08', 3548564852, 3548956565, '2019-08-30', 1, '', '2019-08-30', 4, 38),
(21, 'Laura Leite     ', '2015-05-10', 3523655698, 3523588984, '2019-08-30', 1, '', '2019-08-30', 4, 39);

-- --------------------------------------------------------

--
-- Estrutura da tabela `parents`
--

CREATE TABLE `parents` (
  `id` int(11) NOT NULL,
  `mother` varchar(255) DEFAULT NULL,
  `father` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `parents`
--

INSERT INTO `parents` (`id`, `mother`, `father`) VALUES
(21, 'Maria', 'Tomaz'),
(22, 'Kamila', 'Eric'),
(31, 'Sara', 'Ryan'),
(32, 'Daniela', 'Geovane'),
(33, 'Fernanda', 'Marcos'),
(34, 'Graziela', 'Eduardo'),
(35, 'Taina', 'Ronaldo'),
(36, 'Rosa', 'Erivelton'),
(37, 'Rita', 'Arnaldo'),
(38, 'Jaqueline', 'Elder'),
(39, 'Nayara', 'Michel');

-- --------------------------------------------------------

--
-- Estrutura da tabela `units`
--

CREATE TABLE `units` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `users_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `units`
--

INSERT INTO `units` (`id`, `name`, `users_id`) VALUES
(1, 'SEMED', 1),
(2, 'CEIM Vovó Donana', 2),
(3, 'CEIM Jardim das Oliveiras', 3),
(4, 'CEIM Vovó Iracema', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `admin` enum('0','1') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `admin`) VALUES
(1, 'Admin', 'admin@gmail.com', '202cb962ac59075b964b07152d234b70 ', '1'),
(2, 'Núbia', 'nubia@gmail.com', '202cb962ac59075b964b07152d234b70 ', '0'),
(3, 'Sandra', 'sandra@gmail.com', 'ec5dc02a6474cc095620e984af243d19', '0'),
(4, 'Deila', 'deila@gmail.com', 'ec5dc02a6474cc095620e984af243d19', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `addresses_has_candidates`
--
ALTER TABLE `addresses_has_candidates`
  ADD PRIMARY KEY (`addresses_id`,`candidates_id`),
  ADD KEY `fk_addresses_has_candidates_candidates1_idx` (`candidates_id`),
  ADD KEY `fk_addresses_has_candidates_addresses1_idx` (`addresses_id`);

--
-- Indexes for table `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`id`,`parents_id`),
  ADD KEY `fk_candidates_units_idx` (`units_id`),
  ADD KEY `fk_candidates_parents1_idx` (`parents_id`);

--
-- Indexes for table `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_units_users1_idx` (`users_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `candidates`
--
ALTER TABLE `candidates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `parents`
--
ALTER TABLE `parents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  ADD CONSTRAINT `fk_candidates_parents1` FOREIGN KEY (`parents_id`) REFERENCES `parents` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_candidates_units` FOREIGN KEY (`units_id`) REFERENCES `units` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `fk_units_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
