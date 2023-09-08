Create Database DWteste;

Use DWteste;

Create table D_Produto
(IdProduto int identity primary key,
	NomeProduto varchar(255),
	Categoria varchar(255),
	Marca varchar(50)
);
--Populando as tabelas
Insert Into D_Produto(NomeProduto, Categoria, Marca)
	Values --('Geladeira','Eletrodoméstico', 'Frozen')
			('Celular', 'Telefonia', 'Radar'),('Pneu', 'Automotivo', 'Frota')

Create table D_Loja
(
	IdLoja int identity primary key,
	NomeLoja varchar(255)
);
--Populando as tabelas
Insert into D_Loja
Values('Central'),('Baixada');

Create table D_Data
(
	IdData int identity primary key,
	DataVenda varchar(255),
	Semestre int,
	Ano int
);
--Populando as tabelas
Insert Into D_Data(DataVenda, Semestre, Ano)
	Values('02/02/2015', 1, 2015),('10/07/2017', 2, 2017),('06/11/2018',2,2018),
	('25/12/2017',2, 2017),('01/02/20107',1,20017),('06/11/2018',2,2018),
	('09/03/2016',1,2016);

Create table F_Venda
(
	IdProduto int,
	IdLoja int,
	IdData int,
	Valor int,
	Quantidade int,
	Constraint fk_idprod foreign key (IdProduto) references D_Produto(idProduto),
	Constraint fk_idloja foreign key (IdLoja)references D_Loja(IdLoja),
	Constraint fk_iddata foreign key (IdData)references D_Data(IdData),
);
--Populando as tabelas
Insert Into F_Venda(IdProduto, IdLoja, IdData, Valor,Quantidade)
	Values(1,1,1,1000,2),
		  (2,1,2,1000,1),
		  (2,2,4,700,3),
		  (2,2,4,700,1),
		  (2,2,4,700,1),
		  (1,1,5,150,4),
		  (1,1,6,150,4),
		  (2,2,5,150,2),
		  (2,1,7,150,1);

--select*from F_Venda join D_Produto on F_Venda.IdProduto = D_Produto.IdProduto 
 
 select * from F_Venda join D_Produto on D_Produto.IdProduto = F_Venda.IdProduto join
 D_Loja on D_Loja.IdLoja = F_Venda.IdLoja join D_Data on D_Data.IdData = F_Venda.IdData;

select * from F_VENDA join D_PRODUTO on D_PRODUTO.IdProduto = F_VENDA.IdProduto join 
D_LOJA on D_LOJA.IdLoja = F_VENDA.IdLoja join D_DATA on 
D_DATA.IdData = F_VENDA.IdData where D_LOJA.Nomeloja = 'Central';
