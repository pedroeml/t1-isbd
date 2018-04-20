-- CONSULTA 3
-- - Consulta com junção externa entre RUBRICAS e DESPESASx (LEFT JOIN);
-- - Na saída do SELECT, pelo menos 2 colunas de cada uma das 2 tabelas;
-- - Orientações específicas:
--      - Seleções sobre colunas que não pertençam às chaves primárias das tabelas;
--      - Ordenar a saída por coluna diferente de PRIMARY KEY de alguma tabela.
-- - Cenário sugerido de otimização: transformação de junção externa em junção interna mais UNION com o que faltou.

select NOME_RUBRICA, CODIGO_RUBRICA,    -- Colunas existentes em RUBRICA
       VALOR_EMPENHADO, VALOR_PAGO      -- Colunas existentes em DESPESAS1
from RUBRICAS left join DESPESAS1;      -- NÃO está funcionando...

select * from RUBRICAS inner join DESPESAS1
-- union Como seleciono os registros que não são em comum entre as duas tabelas? É a junção externa?;