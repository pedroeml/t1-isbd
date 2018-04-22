-- CONSULTA 2
-- - Consulta com sub-consulta;
-- - Sub-consulta retorna pelo menos 1 valor por fun��o de agrega��o;
--      >>> OK, tem a subconsulta que verifica a m�dia de VALOR_EMPENHADO
-- - Orienta��es espec�ficas:
--      -- Ao menos 2 tabelas, sendo uma delas DESPESASx;
--          >>> OK, tem consulta sobre join entre PESSOAS1 e DESPESAS1
--      -- Fun��o de agrega��o na sub-consulta. Exemplo:
--              select * from pedidos_produtos
--              where valor_unit�rio > (select avg(pre�o) from produtos);
--      -- Ordenar por coluna n�o pertencente a PRIMARY KEY.
--          >>> OK, tem "order by VALOR_EMPENHADO"
-- - Cen�rio sugerido de otimiza��o: cria��o de �ndices.
--      >>> OK

select NUMERO_PESSOA, NOME_PESSOA, VALOR_EMPENHADO
from PESSOAS1 natural join DESPESAS1
where VALOR_EMPENHADO >= (select avg(VALOR_EMPENHADO) from DESPESAS1)
order by VALOR_EMPENHADO;

create index IX_VALOR_EMPENHADO on DESPESAS1 (VALOR_EMPENHADO);
