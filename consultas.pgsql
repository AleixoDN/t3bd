/* CONSULTA 1
 Para cada corporação, qual tipo de missão ela mais realizou?
*/

SELECT
    corporacao AS Corporacao,
    COUNT(CASE WHEN tipo_construcao_estacao IS NOT NULL THEN 1 END) AS Qtd_Construcao_Estacao,
    COUNT(CASE WHEN tipo_exploracao_reconhecimento IS NOT NULL THEN 1 END) AS Qtd_Exploracao_Reconhecimento,
    COUNT(CASE WHEN tipo_pesquisa_cientifica IS NOT NULL THEN 1 END) AS Qtd_Pesquisa_Cientifica,
    COUNT(CASE WHEN tipo_extracao_recurso IS NOT NULL THEN 1 END) AS Qtd_Extracao_Recurso
FROM (
    SELECT
        missao.titulo_missao,
        missao.data_inicio,
        MAX(construcao_estacao.tipo_missao) AS tipo_construcao_estacao,
        MAX(exploracao_reconhecimento.tipo_missao) AS tipo_exploracao_reconhecimento,
        MAX(pesq_cientifica.tipo_missao) AS tipo_pesquisa_cientifica,
        MAX(extracao_recurso.tipo_missao) AS tipo_extracao_recurso,
        MAX(contrato.titulo_contrato) AS contrato_titulo,
        MAX(contrato.data_inicio) AS contrato_data_inicio,
        MAX(contrato.governo) AS contrato_governo,
        MAX(corporacao.nome) AS corporacao
    FROM missao
    LEFT JOIN construcao_estacao ON
        construcao_estacao.titulo_missao = missao.titulo_missao
        AND construcao_estacao.data_inicio = missao.data_inicio
        AND construcao_estacao.tipo_missao = missao.tipo_missao
    LEFT JOIN exploracao_reconhecimento ON
        exploracao_reconhecimento.titulo_missao = missao.titulo_missao
        AND exploracao_reconhecimento.data_inicio = missao.data_inicio
        AND exploracao_reconhecimento.tipo_missao = missao.tipo_missao
    LEFT JOIN pesq_cientifica ON
        pesq_cientifica.titulo_missao = missao.titulo_missao
        AND pesq_cientifica.data_inicio = missao.data_inicio
        AND pesq_cientifica.tipo_missao = missao.tipo_missao
    LEFT JOIN extracao_recurso ON
        extracao_recurso.titulo_missao = missao.titulo_missao
        AND extracao_recurso.data_inicio = missao.data_inicio
        AND extracao_recurso.tipo_missao = missao.tipo_missao
    JOIN contrato ON
        (
            (
                contrato.titulo_contrato = construcao_estacao.titulo_contrato
                AND contrato.data_inicio = construcao_estacao.data_inicio_contrato
                AND contrato.governo = construcao_estacao.governo
            ) OR (
                contrato.titulo_contrato = exploracao_reconhecimento.titulo_contrato
                AND contrato.data_inicio = exploracao_reconhecimento.data_inicio_contrato
                AND contrato.governo = exploracao_reconhecimento.governo
            ) OR (
                contrato.titulo_contrato = pesq_cientifica.titulo_contrato
                AND contrato.data_inicio = pesq_cientifica.data_inicio_contrato
                AND contrato.governo = pesq_cientifica.governo
            ) OR (
                contrato.titulo_contrato = extracao_recurso.titulo_contrato
                AND contrato.data_inicio = extracao_recurso.data_inicio_contrato
                AND contrato.governo = extracao_recurso.governo
            )
        )
    JOIN corporacao ON corporacao.codigo_corporativo = contrato.corporacao
    GROUP BY missao.titulo_missao, missao.data_inicio
    ORDER BY missao.data_inicio, missao.titulo_missao
) AS subconsulta
GROUP BY corporacao
ORDER BY corporacao;



/* CONSULTA 2
Código e Nome das Corporações que pegaram todos os contratos de um determinado governo
Juntamente com o número de contratos 
*/

-- Consultas Específicas para cada governo

SELECT CORP.CODIGO_CORPORATIVO, CORP.NOME
FROM CORPORACAO CORP JOIN CONTRATO C
ON CORP.codigo_corporativo = C.CORPORACAO
WHERE C.GOVERNO = 'Fundação X'
GROUP BY CORP.CODIGO_CORPORATIVO, CORP.NOME
HAVING COUNT(*) = (
    SELECT COUNT(*) 
    FROM CONTRATO CONT
    WHERE CONT.GOVERNO = 'Fundação X'
);

