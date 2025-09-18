/*
Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes" algunos datos 
de las personas que visitan o compran en su stand para luego enviarle publicidad de sus productos.
1- Elimine la tabla "visitantes", si existe:
 if object_id('visitantes') is not null
  drop table visitantes;

2- Cr�ela con la siguiente estructura:
 create table visitantes(
  nombre varchar(30),
  edad tinyint,
  sexo char(1),
  domicilio varchar(30),
  ciudad varchar(20),
  telefono varchar(11),
  montocompra decimal(6,2) not null
 );

3- Ingrese algunos registros:
 insert into visitantes
  values ('Susana Molina',28,'f',null,'Cordoba',null,45.50); 
 insert into visitantes
  values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',22.40);
 insert into visitantes
  values ('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25); 
 insert into visitantes
  values ('Teresa Garcia',33,'f',default,'Alta Gracia','03547123456',120);
 insert into visitantes
  values ('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20);
 insert into visitantes
  values ('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',95);
 insert into visitantes
  values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia',null,53.50);
 insert into visitantes
  values ('Roxana Lopez',20,'f','null','Alta Gracia',null,240);
 insert into visitantes
  values ('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48);
 insert into visitantes
  values ('Juan Torres',43,'m','Sarmiento 876','Cordoba',null,15.30);

4- Obtenga el total de las compras agrupados por ciudad y sexo de aquellas filas que devuelvan un 
valor superior a 50 (3 filas)

5- Obtenga el total de las compras agrupados por ciudad y sexo (group by), teniendo en cuenta todos 
los valores (all), considerando s�lo los montos de compra superiores a 50 (where), los visitantes 
con tel�fono (where), sin considerar la ciudad de "Cordoba" (having), ordenados por ciudad (order 
by) (3 filas)

6- Muestre el monto mayor de compra agrupado por ciudad, siempre que dicho valor supere los 50 pesos 
(having), considerando s�lo los visitantes de sexo femenino y domicilio conocido (where) (2 filas)

7- Agrupe por ciudad y sexo, muestre para cada grupo el total de visitantes, la suma de sus compras 
y el promedio de compras, ordenado por la suma total y considerando las filas con promedio superior 
a 30 (3 filas)
*/

if OBJECT_ID('visitantes') is not null 
	drop table visitantes ;

create table visitantes(
	nombre varchar(30),
	edad tinyint ,
	sexo char (1),
	domicilio varchar(30),
	ciudad varchar (20),
	telefono varchar (11),
	montocompra decimal (6,2) not null

);
exec sp_columns visitantes;
go 
insert into visitantes 
values ('Susana Molina',28,'f',null,'Cordoba',null,45.50); 
insert into visitantes 
values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',22.40);
insert into visitantes 
values ('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25); 
insert into visitantes 
values ('Teresa Garcia',33,'f',default,'Alta Gracia','03547123456',120);
insert into visitantes 
values ('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20);
insert into visitantes 
values ('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',95);
insert into visitantes 
values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia',null,53.50);
insert into visitantes 
values ('Roxana Lopez',20,'f','null','Alta Gracia',null,240);
insert into visitantes 
values ('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48);
insert into visitantes 
values ('Juan Torres',43,'m','Sarmiento 876','Cordoba',null,15.30);

select * from visitantes; 

select ciudad , sexo , sum(montocompra) as total
	from visitantes 
	group by ciudad , sexo  
	having sum(montocompra)>50;

select ciudad, sexo, sum (montocompra) as 'total' 
	from visitantes 
	where montocompra>50 and telefono is not null
	group by all ciudad ,sexo
	having ciudad <> 'Cordoba'
	order by ciudad;

select ciudad, max(montocompra) as 'maximo'
	from visitantes 
	where sexo ='f' and 
			domicilio is not null
	group by all ciudad 
	having max(montocompra)>50;

select ciudad , sexo ,
	   count(*)as 'visitantes',
	   sum(montocompra) as 'total',
	   avg(montocompra) as 'promedio'
	   from visitantes 
	   group by ciudad,sexo 
	   having avg(montocompra)>30
	   order by total;
