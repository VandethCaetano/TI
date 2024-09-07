
-- Estrutura para tabela `apartamento`
--

CREATE TABLE `apartamento` (
  `id_numero_ap` int(11) NOT NULL,
  `tipo_ap` varchar(20) DEFAULT NULL,
  `id_codigo` int(5) NOT NULL,
  `valor` double(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `apartamento`
--

INSERT INTO `apartamento` (`id_numero_ap`, `tipo_ap`, `id_codigo`, `valor`) VALUES
(1, 'padão', 1, 100000.00),
(2, 'padrão', 1, 115000.00),
(3, 'padrão', 1, 115000.00),
(4, 'padrão', 1, 115000.00),
(5, 'cobertura', 1, 115000.00),
(6, 'padrão', 2, 200000.00),
(7, 'padrão', 2, 215000.00),
(8, 'padrão', 2, 215000.00),
(9, 'padrão', 2, 215000.00),
(10, 'cobertura', 2, 215000.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `condominio`
--

CREATE TABLE `condominio` (
  `id_codigo` int(11) NOT NULL,
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
  `id_numero_garagem` int(11) NOT NULL,
  `tipo_garagem` varchar(20) DEFAULT NULL,
  `id_numero_ap` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `garagem`
--

INSERT INTO `garagem` (`id_numero_garagem`, `tipo_garagem`, `id_numero_ap`) VALUES
(1, '2 vagas cobertas', 1),
(2, '2 vagas ', 2),
(3, '2 vagas ', 3),
(4, '2 vagas', 4),
(5, '2  vagas ', 5),
(6, '1 vaga coberta', 6),
(7, '1 vaga ', 7),
(8, '1 vaga ', 8),
(9, '1 vaga ', 9),
(10, '1 vaga ', 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `proprietario`
--

CREATE TABLE `proprietario` (
  `id_rg` int(11) NOT NULL,
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
  `id_pro_ap` int(11) NOT NULL,
  `id_rg` int(15) NOT NULL,
  `id_numero_ap` int(5) NOT NULL
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
  `id_matricula` int(11) NOT NULL,
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
  ADD KEY `id_codigo` (`id_codigo`);

--
-- Índices de tabela `condominio`
--
ALTER TABLE `condominio`
  ADD PRIMARY KEY (`id_codigo`),
  ADD KEY `id_matricula` (`id_matricula`);

--
-- Índices de tabela `garagem`
--
ALTER TABLE `garagem`
  ADD PRIMARY KEY (`id_numero_garagem`),
  ADD KEY `id_numero_ap` (`id_numero_ap`);

--
-- Índices de tabela `proprietario`
--
ALTER TABLE `proprietario`
  ADD PRIMARY KEY (`id_rg`);

--
-- Índices de tabela `proprietario_apartamento`
--
ALTER TABLE `proprietario_apartamento`
  ADD PRIMARY KEY (`id_pro_ap`),
  ADD KEY `id_rg` (`id_rg`),
  ADD KEY `id_numero_ap` (`id_numero_ap`);

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
  MODIFY `id_numero_ap` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `condominio`
--
ALTER TABLE `condominio`
  MODIFY `id_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `garagem`
--
ALTER TABLE `garagem`
  MODIFY `id_numero_garagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `proprietario`
--
ALTER TABLE `proprietario`
  MODIFY `id_rg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=789123457;

--
-- AUTO_INCREMENT de tabela `proprietario_apartamento`
--
ALTER TABLE `proprietario_apartamento`
  MODIFY `id_pro_ap` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `sindico`
--
ALTER TABLE `sindico`
  MODIFY `id_matricula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--

-- Restrições para tabelas `apartamento`
--
ALTER TABLE `apartamento`
  ADD CONSTRAINT `apartamento_ibfk_1` FOREIGN KEY (`id_codigo`) REFERENCES `condominio` (`id_codigo`);

--
-- Restrições para tabelas `condominio`
--
ALTER TABLE `condominio`
  ADD CONSTRAINT `condominio_ibfk_1` FOREIGN KEY (`id_matricula`) REFERENCES `sindico` (`id_matricula`);

--
-- Restrições para tabelas `garagem`
--
ALTER TABLE `garagem`
  ADD CONSTRAINT `garagem_ibfk_1` FOREIGN KEY (`id_numero_ap`) REFERENCES `apartamento` (`id_numero_ap`);

--
-- Restrições para tabelas `proprietario_apartamento`
--
ALTER TABLE `proprietario_apartamento`
  ADD CONSTRAINT `proprietario_apartamento_ibfk_1` FOREIGN KEY (`id_rg`) REFERENCES `proprietario` (`id_rg`),
  ADD CONSTRAINT `proprietario_apartamento_ibfk_2` FOREIGN KEY (`id_numero_ap`) REFERENCES `apartamento` (`id_numero_ap`);
COMMIT;


