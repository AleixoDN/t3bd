-- *SISTEMA PLANETÁRIO*
INSERT INTO SISTEMA (COORDENADA_X, COORDENADA_Y, NOME)
VALUES
    (782.5, 125.25, 'Pitty 100'),
    (978.15, 789.23, 'Hanna Montana'),
    (142.45, 700.0, 'Argentina'),
    (748.8, -284.4, 'Matematicus'),
    (-124.8, -542.4, 'Balanciagus');


-- * CORPO CELESTE *
-- Estrelas
INSERT INTO CORPOCELESTE (NOME, TIPO)
VALUES 
    ('PittySun', 'ESTRELA'),
    ('Wrecking', 'ESTRELA'),
    ('Messi 10', 'ESTRELA'),
    ('Possani', 'ESTRELA'),
    ('Stylus', 'ESTRELA'),
    ('Fashiuns', 'ESTRELA'),

-- Planetarios
-- Para PittySun
    ('Me Adora', 'PLANETARIO'), -- Planetas
    ('PITTYNANDO', 'PLANETARIO'),
    ('Teto de Vidro', 'PLANETARIO'),
    ('Rock', 'PLANETARIO'),
    ('Equalize', 'PLANETARIO'),
    ('Chip Novo', 'PLANETARIO'), -- Asteroides
    ('Desconfigurado', 'PLANETARIO'),
    ('Sandy', 'PLANETARIO'), -- Satélites
    ('Chorao', 'PLANETARIO'),
    ('Guitarra', 'PLANETARIO'),
-- Para Wrecking
    ('Miley', 'PLANETARIO'), -- Planetas
    ('Cyrus', 'PLANETARIO'),
    ('PartyUSA', 'PLANETARIO'),
    ('The Climb', 'PLANETARIO'),
    ('Jolene', 'PLANETARIO'),
    ('Flowers', 'PLANETARIO'),
    ('Wig', 'PLANETARIO'), -- Asteroides
    ('Blonde Wig', 'PLANETARIO'),
    ('Finale', 'PLANETARIO'), -- Satélite
    ('Disney Channel', 'PLANETARIO'),
-- Para Messi 10
    ('Barcelona', 'PLANETARIO'), -- Planetas
    ('Miami', 'PLANETARIO'),
    ('Paris', 'PLANETARIO'),
    ('Bola de Ouro', 'PLANETARIO'), -- Asteroides
    ('Suarez', 'PLANETARIO'), -- Satélites
    ('Ronaldo', 'PLANETARIO'),
-- Para Possani
    ('Calculo', 'PLANETARIO'), -- Planetas
    ('USP', 'PLANETARIO'), 
    ('One', 'PLANETARIO'), -- Satélites
    ('Two', 'PLANETARIO'),
    ('Three', 'PLANETARIO'),
    ('Four', 'PLANETARIO'),
    ('IME', 'PLANETARIO'),
-- Para Balanciagus
    ('Tenius', 'PLANETARIO'), -- Planetas
    ('Bolsus', 'PLANETARIO'),
    ('Camisus', 'PLANETARIO'),
    ('Minissaius', 'PLANETARIO'),
    ('Chinelus', 'PLANETARIO'),
    ('Shortus', 'PLANETARIO'); -- Asteroides


-- * ESTRELA *
INSERT INTO ESTRELA (NOME, RAIO_MEDIO, MASSA, CATEGORIA, COORDENADA_X, COORDENADA_Y)
VALUES
    ('PittySun', NULL, NULL, 'F', 782.5, 125.25),
    ('Wrecking', NULL, NULL, 'G', 978.15, 789.23),
    ('Messi 10', NULL, NULL, 'M', 142.45, 700.0),
    ('Possani', NULL, NULL, 'B', 748.8, -284.4),
    ('Stylus', NULL, NULL, 'K', -124.8, -542.4),
    ('Fashiuns', NULL, NULL, 'K', -124.8, -542.4);


