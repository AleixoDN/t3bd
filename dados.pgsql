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
    ('Miley', 1789, 1.0e23, 'Wrecking', 118000000, 'Planeta Telúrico', 195, 14, TRUE),
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
    ('Chinelus', 520, 1.2e19, 'Fashiuns', 10650000, 'Planeta Telúrico', 240, 14, TRUE);

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
INSERT INTO ASTEROIDE (NOME, RAIO_MEDIO, MASSA, ESTRELA, DISTANCIA_ESTRELA, PERIODO_ORBITAL, ROTACAO)
VALUES
    ('Chip Novo', 150, 3.0e16, 'PittySun', 300000000, NULL, NULL),
    ('Desconfigurado', 120, 1.5e16, 'PittySun', 250000000, NULL, NULL),
    ('Wig', 90, 8.0e15, 'Wrecking', 150000000, NULL, NULL),
    ('Blonde Wig', 110, 1.2e16, 'Wrecking', 200000000, NULL, NULL),
    ('Bola de Ouro', 70, 4.0e15, 'Messi 10', 180000000, NULL, NULL),
    ('Shortus', 40, 5.0e14, 'Stylus', 90000000, NULL, NULL);


-- ////////////////////////////////////////////////////////////////////////////////


-- * GOVERNO *
INSERT INTO GOVERNO (NOME, TIPO_GOVERNO)
VALUES
    ('Império de Neo Pompeia', 'Império Oligárquico'),
    ('República Federativa StarBet', 'República Privada'),
    ('Unidade de Ursa Menor', 'Democrácia'),
    ('Fundação X', 'Império Tecnocrata');
    
-- * CORPORACAO *
INSERT INTO CORPORACAO (CODIGO_CORPORATIVO, NOME)
VALUES 
    ('BET12345', 'Empresa Bet Aposte Aqui'),
    ('MAJ67810', 'Moster AnyJobs LTD'),
    ('TSC11129', 'Taylor Swift Corporation'),
    ('CIA13145', 'Companhia de Extração'),
    ('UBE20201', 'Uber and Sons Express');


