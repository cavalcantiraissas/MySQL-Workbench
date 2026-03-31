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


-- Inserção de dados fictícios na tabela viagem
INSERT INTO viagem (local_partida, local_destino, valor, id_motorista) 
VALUES 
('São Paulo', 'Rio de Janeiro', 120.50, 1),
('Belo Horizonte', 'Vitória', 95.00, 2),
('Curitiba', 'Florianópolis', 85.00, 3),
('Salvador', 'Recife', 210.00, 4),
('Brasília', 'Goiânia', 45.90, 5),
('Rio de Janeiro', 'São Paulo', 115.00, 1), 
('Campinas', 'Santos', 60.00, 2);
