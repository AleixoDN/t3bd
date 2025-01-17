CREATE TABLE CORPOCELESTE (
    NOME VARCHAR(30) NOT NULL,
    TIPO CHAR(10) NOT NULL,
    CONSTRAINT PK_CORPOCELESTE
        PRIMARY KEY (NOME),
    CONSTRAINT CHECK_CORPOCELESTE_TIPO
        CHECK (TIPO IN('PLANETARIO', 'ESTRELA'))
);

CREATE TABLE SISTEMA (
    COORDENADA_X NUMERIC(8,2) NOT NULL,
    COORDENADA_Y NUMERIC(8,2) NOT NULL,
    NOME VARCHAR(30) NOT NULL,
    CONSTRAINT PK_SISTEMA
        PRIMARY KEY (COORDENADA_X, COORDENADA_Y),
    CONSTRAINT UNIQUE_SISTEMA
        UNIQUE (NOME)
);

CREATE TABLE ESTRELA (
    NOME VARCHAR(30) NOT NULL,
    RAIO_MEDIO NUMERIC(12,2),
    MASSA NUMERIC(38,2),
    CATEGORIA CHAR(1),
    COORDENADA_X NUMERIC(8,2) NOT NULL,
    COORDENADA_Y NUMERIC(8,2) NOT NULL,
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
    RAIO_MEDIO NUMERIC(12,2),
    MASSA NUMERIC(38,2),
    ESTRELA VARCHAR(30) NOT NULL,
    DISTANCIA_ESTRELA NUMERIC(20,2),
    PERIODO_ORBITAL NUMERIC(10,2),
    ROTACAO NUMERIC(10,2),
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
    RAIO_MEDIO NUMERIC(12,2),
    MASSA NUMERIC(38,2),
    ESTRELA VARCHAR(30) NOT NULL,
    DISTANCIA_ESTRELA NUMERIC(20,2),
    CATEGORIA VARCHAR(50) NOT NULL,
    PERIODO_ORBITAL NUMERIC(10,2),
    ROTACAO NUMERIC(10,2),
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
    RAIO_MEDIO NUMERIC(12,2),
    MASSA NUMERIC(38,2),
    PLANETA VARCHAR(30) NOT NULL,
    DISTANCIA_ESTRELA NUMERIC(20,2),
    CATEGORIA VARCHAR(50) NOT NULL,
    PERIODO_ORBITAL NUMERIC(10,2),
    ROTACAO NUMERIC(10,2),
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
    TITULO_CONTRATO VARCHAR(50) NOT NULL,
    DATA_INICIO DATE NOT NULL,
    CORPORACAO VARCHAR(20),
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
    ANO NUMERIC(5,0),
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
    NOME VARCHAR(50) NOT NULL,
    VALOR NUMERIC(10,2) NOT NULL,
    TIPO VARCHAR(30) NOT NULL,
    CONSTRAINT PK_RECURSO
        PRIMARY KEY (NOME)
);


CREATE TABLE POSSUI_RECURSO (
    RECURSO VARCHAR(50) NOT NULL,
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
    TITULO_MISSAO VARCHAR(60) NOT NULL,
    DATA_INICIO DATE NOT NULL,
    TIPO_MISSAO CHAR(10) NOT NULL,
    CONSTRAINT PK_MISSAO
        PRIMARY KEY (TITULO_MISSAO, DATA_INICIO, TIPO_MISSAO),
    CONSTRAINT CHECK_TIPO_MISSAO
        CHECK (TIPO_MISSAO IN('CONSTRUCAO', 'EXPLORACAO', 'CIENTIFICA', 'EXTRACAO'))
);

CREATE TABLE PARTICIPA (
    TITULO_MISSAO VARCHAR(60) NOT NULL,
    DATA_INICIO DATE NOT NULL,
    TIPO_MISSAO CHAR(10) NOT NULL, 
    NAVE VARCHAR(50) NOT NULL,
    CONSTRAINT PK_PARTICIPA
        PRIMARY KEY (TITULO_MISSAO, DATA_INICIO, TIPO_MISSAO, NAVE),
    CONSTRAINT FK_PARTICIPA
        FOREIGN KEY (TITULO_MISSAO, DATA_INICIO, TIPO_MISSAO)
        REFERENCES MISSAO(TITULO_MISSAO, DATA_INICIO, TIPO_MISSAO)
        ON DELETE CASCADE,
    CONSTRAINT FK_NAVE_PARTICIPA
        FOREIGN KEY (NAVE)
        REFERENCES NAVE(NOME_EMBARCACAO)
        ON DELETE CASCADE
);

