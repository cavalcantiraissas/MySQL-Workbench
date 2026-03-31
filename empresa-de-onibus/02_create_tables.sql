USE empresa_onibus;

-- Características do veículo
CREATE TABLE onibus (
    id_onibus          INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    modelo             VARCHAR(20)     NOT NULL,
    quantidade_cadeiras INT            NOT NULL,
    banheiro           CHAR(3)         NOT NULL,
    som                CHAR(3)         NOT NULL,
    ar_condicionado    CHAR(3)         NOT NULL
);

-- Informações sobre o motorista
CREATE TABLE motorista(
id_motorista 		   INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome_motorista 		   VARCHAR(50) NOT NULL
);

-- Informações sobre o cliente
CREATE TABLE cliente(
id_cliente 			  INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome_cliente 		  VARCHAR(50) NOT NULL,
telefone			  VARCHAR(20) NOT NULL,
endereco 		      VARCHAR(100) NOT NULL,
cpf  		          VARCHAR(14) NOT NULL
);

-- Informações sobre viagem
CREATE TABLE viagem(
id_viagem 			  INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
local_partida	      VARCHAR(20) NOT NULL,
local_destino		  VARCHAR(20) NOT NULL,
valor		  		  DECIMAL(10,2) NOT NULL,
id_motorista 		  INT NOT NULL,

CONSTRAINT fk_motorista FOREIGN KEY (id_motorista)
REFERENCES motorista(id_motorista),

-- Receitas da empresa (vindas de viagens ou externas)
CREATE TABLE receita (
    id_receita INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_viagem  INT,
    descricao  VARCHAR(100),
    valor      DECIMAL(10,2) NOT NULL,
    data       DATE          NOT NULL,
    CONSTRAINT fk_receita_viagem FOREIGN KEY (id_viagem) REFERENCES viagem(id_viagem)
);

-- Despesas da empresa
CREATE TABLE despesa (
    id_despesa INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    categoria  ENUM('combustivel', 'manutencao', 'salario', 'pedagio', 'outros') NOT NULL,
    descricao  VARCHAR(100)  NOT NULL,
    valor      DECIMAL(10,2) NOT NULL,
    data       DATE          NOT NULL,
    id_viagem  INT,
    CONSTRAINT fk_despesa_viagem FOREIGN KEY (id_viagem) REFERENCES viagem(id_viagem)
);

-- Trigger: ao inserir uma viagem, registra automaticamente a receita
CREATE TRIGGER trg_receita_viagem
AFTER INSERT ON viagem
FOR EACH ROW
INSERT INTO receita (id_viagem, valor, data)
VALUES (NEW.id_viagem, NEW.valor, CURDATE());

id_cliente	  INT NOT NULL,

CONSTRAINT fk_cliente FOREIGN KEY (id_cliente)
REFERENCES cliente(id_cliente)
); 
