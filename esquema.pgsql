CREATE TABLE CORPOCELESTE (
    NOME VARCHAR(30) NOT NULL,
    TIPO CHAR(10) NOT NULL,
    CONSTRAINT PK_CORPOCELESTE
        PRIMARY KEY (NOME),
    CONSTRAINT CHECK_CORPOCELESTE_TIPO
        CHECK (TIPO IN('PLANETARIO', 'ESTRELA'))
);

CREATE TABLE SISTEMA (
    COORDENADA_X NUMERIC NOT NULL,
    COORDENADA_Y NUMERIC NOT NULL,
    NOME VARCHAR(30) NOT NULL,
    CONSTRAINT PK_SISTEMA
        PRIMARY KEY (COORDENADA_X, COORDENADA_Y),
    CONSTRAINT UNIQUE_SISTEMA
        UNIQUE (NOME)
);

CREATE TABLE ESTRELA (
    NOME VARCHAR(30) NOT NULL,
    RAIO_MEDIO NUMERIC,
    MASSA NUMERIC(38,2),
    CATEGORIA CHAR(1),
    COORDENADA_X NUMERIC NOT NULL,
    COORDENADA_Y NUMERIC NOT NULL,
    CONSTRAINT PK_ESTRELA
        PRIMARY KEY (NOME),
    CONSTRAINT FK_ESTRELA_NOME
        FOREIGN KEY (NOME)
        REFERENCES CORPOCELESTE(NOME)
        ON DELETE CASCADE,
    CONSTRAINT FK_ESTRELA_COORDENADAS
        FOREIGN KEY (COORDENADA_X, COORDENADA_Y)
        REFERENCES SISTEMA(COORDENADA_X, COORDENADA_Y)
        ON DELETE CASCADE,
    CONSTRAINT CHECK_ESTRELA_CATEGORIA
        CHECK (CATEGORIA IN('O', 'B', 'A', 'F', 'G', 'K' ,'M'))
);

CREATE TABLE CORPOPLANETARIO (
    NOME VARCHAR(30) NOT NULL,
    TIPO CHAR(20) NOT NULL,
    CONSTRAINT PK_CORPOPLANETARIO
        PRIMARY KEY (NOME),
    CONSTRAINT FK_CORPOPLANETARIO
        FOREIGN KEY (NOME)
        REFERENCES CORPOCELESTE(NOME)
        ON DELETE CASCADE,
    CONSTRAINT CHECK_CORPOPLANETARIO_TIPO
        CHECK (TIPO IN('ASTEROIDE', 'PLANETA', 'SATELITE'))
);

CREATE TABLE ASTEROIDE (
    NOME VARCHAR(30) NOT NULL,
    RAIO_MEDIO NUMERIC,
    MASSA NUMERIC(38,2),
    ESTRELA VARCHAR(30) NOT NULL,
    DISTANCIA_ESTRELA NUMERIC,
    PERIODO_ORBITAL NUMERIC,
    ROTACAO NUMERIC,
    RESPIRAVEL BOOLEAN NOT NULL, -- RETIRAR?
    CONSTRAINT PK_ASTEROIDE
        PRIMARY KEY (NOME),
    CONSTRAINT FK_ASTEROIDE_NOME
        FOREIGN KEY (NOME)
        REFERENCES CORPOPLANETARIO(NOME)
        ON DELETE CASCADE,
    CONSTRAINT FK_ASTEROIDE_ESTRELA
        FOREIGN KEY (ESTRELA)
        REFERENCES ESTRELA(NOME)
        ON DELETE CASCADE
);

CREATE TABLE PLANETA (
    NOME VARCHAR(30) NOT NULL,
    RAIO_MEDIO NUMERIC,
    MASSA NUMERIC(38,2),
    ESTRELA VARCHAR(30) NOT NULL,
    DISTANCIA_ESTRELA NUMERIC,
    CATEGORIA VARCHAR(50) NOT NULL,
    PERIODO_ORBITAL NUMERIC,
    ROTACAO NUMERIC,
    RESPIRAVEL BOOLEAN NOT NULL,
    CONSTRAINT PK_PLANETA
        PRIMARY KEY (NOME),
    CONSTRAINT FK_PLANETA_NOME
        FOREIGN KEY (NOME)
        REFERENCES CORPOPLANETARIO(NOME)
        ON DELETE CASCADE,
    CONSTRAINT FK_PLANETA_ESTRELA
        FOREIGN KEY (ESTRELA)
        REFERENCES ESTRELA(NOME)
        ON DELETE CASCADE
);

