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

-- Informações sobre viagem
CREATE TABLE viagem(
id_viagem 			  INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
local_partida	      VARCHAR(20) NOT NULL,
local_destino		  VARCHAR(20) NOT NULL,
valor		  		  DECIMAL(10,2) NOT NULL,
id_motorista 		  INT NOT NULL,

CONSTRAINT fk_motorista FOREIGN KEY (id_motorista)
REFERENCES motorista(id_motorista)
); 