-- * NAVES *
INSERT INTO NAVE (NOME_EMBARCACAO, NOME_BATISMO, MODELO, ANO, CORPORACAO)
VALUES
    ('FX-8705-VNS', 'Galáxia Corredor', 'Turbo Cruiser 2000', 2405, 'MAJ67810'),
    ('FUNX-9876-GEM', 'Diamantes Minerador', 'Gem Explorer 6000', 2480, 'CIA13145'),
    ('FX-8765-ERT', 'Mineiro Mestre', 'Resource Collector 7000', 2475, 'CIA13145'),
    ('STRB-9876-VNS', 'Turbo Estrela', 'Turbo Cruiser 2000', 2398, 'MAJ67810'),
    ('FUNX-9876-ERT', 'Platina Cavaleiro', 'Platinum Explorer 5500', 2485, 'CIA13145'),
    ('UUM-7654-PLT', 'Pedreira Rei', 'Earth Mover 8000', 2498, 'CIA13145'),
    ('BEAR-6543-VNS', '5000 Via Láctea', 'Galactic Explorer 5000', 2422, 'MAJ67810'),
    ('NEOP-5678-PLT', 'Majestoso O', 'Galactic Explorer 5000', 2415, 'MAJ67810'),
    ('FX-8766-GEM', 'Foxy Proxy', 'Silver Collector 3500', 2467, 'CIA13145'),
    ('FUNX-2341-GEM', 'Diamantes Mergulhador', 'Gem Explorer 6000', 2490, 'CIA13145'),
    ('NEOP-4567-PLT', 'Brocador', 'Rock Driller 3000', 2445, 'CIA13145'),
    ('FUNX-3456-GEM', 'Golden Flame', 'Treasure Hunter 4500', 2455, 'CIA13145'),
    ('RFSB-5678-PLT', 'Carlinhos', 'Furious Z 150', 2420, 'BET12345'),
    ('STRB-1765-VNS', 'Midnights', 'Sonic Cruiser 3000', 2522, 'TSC11129'),
    ('BEAR-0265-RKT', 'Shake it off', 'Swift Rocket 3000', 2548, 'TSC11129'),
    ('UUM-9823-PLT', 'Pedreira Rainha', 'Earth Mover 8000', 2483, 'CIA13145'),
    ('STRB-9876-VYR', 'Red', 'Starlight Voyager 2500', 2510, 'TSC11129'),
    ('BEAR-2341-MON', 'Folklore', 'Monza Shuttle ZX', 2532, 'TSC11129'),
    ('FUNX-8765-GEM', 'Gemas Caçador', 'Treasure Hunter 4500', 2440, 'CIA13145'),
    ('FX-2341-PLT', 'Mineiro Marauder', 'Resource Collector 7000', 2465, 'CIA13145'),
    ('BEAR-8765-PLT', 'Sortudo', 'Chance Cruiser 2800', 2419, 'BET12345'),
    ('UUM-0001-VYR', 'Race Winner', 'Victory Seeker 2100', 2435, 'BET12345'),
    ('UNIB-9798-VYR', 'Fezinha', 'Furious Z 280', 2378, 'BET12345'),
    ('FX-8710-PLT', 'Rocha Cavaleiro', 'Earth Mover 8000', 2479, 'CIA13145'),
    ('BEAR-9379-VYR', 'Evermore', 'Monza Shuttle ZX', 2555, 'TSC11129'),
    ('STRB-8701-VNS', 'Taylor Version', 'Space Cruiser 1989', 2489, 'TSC11129'),
    ('FUX-8767-RT', 'Excelente Expresso', 'Efficient Transporter 1800', 2408, 'UBE20201'),
    ('RFSB-2801-VYR', 'Rápido Transporte', 'Speedy Voyager 2200', 2375, 'UBE20201'),
    ('FUNX-1015-GEM', 'Profissional Mineração 1', 'Mining Pro 1 3000', 2455, 'BET12345'),
    ('NEOP-0005-VLZ', 'Rápido Novinho', 'Volkswagen Express 2000', 2249, 'UBE20201'),
    ('NEOP-2041-VYR', 'Extra Entrega', 'Delivery Master 1800', 2389, 'BET12345'),
    ('UUM-1041-PLT', 'Titânio Cavalo', 'Titanium Tracker 6500', 2492, 'CIA13145'),
    ('STRB-5670-VYR', 'Flash', 'Vroom Vroom Express 1500', 2255, 'UBE20201'),
    ('FX-9871-ERT', 'Ferro Prospector', 'Heavy Extractor 2000', 2458, 'CIA13145'),
    ('FUNX-2600-GEM', 'Diamantes do Espaço', 'Gem Explorer 6000', 2490, 'CIA13145'),
    ('UUM-1234-ERT', 'Negro Falcão', 'Shadow Runner 1000', 2450, 'MAJ67810'),
    ('INP-9376-VNS', 'Lover', 'Galactic Monarch 7000', 2555, 'TSC11129'),
    ('UBE-0071-VYR', 'Sonhos Caçador', 'Dream Chaser 2200', 2523, 'UBE20201'),
    ('UUM-8700-VYR', 'Aposta de Domingo', 'Furious Z 280', 2565, 'UBE20201'),
    ('UUM-8708-VYR', 'Sorte Estrela', 'Furious Z 280', 2555, 'BET12345'),
    ('RFSB-5677-PLT', 'Vitória Busca', 'Furious Z 280', 2540, 'BET12345'),
    ('STRB-2765-PLT', 'Vermelho Foguete', 'Red Thunderbolt 4000', '2540', 'TSC11129'),
    ('STRB-2942-VYR', 'Royale Jackpot', 'Fortune Royale 2800', 2475, 'BET12345'),
    ('RFSB-5638-PLT', 'Expressa Aposta', 'Furious Z 150', 2420, 'BET12345'),
    ('FX-0002-FST', 'Now Speak', 'Firestorm Explorer 4000', 2530, 'TSC11129'),
    ('UUM-0001-PLT', 'O Agiota', 'Victory Seeker 2100', 2557, 'BET12345'),
    ('FUNX-3006-GEM', 'Ouro Buscador', 'Treasure Hunter 4500', 2455, 'CIA13145'),
    ('NEOP-2441-VYR', 'Real Aposta', 'Furious Z 150', 2462, 'BET12345'),
    ('UUM-1302-PLT', 'Aposta Mágico', 'Furious Z 280', 2508, 'BET12345'),
    ('NEOP-5671-PLT', 'Majestoso 1', 'Galactic Explorer 5000', 2415, 'MAJ67810'),
    ('STRB-9040-VNS', 'Speed', 'Turbo Cruiser 2000', 2398, 'MAJ67810'),
    ('UBE-2311-VYR', 'Aposta Estrela', 'Furious Z 280', 2378, 'BET12345'),
    ('NEOP-9631-PLT', 'Petrolífera Plataforma', 'Fuel Extractor 4000', 2432, 'CIA13145'),
    ('FX-0705-GEM', 'Prateada Raposa', 'Silver Collector 3500', 2467, 'CIA13145'),
    ('FX-2333-MAR', 'Bibi GROOVE II', 'Interstellar X3000', 2402, 'MAJ67810'),
    ('FUNX-7776-ERT', '1989', 'Furious Z 280', 2545, 'TSC11129'),
    ('STRB-8765-VNS', 'Fearless', 'Sonic Cruiser 3000', 2522, 'TSC11129'),
    ('BEAR-0565-PLT', 'Forte Sorte', 'Chance Cruiser 2800', '2419', 'BET12345'),
    ('STRB-9776-VNS', 'Fusquinha', 'Turbo Cruiser 2000', 2398, 'MAJ67810'),
    ('RFSB-9018-PLT', 'Mestre da Chance', 'Furious Z 280', '2482', 'BET12345'),
    ('FUNX-0025-PLT', 'Futuro Transportador', 'Future Carrier 2800', 2412, 'UBE20201'),
    ('NEOP-2001-PLT', 'Broca Mestre', 'Rock Driller 3000', 2445, 'CIA13145'),
    ('NEOP-8095-VLZ', 'O Rápido', 'Volkswagen Express 2000', '2249', 'UBE20201'),
    ('UUM-8165-VYR', 'Conquistador da Sorte', 'Luck Conqueror 2000', 2455, 'CIA13145'),
    ('FUNX-8764-GEM', 'Mineração Profissional 1', 'Mining Pro 1 3000', '2455', 'BET12345'),
    ('BEAR-3341-VYR', 'Dado Dourado', 'Golden Dice 1500', 2492, 'BET12345'),
    ('INP-0303-VNS', 'Will Veloz Smith', 'Monza Shuttle ZX', '2395', 'UBE20201'),
    ('FUNX-9875-ERT', 'Cavaleiro de Platina', 'Platinum Explorer 5500', '2485', 'CIA13145'),
    ('STRB-2342-VYR', 'Apostador X', 'Fortune Explorer 2300', 2538, 'BET12345'),
    ('UUM-2941-PLT', 'Um Vencedor', 'Victory Seeker 2100', 2557, 'BET12345'),
    ('FUNX-0003-ERT', 'Pioneiro', 'Ship1000', 2280, 'CIA13145'),
    ('FUNX-0004-ERT', 'Pioneiro II', 'Ship1000', 2280, 'CIA13145'),
    ('FUNX-0006-ERT', 'The Guard', 'Ship1000', 2280, 'CIA13145'),
    ('FUNX-0007-ERT', 'Thunder Galaxy', 'Ship1000', 2280, 'CIA13145'),
    ('FUNX-0008-ERT', 'Lady X', 'Ship1000', 2280, 'CIA13145'),
    ('FUNX-0009-ERT', 'Warrior of Miley', 'Ship1000', 2280, 'CIA13145'),
    ('FX-0047-MAR', 'Warrior of Miley II', 'MarsX 350', 2350, 'CIA13145'),
    ('FUNX-0051-MAR', 'Great Hannah', 'MarsX 350', 2350, 'CIA13145'),
    ('FUNX-0163-MAR', 'Marciano QB', 'MarsX 350', 2350, 'CIA13145'),
    ('UUM-0187-PLU', 'PHI Eagles', 'MarsX Plus 15', 2412, 'CIA13145'),
    ('FX-1011-VNS', 'Barney of Journey II ', 'MarsX Plus 12', 2369, 'CIA13145');
    