CREATE TABLE SATELITE (
    NOME VARCHAR(30) NOT NULL,
    RAIO_MEDIO NUMERIC,
    MASSA NUMERIC(40,0),
    PLANETA VARCHAR(30) NOT NULL,
    DISTANCIA_ESTRELA NUMERIC,
    CATEGORIA VARCHAR(50) NOT NULL,
    PERIODO_ORBITAL NUMERIC,
    ROTACAO NUMERIC,
    RESPIRAVEL BOOLEAN NOT NULL,
    CONSTRAINT PK_SATELITE
        PRIMARY KEY (NOME),
    CONSTRAINT FK_SATELITE_NOME
        FOREIGN KEY (NOME)
        REFERENCES CORPOPLANETARIO(NOME)
        ON DELETE CASCADE,
    CONSTRAINT FK_SATELITE_PLANETA
        FOREIGN KEY (PLANETA)
        REFERENCES PLANETA(NOME)
        ON DELETE CASCADE
);

CREATE TABLE GOVERNO (
    NOME VARCHAR(30) NOT NULL,
    TIPO_GOVERNO VARCHAR(50),
    CONSTRAINT PK_GOVERNO
        PRIMARY KEY (NOME)
);

CREATE TABLE CORPORACAO (
    CODIGO_CORPORATIVO VARCHAR(20) NOT NULL,
    NOME VARCHAR(30) NOT NULL,
    CONSTRAINT PK_CORPORACAO
        PRIMARY KEY (CODIGO_CORPORATIVO)
);

CREATE TABLE CONTRATO (
    GOVERNO VARCHAR(30) NOT NULL,
    TITULO_CONTRATO VARCHAR(40) NOT NULL,
    DATA_INICIO DATE NOT NULL,
    CORPORACAO VARCHAR(20) NOT NULL,
    DATA_LIMITE DATE,
    ENCERRADO BOOLEAN,
    CONSTRAINT PK_CONTRATO
        PRIMARY KEY (GOVERNO, TITULO_CONTRATO, DATA_INICIO),
    CONSTRAINT FK_CONTRATO_GOVERNO
        FOREIGN KEY (GOVERNO)
        REFERENCES GOVERNO(NOME)
        ON DELETE CASCADE,
    CONSTRAINT FK_CONTRATO_CORPORACAO
        FOREIGN KEY (CORPORACAO)
        REFERENCES CORPORACAO(CODIGO_CORPORATIVO)
        ON DELETE CASCADE
);

CREATE TABLE NAVE (
    NOME_EMBARCACAO VARCHAR(50) NOT NULL,
    NOME_BATISMO VARCHAR(50) NOT NULL,
    MODELO VARCHAR(50),
    ANO NUMERIC,
    CORPORACAO VARCHAR(20) NOT NULL,
    CONSTRAINT PK_NAVE
        PRIMARY KEY (NOME_EMBARCACAO),
    CONSTRAINT FK_NAVE_CORPORACAO
        FOREIGN KEY (CORPORACAO)
        REFERENCES CORPORACAO(CODIGO_CORPORATIVO)
        ON DELETE CASCADE,
    CONSTRAINT UNIQUE_NAVE_NOME_BATISMO
        UNIQUE (NOME_BATISMO)
);


CREATE TABLE RECURSO (
    NOME VARCHAR(30) NOT NULL,
    TIPO NUMERIC NOT NULL,
    VALOR VARCHAR(30) NOT NULL,
    CONSTRAINT PK_RECURSO
        PRIMARY KEY (NOME)
);


CREATE TABLE POSSUI_RECURSO (
    RECURSO VARCHAR(30) NOT NULL,
    CORPOPLANETARIO VARCHAR(30) NOT NULL,
    QUANTIDADE NUMERIC(30,3) NOT NULL,
    CONSTRAINT PK_POSSUI
        PRIMARY KEY (RECURSO, CORPOPLANETARIO),
    CONSTRAINT FK_RECURSO
        FOREIGN KEY (RECURSO)
        REFERENCES RECURSO(NOME)
        ON DELETE CASCADE,
    CONSTRAINT FK_CORPOPLANETARIO
        FOREIGN KEY (CORPOPLANETARIO)
        REFERENCES CORPOPLANETARIO(NOME)
        ON DELETE CASCADE
);

CREATE TABLE MISSAO (
    TITULO_MISSAO VARCHAR(30) NOT NULL,
    DATA_INICIO DATE NOT NULL,
    TIPO_MISSAO CHAR(10) NOT NULL,
    CONSTRAINT PK_MISSAO
        PRIMARY KEY (TITULO_MISSAO, DATA_INICIO, TIPO_MISSAO),
    CONSTRAINT CHECK_TIPO_MISSAO
        CHECK (TIPO_MISSAO IN('CONSTRUCAO', 'EXPLORACAO', 'CIENTIFICA', 'EXTRACAO'))
);
