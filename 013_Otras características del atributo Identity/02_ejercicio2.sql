/*
Un videoclub almacena informaci�n sobre sus pel�culas en una tabla llamada "peliculas".
1- Elimine la tabla si existe:
 if object_id('peliculas') is not null
  drop table peliculas;

2- Cr�ela definiendo un campo "codigo" autoincrementable que comience en 50 y se incremente en 3:
 create table peliculas(
  codigo int identity (50,3),
  titulo varchar(40),
  actor varchar(20),
  duracion int
 );

3- Ingrese los siguientes registros:
 insert into peliculas (titulo,actor,duracion)
  values('Mision imposible','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la piedra filosofal','Daniel R.',180);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la camara secreta','Daniel R.',190);

4- Seleccione todos los registros y verifique la carga autom�tica de los c�digos:
 select *from peliculas;

5- Setee la opci�n "identity_insert" en "on"

6- Ingrese un registro con valor de c�digo menor a 50.

7- Ingrese un registro con valor de c�digo mayor al �ltimo generado.

8- Averigue el valor de inicio del campo "identity" de la tabla "peliculas".

9- Averigue el valor de incremento del campo "identity" de "peliculas".

10- Intente ingresar un registro sin valor para el campo c�digo.

11- Desactive la opci�n se inserci�n para el campo de identidad.

12- Ingrese un nuevo registro y muestre todos los registros para ver c�mo SQL Server sigui� la 
secuencia tomando el �ltimo valor del campo como referencia.

*/
 if object_id('peliculas') is not null
  drop table peliculas;

 create table peliculas(
  codigo int identity (50,3),
  titulo varchar(40),
  actor varchar(20),
  duracion int
 );

 insert into peliculas (titulo,actor,duracion)
  values('Mision imposible','Tom Cruise',120);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la piedra filosofal','Daniel R.',180);
 insert into peliculas (titulo,actor,duracion)
  values('Harry Potter y la camara secreta','Daniel R.',190);

 select * from peliculas;

 set identity_insert peliculas on;

 insert into peliculas (codigo,titulo,actor,duracion)
  values(20,'Mision imposible 2','Tom Cruise',120);

 insert into peliculas (codigo, titulo,actor,duracion)
  values(80,'La vida es bella','zzz',220);

 select ident_seed('peliculas');

 select ident_incr('peliculas');

 insert into peliculas (titulo,actor,duracion)
  values('Elsa y Fred','China Zorrilla',90);

 set identity_insert peliculas off; 

 insert into peliculas (titulo,actor,duracion)
  values('Elsa y Fred','China Zorrilla',90);
 select * from peliculas;