USE empresa_onibus;

-- Todos os ônibus cadastrados
SELECT * FROM onibus;

-- Ônibus com ar-condicionado
SELECT * FROM onibus WHERE ar_condicionado = 'sim';

-- Ônibus ordenados por capacidade (maior para menor)
SELECT modelo, quantidade_cadeiras
FROM onibus
ORDER BY quantidade_cadeiras DESC;
