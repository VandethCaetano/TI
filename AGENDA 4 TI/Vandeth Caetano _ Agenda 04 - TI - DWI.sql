-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29/08/2024 às 17:08
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
-- Banco de dados: `agenda04_imobiliaria`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `apartamento`
--

CREATE TABLE `apartamento` (
  `id_numero_ap` int(5) NOT NULL,
  `tipo_ap` char(20) DEFAULT NULL,
  `id_codigo` int(10) NOT NULL,
  `id_numero_garagem` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `apartamento`
--

INSERT INTO `apartamento` (`id_numero_ap`, `tipo_ap`, `id_codigo`, `id_numero_garagem`) VALUES
(1, 'cobertura', 1, 1),
(2, '1 º andar', 1, 2),
(3, '2º andar', 1, 3),
(4, '3º andar', 1, 4),
(5, '4º andar', 1, 5),
(6, 'cobertura', 2, 6),
(7, '5º andar', 2, 7),
(8, '6º andar', 2, 8),
(9, '7º andar', 2, 9),
(10, '8º andar', 2, 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `condominio`
--

CREATE TABLE `condominio` (
  `id_codigo` int(5) NOT NULL,
  `nome` varchar(80) DEFAULT NULL,
  `endereco` varchar(50) DEFAULT NULL,
  `id_matricula` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `condominio`
--

INSERT INTO `condominio` (`id_codigo`, `nome`, `endereco`, `id_matricula`) VALUES
(1, '[Sol Nascente]', '[Avenida Franca nº9 Centro SP]', 1),
(2, '[Vale Verde]', '[Rua Sem nome nº2340 Praça Bom  SP]', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `garagem`
--

CREATE TABLE `garagem` (
  `id_numero_garagem` int(10) NOT NULL,
  `tipo_garagem` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `garagem`
--

INSERT INTO `garagem` (`id_numero_garagem`, `tipo_garagem`) VALUES
(1, '2 vagas cobertas'),
(2, '2 vagas '),
(3, '2 vagas '),
(4, '2 vagas'),
(5, '2  vagas '),
(6, '1 vaga coberta'),
(7, '1 vaga '),
(8, '1 vaga '),
(9, '1 vaga '),
(10, '1 vaga ');

-- --------------------------------------------------------

--
-- Estrutura para tabela `proprietario`
--

CREATE TABLE `proprietario` (
  `id_rg` int(15) NOT NULL,
  `nome` varchar(80) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `proprietario`
--

INSERT INTO `proprietario` (`id_rg`, `nome`, `telefone`, `email`) VALUES
(103456230, 'Tomas Augusto Salim', '(11)00203-0450', 'tomas@gmail'),
(123456789, 'Paulo Lopes', '(11)09009-0909', 'paulol@gmail'),
(147258369, 'Medeiros Franca', '(11)04001-0001', 'franca@gmail'),
(321654987, 'Maria de Fatima Tom', '(11)05000-0505', 'tom@gmail'),
(369852147, 'Ana Sabia', '(11)00012-1200', 'sabia@gmail'),
(456789123, 'Junior Medeiros', '(11)03003-0090', 'mediros@gmail'),
(654321789, 'Larissa Silva', '(11)08000-0404', 'silva@gmail'),
(789123456, 'Paulina Alencar', '(11)010100-101', 'paula@gmail');

-- --------------------------------------------------------

--
-- Estrutura para tabela `proprietario_apartamento`
--

CREATE TABLE `proprietario_apartamento` (
  `id_pro_ap` int(3) NOT NULL,
  `id_rg` int(15) NOT NULL,
  `id_numero_ap` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `proprietario_apartamento`
--

INSERT INTO `proprietario_apartamento` (`id_pro_ap`, `id_rg`, `id_numero_ap`) VALUES
(1, 103456230, 1),
(2, 123456789, 2),
(3, 147258369, 3),
(5, 321654987, 5),
(6, 369852147, 6),
(7, 456789123, 7),
(8, 654321789, 8),
(9, 789123456, 9);

-- --------------------------------------------------------

--
-- Estrutura para tabela `sindico`
--

CREATE TABLE `sindico` (
  `id_matricula` int(3) NOT NULL,
  `nome` varchar(80) DEFAULT NULL,
  `endereco` varchar(80) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `sindico`
--

INSERT INTO `sindico` (`id_matricula`, `nome`, `endereco`, `telefone`) VALUES
(1, '[Marcos Fernandes Souza]', '[Rua Pompeu Cifra nº54 Jd. Ana Francis SP]', '[(11) 00900-010'),
(2, '[Maria Marthins de Luca]', '[Avenida Padre Soma s/n Centro SP]', '[(11)0080-01002');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `apartamento`
--
ALTER TABLE `apartamento`
  ADD PRIMARY KEY (`id_numero_ap`),
  ADD KEY `codigo` (`id_codigo`),
  ADD KEY `id_numero_garagem` (`id_numero_garagem`);

--
-- Índices de tabela `condominio`
--
ALTER TABLE `condominio`
  ADD PRIMARY KEY (`id_codigo`),
  ADD KEY `id_matricula` (`id_matricula`) USING BTREE;

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
-- Índices de tabela `proprietario_apartamento`
--
ALTER TABLE `proprietario_apartamento`
  ADD KEY `id_numero_ap` (`id_numero_ap`),
  ADD KEY `id_rg` (`id_rg`);

--
-- Índices de tabela `sindico`
--
ALTER TABLE `sindico`
  ADD PRIMARY KEY (`id_matricula`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `proprietario_apartamento`
--
ALTER TABLE `proprietario_apartamento`
  ADD CONSTRAINT `id_numero_ap` FOREIGN KEY (`id_numero_ap`) REFERENCES `apartamento` (`id_numero_ap`),
  ADD CONSTRAINT `id_rg` FOREIGN KEY (`id_rg`) REFERENCES `proprietario` (`id_rg`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
