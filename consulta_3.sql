-- CONSULTA 3
-- - Consulta com jun��o externa entre RUBRICAS e DESPESASx (LEFT JOIN);
-- - Na sa�da do SELECT, pelo menos 2 colunas de cada uma das 2 tabelas;
-- - Orienta��es espec�ficas:
--      - Sele��es sobre colunas que n�o perten�am �s chaves prim�rias das tabelas;
--      - Ordenar a sa�da por coluna diferente de PRIMARY KEY de alguma tabela.
-- - Cen�rio sugerido de otimiza��o: transforma��o de jun��o externa em jun��o interna mais UNION com o que faltou.

select NOME_RUBRICA, CODIGO_RUBRICA,    -- Colunas existentes em RUBRICA
       VALOR_EMPENHADO, VALOR_PAGO      -- Colunas existentes em DESPESAS1
from RUBRICAS left join DESPESAS1;      -- N�O est� funcionando...

select * from RUBRICAS inner join DESPESAS1
-- union Como seleciono os registros que n�o s�o em comum entre as duas tabelas? � a jun��o externa?;