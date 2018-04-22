-- CONSULTA 3
-- - Consulta com junção externa entre RUBRICAS e DESPESASx (LEFT JOIN);
--      >>> OK
-- - Na saída do SELECT, pelo menos 2 colunas de cada uma das 2 tabelas;
--      >>> OK, tem selação sobre 2 colunas de cada uma das tabelas
-- - Orientações específicas:
--      - Seleções sobre colunas que não pertençam às chaves primárias das tabelas;
--          >>> OK, nenhuma delas é Primary Key
--      - Ordenar a saída por coluna diferente de PRIMARY KEY de alguma tabela.
--          >>> OK, tem ""order by CODIGO_RUBRICA"
-- - Cenário sugerido de otimização: transformação de junção externa em junção interna mais UNION com o que faltou.

select NOME_RUBRICA, CODIGO_RUBRICA,    -- Colunas existentes em RUBRICA
       VALOR_EMPENHADO, VALOR_PAGO      -- Colunas existentes em DESPESAS1
from RUBRICAS left join DESPESAS1
    on RUBRICAS.NUMERO_RUBRICA = DESPESAS1.NUMERO_RUBRICA
order by CODIGO_RUBRICA;

select * from RUBRICAS inner join DESPESAS1
-- union Como seleciono os registros que não são em comum entre as duas tabelas? É a junção externa?;