USE empresa_onibus;

-- Características do veículo
CREATE TABLE onibus (
    id_onibus           INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    modelo              VARCHAR(20)     NOT NULL,
    quantidade_cadeiras INT             NOT NULL,
    banheiro            ENUM('Sim', 'Não'),
    som                 ENUM('Sim', 'Não'),
    ar_condicionado     ENUM('Sim', 'Não'),
    disponibilidade     ENUM('Disponível', 'Manutenção', 'Em Viagem') NOT NULL
);

-- Informações sobre o motorista
CREATE TABLE motorista (
    id_motorista   INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome_motorista VARCHAR(50)     NOT NULL,
    numero_cnh     VARCHAR(11)     NOT NULL UNIQUE,
    validade_cnh   DATE            NOT NULL, 
    telefone       VARCHAR(20)     NOT NULL  
);

-- Informações sobre o cliente
CREATE TABLE cliente (
    id_cliente   INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome_cliente VARCHAR(50)  NOT NULL,
    telefone     VARCHAR(20)  NOT NULL,
    endereco     VARCHAR(100) NOT NULL,
    cpf          VARCHAR(14)  NOT NULL UNIQUE
);

-- Informações sobre viagem
CREATE TABLE viagem (
    id_viagem     INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    data_partida  DATETIME 		 NOT NULL,
    data_retorno  DATETIME 		 NOT NULL,
    local_partida VARCHAR(100)    NOT NULL,
    local_destino VARCHAR(100)    NOT NULL,
    valor         DECIMAL(10,2)  NOT NULL,
	status        ENUM('Pendente', 'Confirmada', 'Em Andamento', 'Concluída', 'Cancelada') NOT NULL DEFAULT 'Confirmada',
    id_motorista  INT            NOT NULL,
    id_cliente    INT            NOT NULL,
    id_onibus     INT            NOT NULL,
    CONSTRAINT fk_onibus    FOREIGN KEY (id_onibus)    REFERENCES onibus(id_onibus),
    CONSTRAINT fk_motorista FOREIGN KEY (id_motorista) REFERENCES motorista(id_motorista),
    CONSTRAINT fk_cliente   FOREIGN KEY (id_cliente)   REFERENCES cliente(id_cliente)
); CREATE INDEX idx_conflito ON viagem (id_onibus, data_partida, data_retorno);

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

