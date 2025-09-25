/*
La cláusula compute y compute by están discontinuadas en las versiones de SQL Server 2012 y sucesivas.
No utilice esta característica en nuevos proyectos y modifique lo antes posible las aplicaciones que actualmente la utilizan. En su lugar, utilice rollup.

La provincia almacena en una tabla llamada "inmuebles" los siguientes datos de los inmuebles y sus 
propietarios para cobrar impuestos:
1- Elimine la tabla si existe:
 if object_id('inmuebles') is not null
  drop table inmuebles;

2- Créela con la siguiente estructura:
 create table inmuebles (
  documento varchar(8) not null,
  nombre varchar(30),
  domicilio varchar(20),
  barrio varchar(20),
  ciudad varchar(20),
  tipo char(1),--b=baldio, e: edificado
  superficie decimal (8,2),
  monto decimal (8,2)
 );

3- Ingrese algunos registros:
 insert into inmuebles
  values ('11111111','Alberto Acosta','Avellaneda 800','Centro','Cordoba','e',100,1200);
 insert into inmuebles
  values ('11111111','Alberto Acosta','Sarmiento 245','Gral. Paz','Cordoba','e',200,2500);
 insert into inmuebles
  values ('22222222','Beatriz Barrios','San Martin 202','Centro','Cordoba','e',250,1900);
 insert into inmuebles
  values ('33333333','Carlos Caseres','Paso 1234','Alberdi','Cordoba','b',200,1000);
 insert into inmuebles
  values ('33333333','Carlos Caseres','Guemes 876','Alberdi','Cordoba','b',300,1500);
 insert into inmuebles
  values ('44444444','Diana Dominguez','Calderon 456','Matienzo','Cordoba','b',200,800);
 insert into inmuebles
  values ('55555555','Estela Fuentes','San Martin 321','Flores','Carlos Paz','e',500,4500);
 insert into inmuebles
  values ('55555555','Estela Fuentes','Lopez y Planes 853','Alberdi','Cordoba','e',350,2200);

4- Muestre todos los datos y el promedio del monto empleando "compute" (1 resultado parcial)

5- Empleando cláusulas "compute" consulte el promedio de las superficies y el total de los montos (2 
columnas extras)

6- Realice la misma consulta anterior pero empleando "compute by" para obtener resultados parciales 
por documento,barrio y ciudad.

7- Realice la misma consulta anterior pero con resultados parciales por documento y barrio (6 
resultados parciales dobles)

8- Realice la misma consulta anterior pero con resultados parciales por documento (4 resultados 
parciales dobles)

9- Intente realizar la misma consulta anterior pero con resultados parciales por documento y ciudad.
Aparece un mensaje de error indicando que el subgrupo de campos listados luego del "by" no es 
correcto.

10- Combine cláusulas "compute" con "compute by" para averiguar el total de monto a pagar por 
propietario y el promedio de monto de todos (4 resultados parciales y 1 general)
*/

if OBJECT_ID('inmuebles') is not null	
	drop table inmuebles;

create table inmuebles(
  documento varchar(8) not null,
  nombre varchar(30),
  domicilio varchar(20),
  barrio varchar(20),
  ciudad varchar(20),
  tipo char(1),--b=baldio, e: edificado
  superficie decimal (8,2),
  monto decimal (8,2)
);

insert into inmuebles
  values ('11111111','Alberto Acosta','Avellaneda 800','Centro','Cordoba','e',100,1200);
 insert into inmuebles
  values ('11111111','Alberto Acosta','Sarmiento 245','Gral. Paz','Cordoba','e',200,2500);
 insert into inmuebles
  values ('22222222','Beatriz Barrios','San Martin 202','Centro','Cordoba','e',250,1900);
 insert into inmuebles
  values ('33333333','Carlos Caseres','Paso 1234','Alberdi','Cordoba','b',200,1000);
 insert into inmuebles
  values ('33333333','Carlos Caseres','Guemes 876','Alberdi','Cordoba','b',300,1500);
 insert into inmuebles
  values ('44444444','Diana Dominguez','Calderon 456','Matienzo','Cordoba','b',200,800);
 insert into inmuebles
  values ('55555555','Estela Fuentes','San Martin 321','Flores','Carlos Paz','e',500,4500);
 insert into inmuebles
  values ('55555555','Estela Fuentes','Lopez y Planes 853','Alberdi','Cordoba','e',350,2200);
  
  select * from inmuebles;

  /* select*from inmuebles
	compute avg(monto);
	 select *from inmuebles
  compute avg(superficie),sum(monto);

 select *from inmuebles
  order by documento,barrio,ciudad
  compute avg(superficie),sum(monto)
  by documento,barrio,ciudad;

 select *from inmuebles
  order by documento,barrio,ciudad
  compute avg(superficie),sum(monto)
  by documento,barrio;

 select *from inmuebles
  order by documento,barrio,ciudad
  compute avg(superficie),sum(monto)
  by documento;

 select *from inmuebles
  order by documento,barrio,ciudad
  compute avg(superficie),sum(monto)
  by documento,ciudad;

 select *from inmuebles
  order by documento
  compute sum(monto)
  compute avg(monto)
  by documento;
	
	
	*/

