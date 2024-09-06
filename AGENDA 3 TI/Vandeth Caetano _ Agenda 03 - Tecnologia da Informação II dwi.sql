-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20/08/2024 às 22:06
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
  `id_numero_ap` int(10) NOT NULL,
  `tipo_ap` char(20) DEFAULT NULL,
  `id_codigo` int(10) NOT NULL,
  `id_rg` int(20) NOT NULL,
  `id_numero_garagem` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `condominio`
--

CREATE TABLE `condominio` (
  `id_codigo` int(10) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `enderereco` varchar(30) DEFAULT NULL,
  `id_matricula` int(11) NOT NULL,
  `id_numero_ap` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `garagem`
--

CREATE TABLE `garagem` (
  `id_numero_garagem` int(10) NOT NULL,
  `tipo_garagem` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `proprietario`
--

CREATE TABLE `proprietario` (
  `id_rg` int(20) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sindico`
--

CREATE TABLE `sindico` (
  `id_matricula` int(10) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `enderereco` varchar(30) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `apartamento`
--
ALTER TABLE `apartamento`
  ADD PRIMARY KEY (`id_numero_ap`),
  ADD KEY `codigo` (`id_codigo`),
  ADD KEY `id_numero_garagem` (`id_numero_garagem`),
  ADD KEY `id_rg` (`id_rg`);

--
-- Índices de tabela `condominio`
--
ALTER TABLE `condominio`
  ADD PRIMARY KEY (`id_codigo`),
  ADD KEY `id_matricula` (`id_matricula`) USING BTREE,
  ADD KEY `id_numero_ap` (`id_numero_ap`);

--
-- Índices de tabela `garagem`
--
ALTER TABLE `garagem`
  ADD PRIMARY KEY (`id_numero_garagem`);

--
-- Índices de tabela `proprietario`
--
ALTER TABLE `proprietario`
  ADD PRIMARY KEY (`id_rg`);

--
-- Índices de tabela `sindico`
--
ALTER TABLE `sindico`
  ADD PRIMARY KEY (`id_matricula`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `apartamento`
--
ALTER TABLE `apartamento`
  MODIFY `id_numero_ap` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `condominio`
--
ALTER TABLE `condominio`
  MODIFY `id_codigo` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `garagem`
--
ALTER TABLE `garagem`
  MODIFY `id_numero_garagem` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `proprietario`
--
ALTER TABLE `proprietario`
  MODIFY `id_rg` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `sindico`
--
ALTER TABLE `sindico`
  MODIFY `id_matricula` int(10) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `apartamento`
--
ALTER TABLE `apartamento`
  ADD CONSTRAINT `id_numero_garagem` FOREIGN KEY (`id_numero_garagem`) REFERENCES `apartamento` (`id_numero_ap`),
  ADD CONSTRAINT `id_rg` FOREIGN KEY (`id_rg`) REFERENCES `proprietario` (`id_rg`);

--
-- Restrições para tabelas `condominio`
--
ALTER TABLE `condominio`
  ADD CONSTRAINT `id_matricula` FOREIGN KEY (`id_matricula`) REFERENCES `sindico` (`id_matricula`),
  ADD CONSTRAINT `id_numero_ap` FOREIGN KEY (`id_numero_ap`) REFERENCES `apartamento` (`id_numero_ap`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
