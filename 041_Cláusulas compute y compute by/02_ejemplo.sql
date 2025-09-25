/*

La cláusula compute y compute by están discontinuadas en las versiones de SQL Server 2012 y sucesivas.
No utilice esta característica en nuevos proyectos y modifique lo antes posible las aplicaciones que actualmente la utilizan. En su lugar, utilice rollup.

Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes" algunos datos de las personas que visitan o compran en su stand para luego enviarle publicidad de sus productos.
Eliminamos la tabla si existe:

 if object_id('visitantes') is not null
  drop table visitantes;
La creamos con la siguiente estructura:

 create table visitantes(
  nombre varchar(30),
  edad tinyint,
  ciudad varchar(20),
  provincia varchar(20),
  mail varchar(30),
  montocompra decimal(6,2)
 );
Ingresamos algunos registros:

 insert into visitantes
  values ('Susana Molina',28,'Cordoba','Cordoba','susanamolina@gmail.com',50); 
 insert into visitantes
  values ('Marcela Mercado',36,'Carlos Paz','Cordoba',null,20);
 insert into visitantes
  values ('Alberto Garcia',35,'La Falda','Cordoba','albertgomgarcia@hotmail.com',30); 
 insert into visitantes
  values ('Teresa Garcia',33,'Alta Gracia','Cordoba',null,120);
 insert into visitantes
  values ('Roberto Perez',45,'Alta Gracia','Cordoba','robertomarioperez@hotmail.com',30);
 insert into visitantes
  values ('Marina Torres',22,'Rosario','Santa Fe','marinatorres@xaxamail.com',90);
 insert into visitantes
  values ('Julieta Gomez',24,'Rosario','Santa Fe',null,50);
 insert into visitantes
  values ('Roxana Lopez',20,'Alta Gracia','Cordoba',null,200);
 insert into visitantes
  values ('Liliana Garcia',50,'Capital Federal','Buenos Aires','lilianagarcia@hotmail.com',40);
 insert into visitantes
  values ('Juan Torres',43,'Carlos Paz','Cordoba',null,10);
Veamos todos los datos de los visitantes y el promedio del monto de compra:

 select *from visitantes
 compute avg(montocompra);
Empleamos dos cláusulas "compute" en una misma instrucción para averiguar el promedio de las edades y el total de los montos de las compras:

 select edad,ciudad,montocompra
  from visitantes
  compute avg(edad),sum(montocompra);
Veamos la cantidad de visitantes por provincia y ciudad empleando "compute by". Recuerde que DEBE usarse "order by" y los campos que se incluyan luego de "by" deben estar en el "order by":

 select nombre,ciudad,provincia
  from visitantes
  order by provincia,ciudad
  compute count(provincia)
  by provincia,ciudad;
Combinamos dos cláusulas "compute" con dos cláusulas "compute by" para averiguar el promedio de la compra y la cantidad por provincia y ciudad y el promedio de las edades y el total del monto de compras de todos los visitantes:

 select *from visitantes
  order by provincia,ciudad
  compute avg(edad), sum(montocompra)
  compute avg(montocompra),count(provincia)
  by provincia,ciudad;

*/

