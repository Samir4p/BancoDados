USE Concessionaria;

--Tabelas--
CREATE TABLE tblMarcas
(
 idMarca        int              identity        primary key,
 nomeMarca		nchar(30)	   	not null		unique
);

--Visualizando estrutura da tabelas
EXEC sp_help tblMarcas;

Create Table tblModelos
(
	idModelo     int   identity 
	constraint PK_tblModelos_idModelo
	primary Key (idModelo),

	--FK
	idMarca         int         not null
	constraint FK_tblModelos_tblMarcas_idMarca
	foreign key (idMarca)
	references tblMarcas(idMarca),

	nomeModelo		nchar(30)		not null
	constraint UQ_tblModelos_nomeModelo
	Unique (nomeModelo)
);
--Visualizando estrutura da tabelas
EXEC sp_help tblModelos;