SELECT CORP.CODIGO_CORPORATIVO, CORP.NOME
FROM CORPORACAO CORP JOIN CONTRATO C
ON CORP.codigo_corporativo = C.CORPORACAO
WHERE C.GOVERNO = 'República Federativa StarBet'
GROUP BY CORP.CODIGO_CORPORATIVO, CORP.NOME
HAVING COUNT(*) = (
    SELECT COUNT(*) 
    FROM CONTRATO CONT
    WHERE CONT.GOVERNO = 'República Federativa StarBet'
);


SELECT CORP.CODIGO_CORPORATIVO, CORP.NOME
FROM CORPORACAO CORP JOIN CONTRATO C
ON CORP.codigo_corporativo = C.CORPORACAO
WHERE C.GOVERNO = 'Unidade de Ursa Menor'
GROUP BY CORP.CODIGO_CORPORATIVO, CORP.NOME
HAVING COUNT(*) = (
    SELECT COUNT(*) 
    FROM CONTRATO CONT
    WHERE CONT.GOVERNO = 'Unidade de Ursa Menor'
);


SELECT CORP.CODIGO_CORPORATIVO, CORP.NOME
FROM CORPORACAO CORP JOIN CONTRATO C
ON CORP.codigo_corporativo = C.CORPORACAO
WHERE C.GOVERNO = 'Império de Neo Pompeia'
GROUP BY CORP.CODIGO_CORPORATIVO, CORP.NOME
HAVING COUNT(*) = (
    SELECT COUNT(*) 
    FROM CONTRATO CONT
    WHERE CONT.GOVERNO = 'Império de Neo Pompeia'
);

/*
Consulta final:  Mostra todas as corporações que realizaram todos as missões de um único Governo,
qual governo em questão é, assim como seu número de contratos
*/
SELECT
    CORP.CODIGO_CORPORATIVO,
    CORP.NOME,
    GOV.NOME AS NOME_GOVERNO,
    COUNT(*) AS NUMERO_CONTRATOS
FROM
    CORPORACAO CORP
JOIN
    CONTRATO C ON CORP.codigo_corporativo = C.CORPORACAO
JOIN
    GOVERNO GOV ON C.GOVERNO = GOV.NOME
GROUP BY
    CORP.CODIGO_CORPORATIVO,
    CORP.NOME,
    GOV.NOME
HAVING COUNT(*) = (
    SELECT COUNT(*)
    FROM CONTRATO CONT
    WHERE CONT.GOVERNO = GOV.NOME
);



/* CONSULTA 3
Os Recursos mais extraidos por um governo
*/
SELECT
    governo,
    recurso,
    total_extraido
FROM
    (SELECT
        governo.nome AS governo,
        recurso.nome AS recurso,
        SUM(extrai.quantidade) AS total_extraido,
        ROW_NUMBER() OVER (PARTITION BY governo.nome ORDER BY SUM(extrai.quantidade) DESC) as rank
    FROM governo
    JOIN contrato ON contrato.governo = governo.nome
    JOIN extracao_recurso ON
        extracao_recurso.governo = contrato.governo
        AND extracao_recurso.titulo_contrato = contrato.titulo_contrato
        AND extracao_recurso.data_inicio_contrato = contrato.data_inicio
    JOIN extrai ON
        extrai.titulo_missao = extracao_recurso.titulo_missao
        AND extrai.data_inicio = extracao_recurso.data_inicio
        AND extrai.tipo_missAO = extracao_recurso.tipo_missao
    JOIN recurso ON recurso.nome = extrai.recurso
    GROUP BY governo.nome, recurso.nome
    ORDER BY governo.nome, SUM(extrai.quantidade) DESC) AS ranked
WHERE rank = 1;

/* CONSULTA 4
Quais naves não estão participando de nenhuma missão num dado momento (ex: 01/01/2567)
*/

SELECT
    *
FROM
    nave
WHERE nave.nome_embarcacao NOT IN
    (SELECT
        nave.nome_embarcacao
    FROM nave
    JOIN participa ON participa.nave = nave.nome_embarcacao
    JOIN missao ON
        participa.titulo_missao = missao.titulo_missao
        AND participa.data_inicio = missao.data_inicio
        AND participa.tipo_missao = missao.tipo_missao
    LEFT JOIN construcao_estacao ON
        construcao_estacao.titulo_missao = missao.titulo_missao
        AND construcao_estacao.data_inicio = missao.data_inicio
        AND construcao_estacao.tipo_missao = missao.tipo_missao
    LEFT JOIN exploracao_reconhecimento ON
        exploracao_reconhecimento.titulo_missao = missao.titulo_missao
        AND exploracao_reconhecimento.data_inicio = missao.data_inicio
        AND exploracao_reconhecimento.tipo_missao = missao.tipo_missao
    LEFT JOIN pesq_cientifica ON
        pesq_cientifica.titulo_missao = missao.titulo_missao
        AND pesq_cientifica.data_inicio = missao.data_inicio
        AND pesq_cientifica.tipo_missao = missao.tipo_missao
    LEFT JOIN extracao_recurso ON
        extracao_recurso.titulo_missao = missao.titulo_missao
        AND extracao_recurso.data_inicio = missao.data_inicio
        AND extracao_recurso.tipo_missao = missao.tipo_missao
    WHERE
        COALESCE(construcao_estacao.data_limite, exploracao_reconhecimento.data_limite, pesq_cientifica.data_limite, extracao_recurso.data_limite) >= '2567-01-01'
        AND missao.data_inicio <= '2567-01-01');




