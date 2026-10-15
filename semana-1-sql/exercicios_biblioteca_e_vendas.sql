-- Semana 1: exercicios de SQL (Compass UOL)
-- Banco: programa_bolsas (biblioteca) e TbVendas (vendas)

-- ===== Lista 1: biblioteca =====

-- a) Listar todos os livros publicados apos 2014
select * from programa_bolsas.LIVRO where YEAR(programa_bolsas.LIVRO.Publicacao) > 2014;

-- b) Listar os 10 livros mais caros
SELECT Titulo, valor from programa_bolsas.LIVRO order by valor desc limit 10;

-- c) Listar as 5 editoras que mais tem livros na biblioteca
select editora, EDITORA.Nome, count(editora) as contagem
from programa_bolsas.LIVRO join programa_bolsas.EDITORA
where programa_bolsas.LIVRO.Editora = programa_bolsas.EDITORA.CodEditora
group by Editora order by contagem desc limit 5;

-- d) Listar a quantidade de publicacoes de cada autor
select Autor, AUTOR.Nome, count(Autor) as contagem
from programa_bolsas.LIVRO join programa_bolsas.AUTOR
where programa_bolsas.LIVRO.Autor = programa_bolsas.AUTOR.CodAutor
group by Autor order by contagem desc;

-- e) Listar a quantidade de publicacoes de cada editora
select editora, EDITORA.Nome, count(editora) as contagem
from programa_bolsas.LIVRO join programa_bolsas.EDITORA
where programa_bolsas.LIVRO.Editora = programa_bolsas.EDITORA.CodEditora
group by Editora order by contagem desc;

-- f) Listar qual e o autor com mais publicacoes
select Autor, AUTOR.Nome, count(Autor) as contagem
from programa_bolsas.LIVRO join programa_bolsas.AUTOR
where programa_bolsas.LIVRO.Autor = programa_bolsas.AUTOR.CodAutor
group by Autor order by contagem desc limit 1;

-- g) Listar qual e o autor com menos ou nenhuma publicacao
select Autor, AUTOR.Nome, count(Autor) as contagem
from programa_bolsas.LIVRO join programa_bolsas.AUTOR
where programa_bolsas.LIVRO.Autor = programa_bolsas.AUTOR.CodAutor
group by Autor order by contagem asc limit 1;

-- ===== Lista 2: vendas =====

-- a) Nome e codigo do vendedor com o maior numero de vendas
select NmVdd, count(TbVendas.CdVdd)
from TbVendas, TbVendedor
where TbVendas.CdVdd = TbVendedor.CdVdd and status = 'concluido'
group by NmVdd order by count(TbVendas.CdVen) desc limit 1;

-- b) Produto mais vendido entre 2014-02-03 e 2018-02-02
select NmPro, sum(Qtd) as qtd_total from TbVendas
where DtVen between '2014-02-03' and '2018-02-02' and status = 'Concluido'
group by NmPro order by count(nmPro) desc limit 1;

-- c) Comissao dos vendedores
select NmVdd, TbVendas.CdVdd, PercComissao, sum(VrUnt * Qtd) as venda_total, round(sum(VrUnt * Qtd )/(PercComissao * 100), 2) as total_comissao
from TbVendas, TbVendedor
where TbVendas.CdVdd = TbVendedor.CdVdd and status = 'Concluido'
group by NmVdd
order by round(sum(VrUnt)/(PercComissao * 100), 2) desc;

-- d) Cliente que mais gastou
select NmCli, sum(VrUnt * Qtd) as venda_total
from TbVendas
group by NmCli
order by sum(VrUnt * Qtd) desc limit 1;

-- f) 10 produtos menos vendidos pelo ecommerce e pela matriz
SELECT CdPro, NmPro, sum(Qtd), CdCanalVendas, NmCanalVendas, status
from TbVendas
where status = 'concluido' and (CdCanalVendas = 1 or CdCanalVendas = 2)
group by CdPro, CdCanalVendas
order by sum(qtd) asc limit 10;

-- g) Media de gasto por estado
select Estado, round(avg(Qtd*VrUnt), 2) media_gastos
from TbVendas
where status = 'concluido'
group by estado
order by media_gastos desc;

-- h) Todos os registros deletados
select * from TbVendas where deletado = 1;

-- i) Media da quantidade vendida de cada produto por estado
select Estado, Cdpro, Nmpro, round(avg(Qtd), 2) as media
from TbVendas
where status = 'Concluido'
group by estado order by media desc;
