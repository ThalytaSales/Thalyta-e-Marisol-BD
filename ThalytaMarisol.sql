create database pedido_compra;
go 
 

 drop database pedido_compra;


 use pedido_compra;
 go

 create table cliente  
	(id_clie integer not null primary Key, 
	nm_clie   varchar (60) not null,
	doc_clie  varchar   (15) not null,
	dtnas_clie date not null);
 go 

 


	 create table pagamento 
		(id_pgto	integer  not null primary Key,
		desc_pgto	varchar(30) 		not null);
	  go

	  

 create table pedido 
		( id_ped  integer not null primary key, 
		id_pgto	int	not null,
		id_clie	int not null, 
		dt_ped	date not null,
		tot_ped numeric (10,2),
 constraint pedido_pagamento_fk foreign key (id_pgto) references pagamento, 
 constraint pedido_cliente_fk foreign key (id_clie) references cliente); 
 
 go


  create table produto
	(id_prod  integer not null primary key,
	 dsc_prod	varchar  (40)   not null,
	vl_prod numeric (9,2) );
go





create table item_pedido
	(id_ped  integer not null,
	id_prod integer  not null,
	qtd_item_ped numeric (7) not null, 
	vl_item_ped  numeric (9,2) not null, 
	constraint item_pedido_pedido_fk foreign key (id_ped) references pagamento,
	constraint item_pedido_produto_fk foreign key (id_prod) references produto);
	go



/*  Ex-2 B->a Criar 5 registros na tabela de cliente */
	insert into cliente ( id_clie, nm_clie, doc_clie , dtnas_clie)
				values 	(1,'Mariana silva', '5015826345','1975-10-19'),
						(2,'juana silvetres santos','3582469142','1997-05-12'),
						(3,'lucas pedregal',' 4092753598','1979-08-10'),
						(4,'jorge magueira', '5080246828','1974-11-7'),
						(5, 'Damares gomes', '2010121753','1999-12-4');
		go 


	/*Ex-2 B->b Criar 3 registros na tabela pagamento */
	insert into pagamento (id_pgto, desc_pgto)
		values 	(1,'cartão de credito'),
				(2,'cartão de débito'),
				(3,'Dinheiro');
	go

		
  /*Ex-2 B->c criar 10 Registros na tabela produto */
	insert into produto (id_prod, dsc_prod,vl_prod)
	values (1,'Caneta', 1.00 ),
		   (2,'Lápis', 0.50),
		   (3,'Borracha',1.00 ),
		   (4,'Lapiseira', 2.00 ),
		   (5,'Corretivo' , 3.55),
		   (6,'Calculadora', 5.55),
		   (7,'Sultite pacote', 3.00),
		   (8,'Caderno', 11.00),
		   (9,'Marcador de Texto', 1.00),
		   (10,'Bloco de notas pacote', 2.00);
		   
		go 
		
	
	/*Ex-2 B->d Criar 8 registros na tabela pedido 
	com pelo menos 3 itens cada pedido(item_pedido)*/ 
	insert into pedido (id_ped, id_pgto,id_clie, dt_ped, tot_ped)
			values 		( 1,2,1,'2019-02-05',3),  
						( 2,2,4,'2019-03-15',3),
						(3,1,5,'2019-03-20',3),
						(4,2,3,'2019-03-07',3),
						(5,3,5,'2019-03-08',3),
						(6,2,4,'2019-04-09',3),
						(7,3,3,'2019-04-10',3),
						(8,1,2,'2019-04-11',3);

						/* ainda falta aquiii  */
go

			
			
/* ainda nao se sabe se é assim */ 			
	insert into item_pedido  (id_ped, id_prod, qtd_item_ped, vl_item_ped)
		values				 ( 2,1,3, 1.00), 
							 ( 3,7,5, 8.00), 
							 ( 1,10,12, 2.00);
go 






		   select * from cliente;
		   select * from pedido;
		   select * from pagamento;
		   select * from produto; 
		   select * from item_pedido;
		   --ate aqui esta certo  ---
		   

	/*  EXERCICIO 2-c Selecione todos os campos da tabela cliente e ordene 
	pelo campo nm_clie em ordem crescente */
	
	
	Select * from cliente
	order by nm_clie asc


	/*´desc´ ordem decrescente.
	´asc´ ordem crescente. */
	
	
	/* Ex-2 d-> Selecione todas  as colunas tabela  pagamento 
		E ORDENE pela campo   ID_PGTO em ordem descrescente. */
		
		Select * from pagamento 
		order by id_pgto desc
		
		
		
	/* Ex-2 e-> Selecione todos as colunas da tabela
	PAGAMENTO, onde o campo ID_PGTO seja igual 2 */
	
		SELECT id_pgto,desc_pgto
		FROM pagamento 
		WHERE id_pgto = 2;
	
	
	
	
	
	/* Ex-2 F-> selecione as colunas da tabela CLIENTE, cuja coluna NM_CLIE 
inicie com o caractere "M"    */
	
		SELECT nm_clie 
		FROM cliente 
		WHERE nm_clie LIKE 'M%';
	
	
	/* Ex-2 G-> selecione todos as colunas 
	da tabela pagamento, onde a coluna dsc_pgto tenha no elemento o caractere "e" */
			
			
			SELECT desc_pgto
			FROM pagamento
			WHERE desc_pgto LIKE '%e%';
	
	
	
	/* Ex-2 H-> selecione da tabela produto todos os registros 
	cuja a coluna de vl_prod seja maior que 10,00 */
	
		SELECT dsc_prod ,
			vl_prod [Valor Produto]
		FROM  produto
		WHERE vl_prod > 10.00;
	
	

	
	/* Ex-2 I selecione todas as colunas da tabela PEDIDO 
	cuja DT_PED esteja entre 10/02/2019 e 10/05/2019. */

		SELECT * FROM pedido
		WHERE dt_ped BETWEEN '10-02-2019' AND '2019-05-10';
		
		select *from pedido 


	/* Selecione todos as colunas
	da tabela cliente e seus respectivos pedidos adquiridos e
	ordene pelas colunas nm_clie e id_ped. */
	
		SELECT nm_clie , id_ped
		FROM cliente, pedido 
		WHERE   nm_clie = 'Nome do cliente' OR id_ped =3
		ORDER BY nm_clie;
		

	


	