/* CONSULTA 5
Os Planetas (algum dia já visitados) que estão a mais tempo sem receber visita (missões)
*/

SELECT MF.CORPO_PLANETARIO, MIN(MF.DATA_LIMITE) AS ULTIMA_VISITA
FROM (
    SELECT 
    M.TITULO_MISSAO,
    M.DATA_INICIO,
    COALESCE(MAX(C.DATA_LIMITE), MAX(E.DATA_LIMITE), MAX(P.DATA_LIMITE), MAX(R.DATA_LIMITE)) AS DATA_LIMITE,
    COALESCE(MAX(C.CORPO_PLANETARIO), MAX(E.CORPO_PLANETARIO), MAX(P.CORPO_PLANETARIO), MAX(R.CORPO_PLANETARIO)) AS CORPO_PLANETARIO
    FROM
        MISSAO M
    LEFT JOIN CONSTRUCAO_ESTACAO C 
        ON M.TITULO_MISSAO = C.TITULO_MISSAO
        AND M.DATA_INICIO = C.DATA_INICIO 
        AND M.TIPO_MISSAO = C.TIPO_MISSAO
    LEFT JOIN EXPLORACAO_RECONHECIMENTO E 
        ON M.TITULO_MISSAO = E.TITULO_MISSAO 
        AND M.DATA_INICIO = E.DATA_INICIO 
        AND M.TIPO_MISSAO = E.TIPO_MISSAO
    LEFT JOIN PESQ_CIENTIFICA P 
        ON M.TITULO_MISSAO = P.TITULO_MISSAO 
        AND M.DATA_INICIO = P.DATA_INICIO 
        AND M.TIPO_MISSAO = P.TIPO_MISSAO
    LEFT JOIN EXTRACAO_RECURSO R 
        ON M.TITULO_MISSAO = R.TITULO_MISSAO 
        AND M.DATA_INICIO = R.DATA_INICIO 
        AND M.TIPO_MISSAO = R.TIPO_MISSAO
    WHERE
        COALESCE(
            C.STATUS,
            E.STATUS,
            P.STATUS,
            R.STATUS
        ) = 'FINALIZADA'
    GROUP BY M.TITULO_MISSAO, M.DATA_INICIO 
) AS MF 
LEFT JOIN (
    SELECT
        M.TITULO_MISSAO,
        M.DATA_INICIO,
        COALESCE(MAX(C.CORPO_PLANETARIO), MAX(E.CORPO_PLANETARIO), MAX(P.CORPO_PLANETARIO), MAX(R.CORPO_PLANETARIO)) AS CORPO_PLANETARIO
    FROM
        MISSAO M
    LEFT JOIN CONSTRUCAO_ESTACAO C 
        ON M.TITULO_MISSAO = C.TITULO_MISSAO
        AND M.DATA_INICIO = C.DATA_INICIO 
        AND M.TIPO_MISSAO = C.TIPO_MISSAO
    LEFT JOIN EXPLORACAO_RECONHECIMENTO E 
        ON M.TITULO_MISSAO = E.TITULO_MISSAO 
        AND M.DATA_INICIO = E.DATA_INICIO 
        AND M.TIPO_MISSAO = E.TIPO_MISSAO
    LEFT JOIN PESQ_CIENTIFICA P 
        ON M.TITULO_MISSAO = P.TITULO_MISSAO 
        AND M.DATA_INICIO = P.DATA_INICIO 
        AND M.TIPO_MISSAO = P.TIPO_MISSAO
    LEFT JOIN EXTRACAO_RECURSO R 
        ON M.TITULO_MISSAO = R.TITULO_MISSAO 
        AND M.DATA_INICIO = R.DATA_INICIO 
        AND M.TIPO_MISSAO = R.TIPO_MISSAO
    WHERE
        COALESCE(
            C.STATUS,
            E.STATUS,
            P.STATUS,
            R.STATUS
        ) = 'ATIVA'
    GROUP BY
        M.TITULO_MISSAO, M.DATA_INICIO
) AS MA 
ON MF.CORPO_PLANETARIO = MA.CORPO_PLANETARIO
WHERE MA IS NULL
GROUP BY MF.CORPO_PLANETARIO
ORDER BY ULTIMA_VISITA;



