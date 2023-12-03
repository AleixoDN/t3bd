SELECT * FROM GOVERNO;

/*
SELECT *
FROM estrela
JOIN sistema ON estrela.coordenada_x = sistema.coordenada_x AND estrela.coordenada_y = sistema.coordenada_y
WHERE sistema.nome = 'Balanciagus';
*/

WITH RECURSO_MAIS_EXTRAIDO_POR_GOVERNO AS (
    SELECT
        e.RECURSO,
        er.GOVERNO,
        SUM(e.QUANTIDADE) AS TOTAL_QUANTIDADE,
        ROW_NUMBER() OVER (
            PARTITION BY er.GOVERNO ORDER BY SUM(e.QUANTIDADE)
            ) AS RANKING
    FROM
        EXTRACAO_RECURSO er
    JOIN
        EXTRAI e ON er.TITULO_MISSAO = e.TIPO_MISSAO
                AND er.DATA_INICIO = e.DATA_INICIO
                AND er.TIPO_MISSAO = e.DATA_INICIO
    GROUP BY
        er.GOVERNO, e.RECURSO, r.VALOR
)


SELECT RECURSO, GOVERNO, TOTAL_QUANTIDADE
FROM  (

)RECURSO_MAIS_EXTRAIDO_POR_GOVERNO
WHERE RANKING = 1;

/* (7)
As Naves de uma determinada Corporação que não está participando 
de Missões atualmente
*/
SELECT n.NOME_EMBARCACAO, n.NOME_BATISMO, n.MODELO, n.ANO
FROM NAVES n
WHERE n.CORPORACAO == 'COD_CORPORACAO'
SELECT p.NAVE FROM PARTICIPA p WHERE 

SELECT 