-- * CORPO PLANETARIO *
INSERT INTO CORPOPLANETARIO (NOME, TIPO)
VALUES
    -- Para PittySun
    ('Me Adora', 'PLANETA'),
    ('PITTYNANDO', 'PLANETA'),
    ('Teto de Vidro', 'PLANETA'),
    ('Rock', 'PLANETA'),
    ('Equalize', 'PLANETA'),
    ('Chip Novo', 'ASTEROIDE'), 
    ('Desconfigurado', 'ASTEROIDE'),
    ('Sandy', 'SATELITE'), 
    ('Chorao', 'SATELITE'),
    ('Guitarra', 'SATELITE'),
    -- Para Wrecking
    ('Miley', 'PLANETA'), 
    ('Cyrus', 'PLANETA'),
    ('PartyUSA', 'PLANETA'),
    ('The Climb', 'PLANETA'),
    ('Jolene', 'PLANETA'),
    ('Flowers', 'PLANETA'),
    ('Wig', 'ASTEROIDE'), 
    ('Blonde Wig', 'ASTEROIDE'),
    ('Finale', 'SATELITE'), 
    ('Disney Channel', 'SATELITE'),
-- Para Messi 10
    ('Barcelona', 'PLANETA'), 
    ('Miami', 'PLANETA'),
    ('Paris', 'PLANETA'),
    ('Bola de Ouro', 'ASTEROIDE'), 
    ('Suarez', 'SATELITE'), 
    ('Ronaldo', 'SATELITE'),
-- Para Possani
    ('Calculo', 'PLANETA'), 
    ('USP', 'PLANETA'), 
    ('One', 'SATELITE'), 
    ('Two', 'SATELITE'),
    ('Three', 'SATELITE'),
    ('Four', 'SATELITE'),
    ('IME', 'SATELITE'),
-- Para Balanciagus
    ('Tenius', 'PLANETA'), 
    ('Bolsus', 'PLANETA'),
    ('Camisus', 'PLANETA'),
    ('Minissaius', 'PLANETA'),
    ('Chinelus', 'PLANETA'),
    ('Shortus', 'ASTEROIDE'); 

-- * PLANETA *
INSERT INTO PLANETA (NOME, RAIO_MEDIO, MASSA, ESTRELA, DISTANCIA_ESTRELA, CATEGORIA, PERIODO_ORBITAL, ROTACAO, RESPIRAVEL)
VALUES
    ('Me Adora', NULL, NULL, 'PittySun', 19600000, 'Anão', 204, 15, FALSE),
    ('PITTYNANDO', NULL, NULL, 'PittySun', 90750000, 'Rochoso', 269, 18, FALSE),
    ('Teto de Vidro', NULL, NULL, 'PittySun', 158704000, 'Floresta', 315, 22, TRUE),
    ('Rock', NULL, NULL, 'PittySun', 208807800, 'Com Vida', 390, 27, TRUE),
    ('Equalize', NULL, NULL, 'PittySun', 297985002, 'Gasoso', 441, 32, FALSE),
    ('Miley',  NULL, NULL, 'Wrecking', 57789000, 'Anão', 204, 15, TRUE), 
    ('Cyrus', NULL, NULL, 'Wrecking', 100320000, 'Anão', 204, 15, FALSE), 
    ('PartyUSA', NULL, NULL, 'Wrecking', 1394100000, 'Anão', 204, 15, FALSE), 
    ('The Climb', NULL, NULL, 'Wrecking', 198347150, 'Anão', 204, 15, TRUE), 
    ('Jolene', NULL, NULL, 'Wrecking', 237321900, 'Anão', 204, 15, FALSE), 
    ('Flowers', NULL, NULL, 'Wrecking', 299623478, 'Anão', 204, 15, FALSE), 
    ('Barcelona', NULL, NULL, 'Messi 10', 398707900, 'Anão', 204, 15, TRUE), 
    ('Miami', NULL, NULL, 'Messi 10', 10600000, 'Anão', 204, 15, FALSE), 
    ('Paris', NULL, NULL, 'Messi 10', 10600000, 'Anão', 204, 15, FALSE), 
    ('Calculo', NULL, NULL, 'Possani', 10600000, 'Anão', 204, 15, FALSE), 
    ('USP', NULL, NULL, 'Possani', 10600000, 'Anão', 204, 15, TRUE), 
    ('Tenius', NULL, NULL, 'Stylus', 10600000, 'Anão', 204, 15, FALSE), 
    ('Bolsus', NULL, NULL, 'Stylus', 10600000, 'Anão', 204, 15, FALSE), 
    ('Camisus', NULL, NULL, 'Fashiuns', 10600000, 'Anão', 204, 15, FALSE), 
    ('Minissaius', NULL, NULL, 'Fashiuns', 10600000, 'Anão', 204, 15, FALSE), 
    ('Chinelus', NULL, NULL, 'Fashiuns', 10600000, 'Anão', 204, 15, TRUE);
