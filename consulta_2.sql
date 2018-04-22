-- CONSULTA 2
-- - Consulta com sub-consulta;
-- - Sub-consulta retorna pelo menos 1 valor por função de agregação;
--      >>> OK, tem a subconsulta que verifica a média de VALOR_EMPENHADO
-- - Orientações específicas:
--      -- Ao menos 2 tabelas, sendo uma delas DESPESASx;
--          >>> OK, tem consulta sobre join entre PESSOAS1 e DESPESAS1
--      -- Função de agregação na sub-consulta. Exemplo:
--              select * from pedidos_produtos
--              where valor_unitário > (select avg(preço) from produtos);
--      -- Ordenar por coluna não pertencente a PRIMARY KEY.
--          >>> OK, tem "order by VALOR_EMPENHADO"
-- - Cenário sugerido de otimização: criação de índices.
--      >>> OK

select NUMERO_PESSOA, NOME_PESSOA, VALOR_EMPENHADO
from PESSOAS1 natural join DESPESAS1
where VALOR_EMPENHADO >= (select avg(VALOR_EMPENHADO) from DESPESAS1)
order by VALOR_EMPENHADO;

create index IX_VALOR_EMPENHADO on DESPESAS1 (VALOR_EMPENHADO);
