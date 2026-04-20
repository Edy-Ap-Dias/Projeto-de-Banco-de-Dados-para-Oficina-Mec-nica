---

# 🛠️ Projeto de Banco de Dados para Oficina Mecânica

## 📌 Descrição do Projeto
Este projeto tem como objetivo a modelagem e implementação de um banco de dados para o contexto de uma **oficina mecânica**.  
O sistema foi projetado para gerenciar clientes, veículos, serviços, ordens de serviço, mecânicos e execuções de tarefas, garantindo organização e eficiência no controle das operações da oficina.

---

## 📐 Esquema Lógico (Modelo Relacional)

**Entidades e Relacionamentos:**
- **Cliente**: armazena informações dos clientes.
- **Veículo**: vinculado ao cliente, com dados de identificação.
- **Serviço**: catálogo de serviços oferecidos pela oficina.
- **Ordem_Serviço**: documento que registra os serviços solicitados.
- **Itens_Ordem**: detalhamento dos serviços dentro de uma ordem.
- **Mecânico**: profissionais responsáveis pela execução dos serviços.
- **Execução**: vincula mecânicos aos itens de ordem, com horas trabalhadas.

---

## 📜 Script SQL de Criação

```sql
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco VARCHAR(200)
);

CREATE TABLE Veiculo (
    id_veiculo INT PRIMARY KEY AUTO_INCREMENT,
    placa VARCHAR(10) UNIQUE NOT NULL,
    modelo VARCHAR(50),
    ano INT,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Servico (
    id_servico INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL,
    valor_base DECIMAL(10,2) NOT NULL
);

CREATE TABLE Ordem_Servico (
    id_ordem INT PRIMARY KEY AUTO_INCREMENT,
    data_emissao DATE NOT NULL,
    status VARCHAR(20),
    id_cliente INT,
    id_veiculo INT,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo)
);

CREATE TABLE Itens_Ordem (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_ordem INT,
    id_servico INT,
    quantidade INT,
    valor_total DECIMAL(10,2),
    FOREIGN KEY (id_ordem) REFERENCES Ordem_Servico(id_ordem),
    FOREIGN KEY (id_servico) REFERENCES Servico(id_servico)
);

CREATE TABLE Mecanico (
    id_mecanico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50)
);

CREATE TABLE Execucao (
    id_execucao INT PRIMARY KEY AUTO_INCREMENT,
    id_item INT,
    id_mecanico INT,
    horas_trabalhadas DECIMAL(5,2),
    FOREIGN KEY (id_item) REFERENCES Itens_Ordem(id_item),
    FOREIGN KEY (id_mecanico) REFERENCES Mecanico(id_mecanico)
);
```

---

## 📥 Inserção de Dados 

```sql
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
```

---

## 🔎 Consultas SQL / Queries Complexas.sql

### 1. Recuperação simples
```sql
SELECT nome, telefone FROM Cliente;
```

### 2. Filtro com WHERE
```sql
SELECT * FROM Veiculo WHERE ano < 2015;
```

### 3. Atributo derivado (valor total da ordem)
```sql
SELECT id_ordem, SUM(valor_total) AS valor_ordem
FROM Itens_Ordem
GROUP BY id_ordem;
```

### 4. Ordenação
```sql
SELECT nome, especialidade FROM Mecanico ORDER BY nome ASC;
```

### 5. HAVING (ordens acima de R$400)
```sql
SELECT id_ordem, SUM(valor_total) AS total
FROM Itens_Ordem
GROUP BY id_ordem
HAVING SUM(valor_total) > 400;
```

### 6. Junção entre tabelas
```sql
SELECT c.nome AS cliente, v.modelo, s.descricao, i.valor_total
FROM Cliente c
JOIN Veiculo v ON c.id_cliente = v.id_cliente
JOIN Ordem_Servico o ON c.id_cliente = o.id_cliente
JOIN Itens_Ordem i ON o.id_ordem = i.id_ordem
JOIN Servico s ON i.id_servico = s.id_servico;
```

---

## 📘 Estrutura do Repositório

```
📂 Oficina-BD
 ┣ 📜 README.md
 ┣ 📜 esquema_logico.png (opcional - diagrama ER)
 ┣ 📜 script_criacao.sql
 ┣ 📜 inserts_teste.sql
 ┣ 📜 consultas.sql
```

