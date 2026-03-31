USE empresa_onibus;

-- ============================================================
-- QUERY 01: Todos os ônibus cadastrados
-- ============================================================
SELECT * FROM onibus;

-- ============================================================
-- QUERY 02: Todos os motoristas cadastrados
-- ============================================================
SELECT * FROM motorista;

-- ============================================================
-- QUERY 03: Todos os clientes cadastrados
-- ============================================================
SELECT * FROM cliente;

-- ============================================================
-- QUERY 04: Todas as viagens cadastradas
-- ============================================================
SELECT * FROM viagem;

-- ============================================================
-- QUERY 05: Todas as receitas (viagens + externas)
-- ============================================================
SELECT * FROM receita;

-- ============================================================
-- QUERY 06: Todas as despesas
-- ============================================================
SELECT * FROM despesa;

-- ============================================================
-- QUERY 07: Ônibus com ar-condicionado
-- ============================================================
SELECT * FROM onibus WHERE ar_condicionado = 'sim';

-- ============================================================
-- QUERY 08: Ônibus ordenados por capacidade (maior para menor)
-- ============================================================
SELECT modelo, quantidade_cadeiras
FROM onibus
ORDER BY quantidade_cadeiras DESC;

-- ============================================================
-- QUERY 09: Viagens com nome do motorista e do cliente
-- ============================================================
SELECT
    v.id_viagem,
    v.local_partida,
    v.local_destino,
    v.valor,
    m.nome_motorista,
    c.nome_cliente
FROM viagem v
JOIN motorista m ON v.id_motorista = m.id_motorista
JOIN cliente   c ON v.id_cliente   = c.id_cliente;

-- ============================================================
-- QUERY 10: Total de receitas x total de despesas
-- ============================================================
SELECT
    (SELECT SUM(valor) FROM receita) AS total_receitas,
    (SELECT SUM(valor) FROM despesa) AS total_despesas,
    (SELECT SUM(valor) FROM receita) - 
    (SELECT SUM(valor) FROM despesa) AS saldo;

-- ============================================================
-- QUERY 11: Despesas agrupadas por categoria
-- ============================================================
SELECT categoria, SUM(valor) AS total
FROM despesa
GROUP BY categoria
ORDER BY total DESC;
