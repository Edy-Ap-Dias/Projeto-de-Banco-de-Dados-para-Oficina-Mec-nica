create database Oficina;

use oficina;
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
