USE empresa_onibus;

-- Tabela: características do veículo
CREATE TABLE onibus (
    id_onibus          INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    modelo             VARCHAR(20)     NOT NULL,
    quantidade_cadeiras INT            NOT NULL,
    banheiro           CHAR(3)         NOT NULL,
    som                CHAR(3)         NOT NULL,
    ar_condicionado    CHAR(3)         NOT NULL
);
