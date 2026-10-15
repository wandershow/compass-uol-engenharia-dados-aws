-- Semana 2: exportando o resultado de consultas SQL para CSV

-- ===== Opcao 1 (MySQL): INTO OUTFILE =====

select A.Cod as codigo, A.Titulo as titulo_livro, A.Autor as cod_autor_livro, A.nome_autor as autor_livro, A.Valor as valor_livro, A.Editora as cod_editora_livro, A.nome_editora as editora_livro from
(select Cod, Titulo, Autor, AUTOR.Nome as nome_autor, Valor, Editora, EDITORA.Nome as nome_editora
from LIVRO join AUTOR on LIVRO.Autor = AUTOR.CodAutor join EDITORA on LIVRO.Editora = EDITORA.CodEditora
group by titulo order by valor desc limit 10) A
union all
select LIVRO.Cod as codigo_livro, LIVRO.Titulo AS TITULO_LIVRO, Autor AS COD_AUTOR, AUTOR.Nome, Valor, cod_editora, nome_editora from
LIVRO left JOIN AUTOR on LIVRO.Autor = AUTOR.CodAutor JOIN
(select EDITORA.CodEditora as cod_editora, EDITORA.Nome as nome_editora, count(Cod) as contagem
from LIVRO join EDITORA on LIVRO.Editora = EDITORA.CodEditora join AUTOR on LIVRO.Autor = AUTOR.CodAutor
group by Editora order by contagem desc limit 5 ) EDITORA on cod_editora = LIVRO.Editora
INTO outfile '/caminho/da/pasta/teste.csv'
fields terminated by ','
enclosed by '"'
LINES TERMINATED by '\n';

-- ===== Opcao 2 (SQL Developer): SPOOL =====

set heading on

spool "caminho\da\pasta\consulta.csv"
select /*csv*/ Cod as CODIGO, Titulo AS TITULO, Autor AS AUTOR, AUTOR.Nome as NOME_AUTOR, Valor AS VALOR, Editora AS EDITORA, EDITORA.Nome as NOME_EDITORA
from LIVRO join AUTOR on LIVRO.Autor = AUTOR.CodAutor join EDITORA on LIVRO.Editora = EDITORA.CodEditora
group by titulo order by valor desc limit 10;

select /*csv*/ LIVRO.Cod as CODIGO_LIVRO, LIVRO.Titulo AS TITULO_LIVRO, Autor AS COD_AUTOR, A.Nome AS NOME, Valor AS VALOR, cod_editora AS CODIGO_EDITORA, nome_editora AS NOME_EDITORA from
LIVRO join AUTOR A on A.CodAutor = LIVRO.Autor join
(select Cod, EDITORA.CodEditora as cod_editora, EDITORA.Nome as nome_editora
from LIVRO join EDITORA on LIVRO.Editora = EDITORA.CodEditora
group by CodEditora order by count(Cod) desc limit 5) B on B.cod_editora = LIVRO.Editora;

spool OFF;