-- * MISSAO *
INSERT INTO MISSAO (TITULO_MISSAO, DATA_INICIO, TIPO_MISSAO)
VALUES
    ('EXT.SILICIO - ME ADORA 01', '25-12-2566', 'EXTRACAO'),
    ('COLONIA CIENTIFICA 002 - USP', '08-01-2482', 'EXPLORACAO'),
    ('COLONIA CIENTIFICA 002 - USP', '08-01-2482', 'CONSTRUCAO'),
    ('COLONIA CIENTIFICA 002 - USP', '08-01-2482', 'CIENTIFICA'),
    ('COLONIA CIENTIFICA 001 - USP', '08-01-2472', 'EXPLORACAO'),
    ('COLONIA CIENTIFICA 001 - USP', '08-01-2472', 'CONSTRUCAO'),
    ('COLONIA CIENTIFICA 001 - USP', '08-01-2472', 'CIENTIFICA'),
    ('PESQUISAS LASER / USP - RFSB ', '30-10-2494', 'CIENTIFICA'),
    ('PESQUISAS LASER II / USP - RFSB ', '31-08-2500', 'CIENTIFICA'),
    ('PESQUISAS TERRAFORMAÇÃO / USP - RFSB ', '30-10-2494', 'CIENTIFICA'),
    ('CRIACAO DAS GRANDES MINAS DE MILEY', '05-06-2360', 'EXTRACAO'),
    ('PRIMEIRA VIAGEM PARA MILEY', '30-09-2301','EXPLORACAO'),
    ('SEGUNDA VIAGEM PARA MILEY', '05-01-2315', 'EXPLORACAO'),
    ('TERCEIRA VIAGEM PARA MILEY', '11-01-2329', 'EXPLORACAO'),
    ('TERCEIRA VIAGEM PARA MILEY', '11-01-2329', 'CONSTRUCAO'),
    ('INSTALAÇÃO DAS GRANDES MAQUINAS EM MILEY I', '14-12-2340', 'CONSTRUCAO'),
    ('INSTALAÇÃO DAS GRANDES MAQUINAS EM MILEY II', '02-06-2341', 'CONSTRUCAO'),
    ('PESQUISA DE RECURSOS ALTERNATIVOS EM MILEY', '28-11-2349', 'CIENTIFICA'),
    ('PRIMEIRA JORNADA DE MINERACAO SUPERFICAL DE MILEY', '19-07-2352', 'EXTRACAO'),
    ('PRIMEIRA JORNADA DE MINERACAO SUPERFICAL DE MILEY', '19-07-2352', 'CONSTRUCAO'),
    ('SEGUNDA JORNADA DE MINERACAO SUPERFICAL DE MILEY', '19-07-2357', 'EXTRACAO'),
    ('CRIACAO DAS GRANDES MINAS DE MILEY', '05-06-2360', 'CONSTRUCAO'),
    ('GRANDE JORNADA DE MILEY - LÍTIO', '10-01-2370', 'EXTRACAO'),
    ('II GRANDE JORNADA DE MILEY', '09-01-2389', 'EXTRACAO'),
    ('INSTALAÇÃO DA CIDADE DE EXTRACAO MILEY-X', '03-01-2450', 'CONSTRUCAO'),
    ('III GRANDE JORNADA DE MILEY', '29-12-2472', 'EXTRACAO'), 
    ('III GRANDE JORNADA DE MILEY', '29-12-2472', 'CONSTRUCAO'),
    ('III GRANDE JORNADA DE MILEY', '29-12-2472', 'CIENTIFICA'),
    ('IV GRANDE JORNADA DE MILEY', '02-01-2501', 'EXTRACAO'),
    ('V GRANDE JORNADA DE MILEY', '21-02-2550', 'EXTRACAO');
