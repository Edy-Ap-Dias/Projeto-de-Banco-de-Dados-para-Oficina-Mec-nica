-- 1. Recuperação simples: listar clientes
SELECT id_cliente, nome, telefone, email
FROM Cliente;

-- 2. Filtro com WHERE: veículos fabricados antes de 2015
SELECT id_veiculo, placa, modelo, ano
FROM Veiculo
WHERE ano < 2015;

-- 3. Atributo derivado: calcular valor total de cada ordem de serviço
SELECT id_ordem, SUM(valor_total) AS valor_ordem
FROM Itens_Ordem
GROUP BY id_ordem;

-- 4. Ordenação: listar mecânicos em ordem alfabética
SELECT id_mecanico, nome, especialidade
FROM Mecanico
ORDER BY nome ASC;

-- 5. HAVING: ordens de serviço com valor total acima de R$400
SELECT id_ordem, SUM(valor_total) AS total
FROM Itens_Ordem
GROUP BY id_ordem
HAVING SUM(valor_total) > 400;

-- 6. Junção entre tabelas: mostrar cliente, veículo, serviço e valor
SELECT c.nome AS cliente,
       v.modelo AS veiculo,
       s.descricao AS servico,
       i.valor_total AS valor
FROM Cliente c
JOIN Veiculo v ON c.id_cliente = v.id_cliente
JOIN Ordem_Servico o ON c.id_cliente = o.id_cliente
JOIN Itens_Ordem i ON o.id_ordem = i.id_ordem
JOIN Servico s ON i.id_servico = s.id_servico;

-- 7. Junção com Execução: horas trabalhadas por mecânico em cada ordem
SELECT o.id_ordem,
       m.nome AS mecanico,
       SUM(e.horas_trabalhadas) AS horas_totais
FROM Execucao e
JOIN Itens_Ordem i ON e.id_item = i.id_item
JOIN Ordem_Servico o ON i.id_ordem = o.id_ordem
JOIN Mecanico m ON e.id_mecanico = m.id_mecanico
GROUP BY o.id_ordem, m.nome;

-- 8. Consulta mais complexa: valor médio dos serviços por cliente
SELECT c.nome AS cliente,
       AVG(i.valor_total) AS valor_medio_servicos
FROM Cliente c
JOIN Ordem_Servico o ON c.id_cliente = o.id_cliente
JOIN Itens_Ordem i ON o.id_ordem = i.id_ordem
GROUP BY c.nome
ORDER BY valor_medio_servicos DESC;