-- MISSAO TIPO CONSTRUCAO DE ESTACAO
CREATE TABLE CONSTRUCAO_ESTACAO (
    TITULO_MISSAO VARCHAR(60) NOT NULL,
    DATA_INICIO DATE NOT NULL,
    TIPO_MISSAO CHAR(10) NOT NULL, 
    GOVERNO VARCHAR(30) NOT NULL,
    TITULO_CONTRATO VARCHAR(50) NOT NULL,
    DATA_INICIO_CONTRATO DATE NOT NULL,
    CORPO_PLANETARIO VARCHAR(30) NOT NULL,
    DATA_LIMITE DATE,
    STATUS CHAR(10),
    TIPO_ESTACAO VARCHAR(50),
    CONSTRAINT PK_CONSTRUCAO_ESTACAO
        PRIMARY KEY (TITULO_MISSAO, DATA_INICIO, TIPO_MISSAO),
    CONSTRAINT FK_CONSTRUCAO_ESTACAO_MISSAO
        FOREIGN KEY (TITULO_MISSAO, DATA_INICIO, TIPO_MISSAO)
        REFERENCES MISSAO(TITULO_MISSAO, DATA_INICIO, TIPO_MISSAO)
        ON DELETE CASCADE,
    CONSTRAINT FK_CONTRUCAO_ESTACAO_CONTRATO
        FOREIGN KEY (GOVERNO, TITULO_CONTRATO, DATA_INICIO_CONTRATO)
        REFERENCES CONTRATO(GOVERNO, TITULO_CONTRATO, DATA_INICIO)
        ON DELETE CASCADE,
    CONSTRAINT CHECK_CONSTRUCAO_ESTACAO_STATUS
        CHECK (STATUS IN('A INICIAR', 'ATIVA', 'FINALIZADA', 'CANCELADA'))
);

-- MISSAO TIPO EXPLORACAO E RECONHECIMENTO
CREATE TABLE EXPLORACAO_RECONHECIMENTO (
    TITULO_MISSAO VARCHAR(60) NOT NULL,
    DATA_INICIO DATE NOT NULL,
    TIPO_MISSAO CHAR(10) NOT NULL, 
    GOVERNO VARCHAR(30) NOT NULL,
    TITULO_CONTRATO VARCHAR(50) NOT NULL,
    DATA_INICIO_CONTRATO DATE NOT NULL,
    CORPO_PLANETARIO VARCHAR(30) NOT NULL,
    DATA_LIMITE DATE,
    STATUS CHAR(10),
    CONSTRAINT PK_EXPLORACAO_RECONHECIMENTO
        PRIMARY KEY (TITULO_MISSAO, DATA_INICIO, TIPO_MISSAO),
    CONSTRAINT FK_EXPLORACAO_RECONHECIMENTO_MISSAO
        FOREIGN KEY (TITULO_MISSAO, DATA_INICIO, TIPO_MISSAO)
        REFERENCES MISSAO(TITULO_MISSAO, DATA_INICIO, TIPO_MISSAO)
        ON DELETE CASCADE,
    CONSTRAINT FK_EXPLORACAO_RECONHECIMENTO_CONTRATO
        FOREIGN KEY (GOVERNO, TITULO_CONTRATO, DATA_INICIO_CONTRATO)
        REFERENCES CONTRATO(GOVERNO, TITULO_CONTRATO, DATA_INICIO)
        ON DELETE CASCADE,
    CONSTRAINT CHECK_EXPLORACAO_RECONHECIMENTO_STATUS
        CHECK (STATUS IN('A INICIAR', 'ATIVA', 'FINALIZADA', 'CANCELADA'))
);

CREATE TABLE DADOS_COLETADOS (
    TITULO_MISSAO VARCHAR(60) NOT NULL,
    DATA_INICIO DATE NOT NULL,
    TIPO_MISSAO CHAR(10) NOT NULL,
    DADO_COLETADO VARCHAR(100) NOT NULL,
    CONSTRAINT PK_DADOS_COLETADOS
        PRIMARY KEY (TITULO_MISSAO, DATA_INICIO, TIPO_MISSAO, DADO_COLETADO),
    CONSTRAINT FK_DADOS_COLETADOS_EXPLORACAO_RECONHECIMENTO
        FOREIGN KEY (TITULO_MISSAO, DATA_INICIO, TIPO_MISSAO)
        REFERENCES EXPLORACAO_RECONHECIMENTO(TITULO_MISSAO, DATA_INICIO, TIPO_MISSAO)
        ON DELETE CASCADE
);

