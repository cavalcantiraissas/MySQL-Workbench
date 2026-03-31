USE empresa_onibus;

-- Inserção de dados fictícios na tabela onibus
INSERT INTO onibus (modelo, quantidade_cadeiras, banheiro, som, ar_condicionado)
VALUES
    ('Marcopolo G7',    46, 'sim', 'sim', 'sim'),
    ('Volare W9',       28, 'nao', 'nao', 'sim'),
    ('Comil Campione',  50, 'nao', 'sim', 'sim'),
    ('Irizar i6',       42, 'sim', 'sim', 'sim'),
    ('Busscar El Buss', 48, 'sim', 'nao', 'nao'),
    ('Neobus Mega',     36, 'nao', 'nao', 'nao');

-- Inserção de dados fictícios na tabela motorista
INSERT INTO motorista (nome_motorista) 
VALUES 
('Carlos Alberto Silva'),
('Ana Paula Oliveira'),
('Marcos Rodrigues'),
('Fernanda Souza'),
('Ricardo Santos');

-- Inserção de dados fictícios na tabela cliente
INSERT INTO cliente (nome_cliente, telefone, endereco, cpf)
VALUES 
('João Silva', '(11) 98765-4321', 'Rua das Flores, 123 - São Paulo, SP', '123.456.789-01'),
('Maria Oliveira', '(21) 99888-7766', 'Av. Atlântica, 450 - Rio de Janeiro, RJ', '234.567.890-12'),
('Pedro Alvares', '(31) 97766-5544', 'Rua Bahia, 88 - Belo Horizonte, MG', '345.678.901-23'),
('Ana Costa', '(41) 96655-4433', 'Rua das Palmeiras, 10 - Curitiba, PR', '456.789.012-34'),
('Lucas Pereira', '(71) 95544-3322', 'Ladeira da Barra, 500 - Salvador, BA', '567.890.123-45');

-- Inserção de dados fictícios na tabela viagem
INSERT INTO viagem (local_partida, local_destino, valor, id_motorista, id_cliente) 
VALUES 
('São Paulo', 'Rio de Janeiro', 120.50, 1, 2),
('Belo Horizonte', 'Vitória', 95.00, 2, 4),
('Curitiba', 'Florianópolis', 85.00, 3, 1),
('Salvador', 'Recife', 210.00, 4, 1 ),
('Brasília', 'Goiânia', 45.90, 5, 5),
('Rio de Janeiro', 'São Paulo', 115.00, 1, 2), 
('Campinas', 'Santos', 60.00, 2, 3);

-- Inserção de receitas externas (não vinculadas a viagens)
INSERT INTO receita (id_viagem, descricao, valor, data)
VALUES
    (NULL, 'Patrocínio empresa LogBR',         1500.00, '2024-01-15'),
    (NULL, 'Aluguel de ônibus para evento',     800.00, '2024-01-22');

-- Inserção de despesas
INSERT INTO despesa (categoria, descricao, valor, data, id_viagem)
VALUES
    ('combustivel', 'Abastecimento viagem SP → RJ',         350.00, '2024-01-10', 1),
    ('pedagio',     'Pedágio viagem SP → RJ',                45.00, '2024-01-10', 1),
    ('combustivel', 'Abastecimento viagem BH → Vitória',    280.00, '2024-01-11', 2),
    ('manutencao',  'Troca de pneus Marcopolo G7',          900.00, '2024-01-12', NULL),
    ('salario',     'Salário Carlos Alberto Silva',         3500.00, '2024-01-31', NULL),
    ('salario',     'Salário Ana Paula Oliveira',           3500.00, '2024-01-31', NULL),
    ('outros',      'Material de limpeza dos veículos',      120.00, '2024-01-31', NULL);
