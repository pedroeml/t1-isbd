-- CONSULTA 1
-- - Jun��o de pelo menos 4 tabelas, sendo 1 delas DESPESASx;
--      >>> OK, tem "natural join" em 4 tabelas: PESSOAS1, DESPESAS1, GRUPOS e TIPO_EMPENHOS
-- - Na sa�da do SELECT, pelo menos 2 colunas de cada uma das 4 tabelas;
--      >>> OK, na cl�usula "select" h� sele��o de 2 ou 3 colunas por tabela
-- - Sele��es PARA CADA UMA das tabelas;
--      >>> OK, na cl�usula "select" est� comentado quais colunas pertencem �s quais tabelas
-- - Orienta��es espec�ficas:
--      - Filtrar registros em TODAS as tabelas;
--          >>> OK, todas as colunas filtradas na cl�usula "where" correspondem � uma ou mais colunas de alguma das 4 tabelas
--      - Sele��es sobre colunas que n�o perten�am �s chaves prim�rias das tabelas;
--          >>> Esse crit�rio � dif�cil de atender por que h� tabelas que tem poucas colunas, como PESSOAS1, GRUPOS e TIPO_EMPENHOS
--      - Sele��es por DESIGUALDADE (outros operadores do que a igualdade (=)) em pelo menos 2 tabelas.
--          >>> OK, tem "between" e operadores "maior que" e "menor que"
--      - Ordenar a sa�da por coluna diferente de PRIMARY KEY de alguma tabela.
--          >>> OK, tem "order by NUMERO_EMPENHO"
-- - Cen�rio sugerido de otimiza��o: cria��o de �ndices
--      >>> No arquivo ImplemSDB_CriaPopulaEsquema.sql tem exemplos de CREATE INDEX

select NUMERO_GRUPO, NOME_GRUPO                         -- Colunas existentes em GRUPOS
       NUMERO_PESSOA, NOME_PESSOA,                      -- Colunas existentes em PESSOAS1
       TIPO_EMPENHO, DESCRICAO_EMPENHO,                 -- Colunas existentes em TIPO_EMPENHOS
       NUMERO_EMPENHO, VALOR_EMPENHADO, DATA_DESPESA    -- Colunas existentes em DESPESAS1
from PESSOAS1 natural join DESPESAS1
              natural join GRUPOS
              natural join TIPOS_EMPENHOS
where NUMERO_GRUPO between 1 and 3
  and NUMERO_PESSOA > 1000
  and NUMERO_EMPENHO > 8000
  and TIPO_EMPENHO between 5 and 8  
  and DATA_DESPESA between '01-OUT-10' and '1-OUT-11'
order by NUMERO_EMPENHO;

create index IX_NUMERO_PESSOA on PESSOAS1 (NUMERO_PESSOA);