/*
INSERT INTO PARTICIPA (TIPO_MISSAO, DATA_INICIO, TIPO_MISSAO, NAVE)
VALUES
    ('PRIMEIRA VIAGEM PARA MILEY', '31-09-2301','EXPLORACAO', )
*/

INSERT INTO CONTRATO (GOVERNO, TITULO_CONTRATO, DATA_INICIO, CORPORACAO, DATA_LIMITE, ENCERRADO)
VALUES 
    ('Fundação X', 'EXTRAÇÃO DE RECURSO NO PLANETA MILEY', '20-05-2299', 'CIA13145', '01-01-2600', FALSE),
    ('República Federativa StarBet', 'EXTRAÇÃO STARBET DE SILICIO NO PLANETA ME ADORA', '15-06-2562', 'UBE20201', '01-01-2662', FALSE),
    ('República Federativa StarBet', 'CONSTRUIR E ADM. COLÔNIA CIENTIFICA EM USP', '20-12-2481', 'TSC11129', '02-01-2494', TRUE),
    ('República Federativa StarBet', 'CONSTRUIR E ADM. COLÔNIA CIENTIFICA EM USP', '05-01-2472', 'MAJ67810', '05-05-2481', TRUE),
    ('República Federativa StarBet', 'PESQUISAS EM USP', '08-02-2494', 'UBE20201', '20-07-2505', TRUE);



