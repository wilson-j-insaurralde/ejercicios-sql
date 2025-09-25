/*
Trabajamos con la tabla "usuarios" que consta de 2 campos: nombre de usuario y clave.
Eliminamos la tabla, si existe:

 if object_id('usuarios') is not null
  drop table usuarios;
Creamos la tabla:

 create table usuarios (
  nombre varchar(30),
  clave varchar(10)
 );
Vemos la estructura de la tabla:

 exec sp_columns usuarios;
Ingresamos algunos registros:

 insert into usuarios (nombre, clave)
  values ('Marcelo','Boca');
 insert into usuarios (nombre, clave)
  values ('JuanPerez','Juancito');
 insert into usuarios (nombre, clave)
  values ('Susana','River');
 insert into usuarios (nombre, clave)
  values ('Luis','River');
Realizamos una consulta especificando una condición, queremos ver el usuario cuyo nombre es "Leonardo":

 select * from usuarios
  where nombre='Leonardo';
Queremos ver el nombre de los usuarios cuya clave es "River":

 select nombre from usuarios
  where clave='River';
Realizamos un "select" de los nombres de los usuarios cuya clave es "Santi":

 select nombre from usuarios
  where clave='Santi';
No se muestra ningún registro ya que ninguno cumple la condición.


*/

 if object_id('usuarios') is not null
  drop table usuarios;

 create table usuarios (
  nombre varchar(30),
  clave varchar(10)
 );

 exec sp_columns usuarios;

 insert into usuarios (nombre, clave)
  values ('Marcelo','Boca');
 insert into usuarios (nombre, clave)
  values ('JuanPerez','Juancito');
 insert into usuarios (nombre, clave)
  values ('Susana','River');
 insert into usuarios (nombre, clave)
  values ('Luis','River');

 select *from usuarios
  where nombre='Leonardo';

 select nombre from usuarios
  where clave='River';

 select nombre from usuarios
  where clave='Santi';