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
    ('PittySun', 695700.0, 1.989e30, 'F', 782.5, 125.25),
    ('Wrecking', 834000.0, 1.989e30, 'G', 978.15, 789.23),
    ('Messi 10', 432700.0, 3.302e30, 'M', 142.45, 700.0),
    ('Possani', 255400.0, 1.899e30, 'B', 748.8, -284.4),
    ('Stylus', 514500.0, 3.694e30, 'K', -124.8, -542.4),
    ('Fashiuns', 514500.0, 3.694e30, 'K', -124.8, -542.4);

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
    ('Me Adora', 6200, 4.5e24, 'PittySun', 19800000, 'Planeta Desértico', 195, 14, FALSE),
    ('PITTYNANDO', 5200, 0.5e24, 'PittySun', 93000000, 'Planeta Silicato', 255, 17, FALSE),
    ('Teto de Vidro', 13500, 6.2e24, 'PittySun', 162000000, 'Planeta Oceânico', 305, 20, TRUE),
    ('Rock', 7000, 5.2e24, 'PittySun', 205000000, 'Planeta Terrestre', 375, 26, TRUE),
    ('Equalize', 70000, 2.0e25, 'PittySun', 290000000, 'Gigante Gasoso', 425, 30, FALSE),
    ('Miley', 950, 1.0e21, 'Wrecking', 58000000, 'Planeta Anão', 195, 14, TRUE),
    ('Cyrus', 1200, 1.5e22, 'Wrecking', 100000000, 'Planeta Silicato', 215, 16, FALSE),
    ('PartyUSA', 350, 5.0e18, 'Wrecking', 1395000000, 'Gigante Gasoso', 185, 12, FALSE),
    ('The Climb', 1900, 2.0e23, 'Wrecking', 196000000, 'Planeta Terrestre', 195, 14, TRUE),
    ('Jolene', 850, 5.0e19, 'Wrecking', 243000000, 'Planeta Anão', 202, 13, FALSE),
    ('Flowers', 1250, 2.0e21, 'Wrecking', 305000000, 'Planeta Ferro', 215, 15, FALSE),
    ('Barcelona', 3300, 1.0e24, 'Messi 10', 405000000, 'Gigante Gasoso', 225, 14, TRUE),
    ('Miami', 520, 8.0e18, 'Messi 10', 10800000, 'Planeta de Lava', 196, 14, FALSE),
    ('Paris', 480, 1.0e19, 'Messi 10', 11000000, 'Planeta Anão', 202, 15, FALSE),
    ('Calculo', 120000, 2.0e28, 'Possani', 10450000, 'Mega Gigante Gasoso', 380, 14, FALSE),
    ('USP', 540, 1.1e19, 'Possani', 11100000, 'Planeta Terrestre', 236, 16, TRUE),
    ('Tenius', 500, 8.0e18, 'Stylus', 10750000, 'Planeta Silicato', 184, 15, FALSE),
    ('Bolsus', 490, 7.0e18, 'Stylus', 10600000, 'Planeta Anão', 150, 14, FALSE),
    ('Camisus', 460, 9.0e18, 'Fashiuns', 10800000, 'Planeta Silicato', 198, 16, FALSE),
    ('Minissaius', 450, 1.0e19, 'Fashiuns', 10750000, 'Planeta de Lava', 314, 15, FALSE),
    ('Chinelus', 520, 1.2e19, 'Fashiuns', 10650000, 'Planeta Anão', 240, 14, TRUE);

-- * SATELITE *
INSERT INTO SATELITE (NOME, RAIO_MEDIO, MASSA, PLANETA, DISTANCIA_ESTRELA, CATEGORIA, PERIODO_ORBITAL, ROTACAO, RESPIRAVEL)
VALUES
    ('Sandy', 300, 2.5e20, 'Me Adora', 120000, 'Lua Rochosa', 30, 10, FALSE),
    ('Chorao', 250, 1.5e20, 'PITTYNANDO', 90000, 'Lua Desértica', 22, 8, FALSE),
    ('Guitarra', 400, 3e20, 'Teto de Vidro', 150000, 'Lua Gasosa', 40, 15, FALSE),
    ('Finale', 275, 1e20, 'Equalize', 78000, 'Lua Rochosa', 28, 12, FALSE),
    ('Disney Channel', 350, 1.8e20, 'Miley', 105000, 'Lua Gelada', 35, 14, TRUE),
    ('Suarez', 200, 8e18, 'Barcelona', 65000, 'Lua Silicato', 25, 9, FALSE),
    ('Ronaldo', 275, 1.5e19, 'Paris', 80000, 'Lua Rochosa', 32, 11, TRUE),
    ('One', 1250, 6e23, 'Calculo', 60000, 'Lua Desértica', 20, 7, TRUE),
    ('Two', 200, 9e18, 'Calculo', 73000, 'Lua Gasosa', 26, 10, FALSE),
    ('Three', 250, 1.2e19, 'Calculo', 92000, 'Lua Rochosa', 32, 12, FALSE),
    ('Four', 300, 1.5e19, 'Calculo', 115000, 'Lua Gelada', 38, 15, FALSE),
    ('IME', 100, 4e18, 'USP', 40000, 'Lua Silicato', 18, 6, FALSE);

-- * ASTEROIDE  *
INSERT INTO ASTEROIDE (NOME, RAIO_MEDIO, MASSA, ESTRELA, DISTANCIA_ESTRELA, PERIODO_ORBITAL, ROTACAO, RESPIRAVEL)
VALUES
    ('Chip Novo', 150, 3.0e16, 'PittySun', 300000000, NULL, NULL, FALSE),
    ('Desconfigurado', 120, 1.5e16, 'PittySun', 250000000, NULL, NULL, FALSE),
    ('Wig', 90, 8.0e15, 'Wrecking', 150000000, NULL, NULL, FALSE),
    ('Blonde Wig', 110, 1.2e16, 'Wrecking', 200000000, NULL, NULL, FALSE),
    ('Bola de Ouro', 70, 4.0e15, 'Messi 10', 180000000, NULL, NULL, FALSE),
    ('Shortus', 40, 5.0e14, 'Stylus', 90000000, NULL, NULL, FALSE);