INSERT INTO EXTRACAO_RECURSO (TITULO_MISSAO, DATA_INICIO, TIPO_MISSAO, GOVERNO, TITULO_CONTRATO, 
                                DATA_INICIO_CONTRATO, CORPO_PLANETARIO, DATA_LIMITE, STATUS, ESCALA_OPERACAO)
VALUES
    ('PRIMEIRA JORNADA DE MINERACAO SUPERFICAL DE MILEY', '19-07-2352', 'EXTRACAO', 'Fundação X', 'EXTRAÇÃO DE RECURSO NO PLANETA MILEY', '20-05-2299', 'Miley', '31-12-2362', 'FINALIZADA', NULL),
    ('EXT.SILICIO - ME ADORA 01', '25-12-2566', 'EXTRACAO', 'República Federativa StarBet', 'EXTRAÇÃO STARBET DE SILICIO NO PLANETA ME ADORA', '15-06-2562', 'Me Adora', '30-06-2577', 'ATIVA', NULL),
    ('SEGUNDA JORNADA DE MINERACAO SUPERFICAL DE MILEY', '19-07-2357', 'EXTRACAO', 'Fundação X', 'EXTRAÇÃO DE RECURSO NO PLANETA MILEY', '20-05-2299', 'Miley', '31-12-2367', 'FINALIZADA', NULL),
    ('GRANDE JORNADA DE MILEY - LÍTIO', '10-01-2370', 'EXTRACAO', 'Fundação X', 'EXTRAÇÃO DE RECURSO NO PLANETA MILEY', '20-05-2299', 'Miley', '08-01-2389', 'FINALIZADA', NULL),
    ('II GRANDE JORNADA DE MILEY', '09-01-2389', 'EXTRACAO', 'Fundação X', 'EXTRAÇÃO DE RECURSO NO PLANETA MILEY', '20-05-2299', 'Miley', '28-12-2472', 'FINALIZADA', NULL),
    ('III GRANDE JORNADA DE MILEY', '29-12-2472', 'EXTRACAO', 'Fundação X', 'EXTRAÇÃO DE RECURSO NO PLANETA MILEY', '20-05-2299', 'Miley', '31-12-2500', 'FINALIZADA', NULL),
    ('IV GRANDE JORNADA DE MILEY', '02-01-2501', 'EXTRACAO', 'Fundação X', 'EXTRAÇÃO DE RECURSO NO PLANETA MILEY', '20-05-2299', 'Miley', '20-02-2550', 'FINALIZADA', null),
    ('V GRANDE JORNADA DE MILEY', '21-02-2550', 'EXTRACAO', 'Fundação X', 'EXTRAÇÃO DE RECURSO NO PLANETA MILEY', '20-05-2299', 'Miley', '20-12-2599', 'ATIVA', NULL),
    ('CRIACAO DAS GRANDES MINAS DE MILEY', '05-06-2360', 'EXTRACAO', 'Fundação X', 'EXTRAÇÃO DE RECURSO NO PLANETA MILEY', '20-05-2299', 'Miley', '25-12-2373', 'FINALIZADA', NULL);


