-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20/08/2024 às 17:54
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `agenda03_imobiliaria`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `apartamento`
--

CREATE TABLE `apartamento` (
  `Idnumero` int(10) NOT NULL,
  `tipo` char(20) NOT NULL,
  `Idcodigo` int(10) NOT NULL,
  `Idrg` int(20) NOT NULL,
  `idnumerogr` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `condominio`
--

CREATE TABLE `condominio` (
  `Idcodigo` int(10) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `enderereco` varchar(30) NOT NULL,
  `idmatricula` int(11) NOT NULL,
  `Idnumero` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `garagem`
--

CREATE TABLE `garagem` (
  `idnumerogr` int(10) NOT NULL,
  `tipo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `proprietario`
--

CREATE TABLE `proprietario` (
  `Idrg` int(20) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sindico`
--

CREATE TABLE `sindico` (
  `idmatricula` int(10) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `enderereco` varchar(30) NOT NULL,
  `telefone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `apartamento`
--
ALTER TABLE `apartamento`
  ADD PRIMARY KEY (`Idnumero`),
  ADD KEY `idrg` (`Idrg`);

--
-- Índices de tabela `condominio`
--
ALTER TABLE `condominio`
  ADD PRIMARY KEY (`Idcodigo`),
  ADD KEY `idmatricula` (`idmatricula`),
  ADD KEY `idnumero` (`Idnumero`);

--
-- Índices de tabela `proprietario`
--
ALTER TABLE `proprietario`
  ADD PRIMARY KEY (`Idrg`);

--
-- Índices de tabela `sindico`
--
ALTER TABLE `sindico`
  ADD PRIMARY KEY (`idmatricula`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `apartamento`
--
ALTER TABLE `apartamento`
  MODIFY `Idnumero` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `condominio`
--
ALTER TABLE `condominio`
  MODIFY `Idcodigo` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `proprietario`
--
ALTER TABLE `proprietario`
  MODIFY `Idrg` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `sindico`
--
ALTER TABLE `sindico`
  MODIFY `idmatricula` int(10) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `apartamento`
--
ALTER TABLE `apartamento`
  ADD CONSTRAINT `idrg` FOREIGN KEY (`Idrg`) REFERENCES `proprietario` (`Idrg`);

--
-- Restrições para tabelas `condominio`
--
ALTER TABLE `condominio`
  ADD CONSTRAINT `idnumero` FOREIGN KEY (`Idnumero`) REFERENCES `apartamento` (`Idnumero`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
