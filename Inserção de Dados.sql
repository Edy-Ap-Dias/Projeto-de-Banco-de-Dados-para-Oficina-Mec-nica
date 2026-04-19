INSERT INTO Cliente (nome, telefone, email, endereco)
VALUES ('João Silva', '16999999999', 'joao@email.com', 'Rua A, 123');

INSERT INTO Veiculo (placa, modelo, ano, id_cliente)
VALUES ('ABC1234', 'Fiat Uno', 2010, 1);

INSERT INTO Servico (descricao, valor_base)
VALUES ('Troca de óleo', 150.00), ('Revisão completa', 500.00);

INSERT INTO Ordem_Servico (data_emissao, status, id_cliente, id_veiculo)
VALUES ('2026-04-19', 'Aberta', 1, 1);

INSERT INTO Itens_Ordem (id_ordem, id_servico, quantidade, valor_total)
VALUES (1, 1, 1, 150.00), (1, 2, 1, 500.00);

INSERT INTO Mecanico (nome, especialidade)
VALUES ('Carlos Mecânico', 'Motor'), ('Ana Técnica', 'Elétrica');

INSERT INTO Execucao (id_item, id_mecanico, horas_trabalhadas)
VALUES (1, 1, 2.5), (2, 2, 5.0);
