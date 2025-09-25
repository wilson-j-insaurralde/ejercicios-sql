/*
Primer problema:
Ver video

Un videoclub que alquila pel�culas en video almacena la informaci�n de sus pel�culas en una tabla 
llamada "peliculas"; para cada pel�cula necesita los siguientes datos:
 -nombre, cadena de caracteres de 20 de longitud,
 -actor, cadena de caracteres de 20 de longitud,
 -duraci�n, valor num�rico entero.
 -cantidad de copias: valor entero.

1- Elimine la tabla, si existe:
 if object_id('peliculas')is not null
  drop table peliculas;

2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo:
 create table peliculas(
  nombre varchar(20),
  actor varchar(20),
  duracion integer,
  cantidad integer
 );

3- Vea la estructura de la tabla:

4- Ingrese los siguientes registros:
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Mision imposible','Tom Cruise',128,3);
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Mision imposible 2','Tom Cruise',130,2);
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Mujer bonita','Julia Roberts',118,3);
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Elsa y Fred','China Zorrilla',110,2);

5- Muestre todos los registros.
*/

 if object_id('peliculas')is not null
  drop table peliculas;

 create table peliculas(
  nombre varchar(20),
  actor varchar(20),
  duracion integer,
  cantidad integer
 );

 exec sp_columns peliculas;

 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Mision imposible','Tom Cruise',128,3);
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Mision imposible 2','Tom Cruise',130,2);
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Mujer bonita','Julia Roberts',118,3);
 insert into peliculas (nombre, actor, duracion, cantidad)
  values ('Elsa y Fred','China Zorrilla',110,2);

 select * from peliculas;