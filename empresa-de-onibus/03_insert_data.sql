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