INSERT INTO EXPLORACAO_RECONHECIMENTO (TITULO_MISSAO, DATA_INICIO, TIPO_MISSAO, GOVERNO, TITULO_CONTRATO, 
                                DATA_INICIO_CONTRATO, CORPO_PLANETARIO, DATA_LIMITE, STATUS)
VALUES
    ('PRIMEIRA VIAGEM PARA MILEY', '30-09-2301','EXPLORACAO', 'Fundação X', 'EXTRAÇÃO DE RECURSO NO PLANETA MILEY', '20-05-2299', 'Miley', '31-12-2314', 'FINALIZADA'),
    ('SEGUNDA VIAGEM PARA MILEY', '05-01-2315', 'EXPLORACAO', 'Fundação X', 'EXTRAÇÃO DE RECURSO NO PLANETA MILEY', '20-05-2299', 'Miley', '05-01-2329', 'FINALIZADA'),
    ('TERCEIRA VIAGEM PARA MILEY', '11-01-2329', 'EXPLORACAO', 'Fundação X', 'EXTRAÇÃO DE RECURSO NO PLANETA MILEY', '20-05-2299', 'Miley','30-06-2340', 'FINALIZADA'),
    ('COLONIA CIENTIFICA 002 - USP', '08-01-2482', 'EXPLORACAO', 'República Federativa StarBet', 'CONSTRUIR E ADM. COLÔNIA CIENTIFICA EM USP', '20-12-2481', 'USP', '01-01-2494', 'FINALIZADA'),
    ('COLONIA CIENTIFICA 001 - USP', '08-01-2472', 'EXPLORACAO', 'República Federativa StarBet', 'CONSTRUIR E ADM. COLÔNIA CIENTIFICA EM USP', '05-01-2472', 'USP', '08-04-2482', 'FINALIZADA');


INSERT INTO CONSTRUCAO_ESTACAO (TITULO_MISSAO, DATA_INICIO, TIPO_MISSAO, GOVERNO, TITULO_CONTRATO, 
                                DATA_INICIO_CONTRATO, CORPO_PLANETARIO, DATA_LIMITE, STATUS, TIPO_ESTACAO)
