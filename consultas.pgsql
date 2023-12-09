/* CONSULTA 1
 Para cada corporação, qual tipo de missão ela mais realizou?
*/

SELECT DISTINCT missao.titulo_missao, missao.data_inicio FROM missao;

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
*/