-- MISSAO TIPO PESQUISA CIENTIFICA
CREATE TABLE PESQ_CIENTIFICA (
    TITULO_MISSAO VARCHAR(60) NOT NULL,
    DATA_INICIO DATE NOT NULL,
    TIPO_MISSAO CHAR(10) NOT NULL,
    GOVERNO VARCHAR(30) NOT NULL,
    TITULO_CONTRATO VARCHAR(50) NOT NULL,
    DATA_INICIO_CONTRATO DATE NOT NULL,
    CORPO_PLANETARIO VARCHAR(30) NOT NULL,
    DATA_LIMITE DATE,
    STATUS CHAR(10),
    CONSTRAINT PK_PESQ_CIENTIFICA
        PRIMARY KEY (TITULO_MISSAO, DATA_INICIO, TIPO_MISSAO),
    CONSTRAINT FK_PESQ_CIENTIFICA_MISSAO
        FOREIGN KEY (TITULO_MISSAO, DATA_INICIO, TIPO_MISSAO)
        REFERENCES MISSAO(TITULO_MISSAO, DATA_INICIO, TIPO_MISSAO)
        ON DELETE CASCADE,
    CONSTRAINT FK_PESQ_CIENTIFICA_CONTRATO
        FOREIGN KEY (GOVERNO, TITULO_CONTRATO, DATA_INICIO_CONTRATO)
        REFERENCES CONTRATO(GOVERNO, TITULO_CONTRATO, DATA_INICIO)
        ON DELETE CASCADE,
    CONSTRAINT CHECK_PESQ_CIENTIFICA_STATUS
        CHECK (STATUS IN('A INICIAR', 'ATIVA', 'FINALIZADA', 'CANCELADA'))
);

CREATE TABLE PESQUISAS (
    TITULO_MISSAO VARCHAR(60) NOT NULL,
    DATA_INICIO DATE NOT NULL,
    TIPO_MISSAO CHAR(10) NOT NULL,
    PESQUISA VARCHAR(100) NOT NULL,
    CONSTRAINT PK_PESQUISAS
        PRIMARY KEY (TITULO_MISSAO, DATA_INICIO, TIPO_MISSAO, PESQUISA),
    CONSTRAINT FK_PESQUISAS_PESQ_CIENTIFICA
        FOREIGN KEY (TITULO_MISSAO, DATA_INICIO, TIPO_MISSAO)
        REFERENCES PESQ_CIENTIFICA(TITULO_MISSAO, DATA_INICIO, TIPO_MISSAO)
        ON DELETE CASCADE
);

-- MISSAO TIPO EXTRACAO DE RECURSO
CREATE TABLE EXTRACAO_RECURSO (
    TITULO_MISSAO VARCHAR(60) NOT NULL,
    DATA_INICIO DATE NOT NULL,
    TIPO_MISSAO CHAR(10) NOT NULL,
    GOVERNO VARCHAR(30) NOT NULL,
    TITULO_CONTRATO VARCHAR(50) NOT NULL,
    DATA_INICIO_CONTRATO DATE NOT NULL,
    CORPO_PLANETARIO VARCHAR(30) NOT NULL,
    DATA_LIMITE DATE,
    STATUS CHAR(10),
    ESCALA_OPERACAO VARCHAR(15),
    CONSTRAINT PK_EXTRACAO_RECURSO
        PRIMARY KEY (TITULO_MISSAO, DATA_INICIO, TIPO_MISSAO),
    CONSTRAINT FK_EXTRACAO_RECURSO_MISSAO
        FOREIGN KEY (TITULO_MISSAO, DATA_INICIO, TIPO_MISSAO)
        REFERENCES MISSAO(TITULO_MISSAO, DATA_INICIO, TIPO_MISSAO)
        ON DELETE CASCADE,
    CONSTRAINT FK_EXTRACAO_RECURSO_CONTRATO
        FOREIGN KEY (GOVERNO, TITULO_CONTRATO, DATA_INICIO_CONTRATO)
        REFERENCES CONTRATO(GOVERNO, TITULO_CONTRATO, DATA_INICIO)
        ON DELETE CASCADE,
    CONSTRAINT CHECK_EXTRACAO_RECURSO_STATUS
        CHECK (STATUS IN('A INICIAR', 'ATIVA', 'FINALIZADA', 'CANCELADA'))
);

CREATE TABLE EXTRAI (
    TITULO_MISSAO VARCHAR(60) NOT NULL,
    DATA_INICIO DATE NOT NULL,
    TIPO_MISSAO CHAR(10) NOT NULL,
    RECURSO VARCHAR(30) NOT NULL,
    QUANTIDADE NUMERIC(25,3),
    IMPACTO_AMBIENTAL VARCHAR(40),
    CONSTRAINT PK_EXTRAI
        PRIMARY KEY (TITULO_MISSAO, DATA_INICIO, TIPO_MISSAO, RECURSO),
    CONSTRAINT FK_EXTRAI_MISSAO
        FOREIGN KEY (TITULO_MISSAO, DATA_INICIO, TIPO_MISSAO)
        REFERENCES MISSAO(TITULO_MISSAO, DATA_INICIO, TIPO_MISSAO)
        ON DELETE CASCADE,
    CONSTRAINT FK_RECURSO_EXTRAI
        FOREIGN KEY (RECURSO)
        REFERENCES RECURSO(NOME)
        ON DELETE CASCADE
);