VALUES
    ('COLONIA CIENTIFICA 002 - USP', '08-01-2482', 'CONSTRUCAO', 'República Federativa StarBet', 'CONSTRUIR E ADM. COLÔNIA CIENTIFICA EM USP', '20-12-2481', 'USP', '01-01-2494', 'FINALIZADA', 'CENTRO DE PESQUISA'),
    ('COLONIA CIENTIFICA 001 - USP', '08-01-2472', 'CONSTRUCAO', 'República Federativa StarBet', 'CONSTRUIR E ADM. COLÔNIA CIENTIFICA EM USP', '05-01-2472', 'USP', '08-04-2482', 'FINALIZADA', 'CENTRO DE PESQUISA'),
    ('TERCEIRA VIAGEM PARA MILEY', '11-01-2329', 'CONSTRUCAO', 'Fundação X', 'EXTRAÇÃO DE RECURSO NO PLANETA MILEY', '20-05-2299', 'Miley','30-06-2340', 'FINALIZADA', 'EXTRAÇÃO'),
    ('INSTALAÇÃO DAS GRANDES MAQUINAS EM MILEY I', '14-12-2340', 'CONSTRUCAO', 'Fundação X', 'EXTRAÇÃO DE RECURSO NO PLANETA MILEY', '20-05-2299', 'Miley','13-05-2341', 'FINALIZADA', 'CENTRO DE OPERAÇÕES'),
    ('INSTALAÇÃO DAS GRANDES MAQUINAS EM MILEY II', '02-06-2341', 'CONSTRUCAO', 'Fundação X', 'EXTRAÇÃO DE RECURSO NO PLANETA MILEY', '20-05-2299', 'Miley','25-12-2343', 'FINALIZADA', 'EXTRAÇÃO'),
    ('PRIMEIRA JORNADA DE MINERACAO SUPERFICAL DE MILEY', '19-07-2352', 'CONSTRUCAO', 'Fundação X', 'EXTRAÇÃO DE RECURSO NO PLANETA MILEY', '20-05-2299', 'Miley','31-12-2362', 'FINALIZADA', 'EXTRAÇÃO'),
    ('CRIACAO DAS GRANDES MINAS DE MILEY', '05-06-2360', 'CONSTRUCAO', 'Fundação X', 'EXTRAÇÃO DE RECURSO NO PLANETA MILEY', '20-05-2299', 'Miley','25-12-2373', 'FINALIZADA', 'INDUSTRIA'),
    ('INSTALAÇÃO DA CIDADE DE EXTRACAO MILEY-X', '03-01-2450', 'CONSTRUCAO', 'Fundação X', 'EXTRAÇÃO DE RECURSO NO PLANETA MILEY', '20-05-2299', 'Miley','30-09-2470', 'FINALIZADA', 'CENTRO DE COLONIZAÇÃO'),
    ('III GRANDE JORNADA DE MILEY', '29-12-2472', 'CONSTRUCAO', 'Fundação X', 'EXTRAÇÃO DE RECURSO NO PLANETA MILEY', '20-05-2299','Miley','31-12-2500', 'FINALIZADA', 'INDUSTRIA');

INSERT INTO PESQ_CIENTIFICA  (TITULO_MISSAO, DATA_INICIO, TIPO_MISSAO, GOVERNO, TITULO_CONTRATO, 
                                DATA_INICIO_CONTRATO, CORPO_PLANETARIO, DATA_LIMITE, STATUS)
VALUES
    ('COLONIA CIENTIFICA 002 - USP', '08-01-2482', 'CIENTIFICA','República Federativa StarBet', 'CONSTRUIR E ADM. COLÔNIA CIENTIFICA EM USP', '20-12-2481', 'USP', '01-01-2494', 'FINALIZADA'),
    ('COLONIA CIENTIFICA 001 - USP', '08-01-2472', 'CIENTIFICA', 'República Federativa StarBet', 'CONSTRUIR E ADM. COLÔNIA CIENTIFICA EM USP', '05-01-2472', 'USP', '08-04-2482', 'FINALIZADA'),
    ('PESQUISAS LASER / USP - RFSB ', '30-10-2494', 'CIENTIFICA', 'República Federativa StarBet', 'PESQUISAS EM USP', '08-02-2494', 'USP', '30-08-2500', 'FINALIZADA'),
    ('PESQUISAS LASER II / USP - RFSB ', '31-08-2500', 'CIENTIFICA', 'República Federativa StarBet', 'PESQUISAS EM USP', '08-02-2494', 'USP', '10-07-2505', 'FINALIZADA'),
    ('PESQUISAS TERRAFORMAÇÃO / USP - RFSB ', '30-10-2494', 'CIENTIFICA', 'República Federativa StarBet', 'PESQUISAS EM USP', '08-02-2494', 'USP', '10-07-2505', 'FINALIZADA'),
    ('PESQUISA DE RECURSOS ALTERNATIVOS EM MILEY', '28-11-2349', 'CIENTIFICA', 'Fundação X', 'EXTRAÇÃO DE RECURSO NO PLANETA MILEY', '20-05-2299', 'Miley', '01-04-2360', 'FINALIZADA'),
    ('III GRANDE JORNADA DE MILEY', '29-12-2472', 'CIENTIFICA', 'Fundação X', 'EXTRAÇÃO DE RECURSO NO PLANETA MILEY', '20-05-2299','Miley','31-12-2500', 'FINALIZADA');