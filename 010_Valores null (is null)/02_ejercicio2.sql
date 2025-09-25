/*
Trabaje con la tabla que almacena los datos sobre películas, llamada "peliculas".
1- Elimine la tabla si existe:
 if object_id('peliculas') is not null
  drop table peliculas;

2- Créela con la siguiente estructura:
 create table peliculas(
  codigo int not null,
  titulo varchar(40) not null,
  actor varchar(20),
  duracion int
 );

3- Visualice la estructura de la tabla
 exec sp_columns peliculas;
note que el campo "codigo" y "titulo", en la columna "IS_NULLABLE" muestra "NO" y los otros campos "YES".

4- Ingrese los siguientes registros:
 insert into peliculas (codigo,titulo,actor,duracion)
  values(1,'Mision imposible','Tom Cruise',120);
 insert into peliculas (codigo,titulo,actor,duracion)
  values(2,'Harry Potter y la piedra filosofal',null,180);
 insert into peliculas (codigo,titulo,actor,duracion)
  values(3,'Harry Potter y la camara secreta','Daniel R.',null);
 insert into peliculas (codigo,titulo,actor,duracion)
  values(0,'Mision imposible 2','',150);
 insert into peliculas (codigo,titulo,actor,duracion)
  values(4,'','L. Di Caprio',220);
 insert into peliculas (codigo,titulo,actor,duracion)
  values(5,'Mujer bonita','R. Gere-J. Roberts',0);

5- Recupere todos los registros para ver cómo SQL Server los almacenó:
 select * from peliculas;

6- Intente ingresar un registro con valor nulo para campos que no lo admiten (aparece un mensaje de 
error):
 insert into peliculas (codigo,titulo,actor,duracion)
  values(null,'Mujer bonita','R. Gere-J. Roberts',190);

7- Muestre los registros con valor nulo en el campo "actor" y luego los que guardan una cadena vacía 
(note que la salida es distinta) (1 registro)

8- Modifique los registros que tengan valor de duración desconocido (nulo) por "120" (1 registro 
actualizado)

9- Coloque 'Desconocido' en el campo "actor" en los registros que tengan una cadena vacía en dicho 
campo (1 registro afectado)

10- Muestre todos los registros. Note que el cambio anterior no afectó a los registros con valor 
nulo en el campo "actor".

11- Elimine los registros cuyo título sea una cadena vacía (1 registro)

*/
if object_id('peliculas') is not null
  drop table peliculas;

 create table peliculas(
  codigo int not null,
  titulo varchar(40) not null,
  actor varchar(20),
  duracion int
 );

 exec sp_columns peliculas;

 insert into peliculas (codigo,titulo,actor,duracion)
  values(1,'Mision imposible','Tom Cruise',120);
 insert into peliculas (codigo,titulo,actor,duracion)
  values(2,'Harry Potter y la piedra filosofal',null,180);
 insert into peliculas (codigo,titulo,actor,duracion)
  values(3,'Harry Potter y la camara secreta','Daniel R.',null);
 insert into peliculas (codigo,titulo,actor,duracion)
  values(0,'Mision imposible 2','',150);
 insert into peliculas (codigo,titulo,actor,duracion)
  values(4,'','L. Di Caprio',220);
 insert into peliculas (codigo,titulo,actor,duracion)
  values(5,'Mujer bonita','R. Gere-J. Roberts',0);

 select * from peliculas;

 insert into peliculas (codigo,titulo,actor,duracion)
  values(null,'Mujer bonita','R. Gere-J. Roberts',190);

 select * from peliculas
  where actor is null;

 update peliculas set duracion=120 where duracion is null;

 update peliculas set actor='Desconocido'
  where actor='';

 select * from peliculas;

 delete from peliculas
  where titulo='';

 select * from peliculas;