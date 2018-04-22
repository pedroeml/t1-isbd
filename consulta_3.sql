-- CONSULTA 3
-- - Consulta com jun��o externa entre RUBRICAS e DESPESASx (LEFT JOIN);
--      >>> OK
-- - Na sa�da do SELECT, pelo menos 2 colunas de cada uma das 2 tabelas;
--      >>> OK, tem sela��o sobre 2 colunas de cada uma das tabelas
-- - Orienta��es espec�ficas:
--      - Sele��es sobre colunas que n�o perten�am �s chaves prim�rias das tabelas;
--          >>> OK, nenhuma delas � Primary Key
--      - Ordenar a sa�da por coluna diferente de PRIMARY KEY de alguma tabela.
--          >>> OK, tem ""order by CODIGO_RUBRICA"
-- - Cen�rio sugerido de otimiza��o: transforma��o de jun��o externa em jun��o interna mais UNION com o que faltou.

select NOME_RUBRICA, CODIGO_RUBRICA,    -- Colunas existentes em RUBRICA
       VALOR_EMPENHADO, VALOR_PAGO      -- Colunas existentes em DESPESAS1
from RUBRICAS left join DESPESAS1
    on RUBRICAS.NUMERO_RUBRICA = DESPESAS1.NUMERO_RUBRICA
order by CODIGO_RUBRICA;

select * from RUBRICAS inner join DESPESAS1
-- union Como seleciono os registros que n�o s�o em comum entre as duas tabelas? � a jun��o externa?;