use master
go
drop database Lojainfo
go

create database Lojainfo 
go 


use Lojainfo
GO

create table tb_clientes(
       id_cliente int PRIMARY KEY IDENTITY(1,1),
       nome nvarchar(50) not null,
       endereco nvarchar(100),
       idade int NOT NULL,
       sexo char(1) NOT NULL,
       fone nvarchar(15),
       email nvarchar(70),
)
GO

create table tb_hardware(
       id_hardware int PRIMARY KEY IDENTITY(1,1),
       descricao nvarchar(50) not null,
       preco_unit decimal NOT NULL,
       qtde_atual int NOT NULL, --0 caso nao tenha no estoque
       qtde_minima int,
       img image DEFAULT NULL
)
GO

create table tb_vendas(
       id_venda int primary key IDENTITY(1,1),
       id_cliente int not null,
       data date not null,
       desconto decimal(2,2)
)
GO

create table tb_vendas_itens(
       id_item int PRIMARY KEY identity(1,1),
       id_venda int not null,
       id_hardware int not null,
       qtde_item int not null,
       pco_vda decimal(8,2) not null
)
GO

alter table tb_vendas
      ADD CONSTRAINT fk_vda_cli
      FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente)
      go 

alter table tb_vendas_itens
	ADD CONSTRAINT fk_vda_venda 
	FOREIGN KEY (id_venda) REFERENCES tb_vendas(id_venda)
	go
alter table tb_hardware
	ADD CONSTRAINT fk_vda_hardware
	FOREIGN KEY (id_hardware) REFERENCES tb_hardware(id_hardware)
	go
alter table tb_vendas_itens
	ADD CONSTRAINT fk_vda_hardware2
	FOREIGN KEY (id_hardware) REFERENCES tb_hardware(id_hardware)
	go
	
insert into tb_clientes (nome,idade,sexo,email,endereco,fone) VALUES ('Patrícia',24,'F','patricia@hotmail.com','Rua torta, 32', 24789632),
																					('José',25,'M','jose@yahoo.com','Rua coberta, 41', 26987425),
																					('Thiago',32,'M','thiago@gmail.com','Rua das hortências, 87', 23541485),
																					('Thaís',26,'F','thaisinha@hotmail.com','Rua flamingos, 74', 54545454),
																					('Juliana',23,'F','ju@yahoo.com','Rua reta, 48', 70707070)
																					
go
 insert into tb_hardware (descricao,preco_unit,qtde_atual,qtde_minima) VALUES ('Placa Mãe', 799.00, 10,5),
																			  ('Mouse', 10.00, 40, 5),
																			  ('Computador completo', 999.00, 10,5),
																			  ('Caixa de som', 149.99, 20,5),
																			  ('Estabilizador', 199.00, 10,5)
go
insert into tb_vendas (id_cliente,data) VALUES (1,'16/08/2019'),
											 (2,'17/08/2019'),
											 (3,'18/08/2019'),
											 (4,'19/08/2019'),
											 (5,'20/08/2019')
go
insert into tb_vendas_itens (id_venda,id_hardware,pco_vda,qtde_item) VALUES 
														(1,3,564.00,1),
														(2,2,999.00,5),
														(3,4,749.00,2),
														(4,5,999.00,4),
														(5,1,199.00,3)
go
																			  
																			 

go
select * from tb_hardware
go
select * from tb_vendas
go
select * from tb_vendas_itens
go