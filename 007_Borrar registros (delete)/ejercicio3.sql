/*
Problema:
Trabajamos con la tabla "usuarios".

Eliminamos la tabla "usuarios", si existe:

 if object_id('usuarios') is not null
  drop table usuarios;
La creamos con la siguiente estructura:

 create table usuarios(
  nombre varchar(30),
  clave varchar(10)
 );
Agregamos registros a la tabla:

 insert into usuarios (nombre,clave)
  values ('Marcelo','River');
 insert into usuarios (nombre,clave)
  values ('Susana','chapita');
 insert into usuarios (nombre,clave)
  values ('CarlosFuentes','Boca');
 insert into usuarios (nombre,clave)
  values ('FedericoLopez','Boca');
Seleccionamos todos los registros:

 select * from usuarios;
Vamos a eliminar el registro cuyo nombre de usuario es "Marcelo":

 delete from usuarios
 where nombre='Marcelo';
Veamos el contenido de la tabla:

 select * from usuarios;
Intentamos eliminarlo nuevamente:

 delete from usuarios
 where nombre='Marcelo';
Veamos el contenido de la tabla:

 select * from usuarios;
Como ning�n registro cumple con la condici�n no se borran registros.

Eliminamos todos los registros cuya clave es 'Boca':

 delete from usuarios
  where clave='Boca';
Veamos el contenido de la tabla:

 select * from usuarios;
Eliminemos todos los registros:

 delete from usuarios;
Veamos el contenido de la tabla:

 select * from usuarios;
No hay registros.
*/
 if object_id('usuarios') is not null
  drop table usuarios;

 create table usuarios(
  nombre varchar(30),
  clave varchar(10)
 );

 insert into usuarios (nombre,clave)
  values ('Marcelo','River');
 insert into usuarios (nombre,clave)
  values ('Susana','chapita');
 insert into usuarios (nombre,clave)
  values ('CarlosFuentes','Boca');
 insert into usuarios (nombre,clave)
  values ('FedericoLopez','Boca');

 select * from usuarios;

 delete from usuarios
 where nombre='Marcelo';

 select * from usuarios;

 delete from usuarios
 where nombre='Marcelo';

 select * from usuarios;

 delete from usuarios
  where clave='Boca';

 select * from usuarios;

 delete from usuarios;

 select * from usuarios;