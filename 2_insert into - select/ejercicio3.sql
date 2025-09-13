/*
Problema:
Vamos a crear una tabla llamada "usuarios". En primer lugar vamos a eliminar la tabla "usuarios" averiguando si existe (recuerde que debemos repetir siempre esto porque puede haber otro usuario que haya creado una tabla con el mismo nombre en el servidor www.tutorialesprogramacionya.com):

 if object_id('usuarios') is not null
  drop table usuarios;
Recordar que debemos finalizar cada comando con un punto y coma.

Creamos la tabla:

 create table usuarios(
  nombre varchar(30),
  clave varchar(10)
 );
Agregamos un registro a la tabla:

 insert into usuarios (nombre, clave) values ('Mariano','payaso');
Veamos si el registro se guardó:

 select * from usuarios;
Ingresemos otro registro alterando el orden de los campos:

 insert into usuarios (clave, nombre) values ('River','Juan');
Veamos cómo SQL Server almacenó los datos:

 select * from usuarios;
Ingresemos otro registro colocando los valores en distinto orden en que se nombran los campos:

 insert into usuarios (nombre,clave) values ('Boca','Luis');
Veamos cómo se guardaron los datos:

 select * from usuarios;
Note que la cadena "Boca" se almacenó en el campo "nombre" y la cadena "Luis" en el campo "clave".
*/
 if object_id('usuarios') is not null
  drop table usuarios;

 create table usuarios(
  nombre varchar(30),
  clave varchar(10)
 );

 insert into usuarios (nombre, clave) values ('Mariano','payaso');

 select * from usuarios;

 insert into usuarios (clave, nombre) values ('River','Juan');

 select * from usuarios;

 insert into usuarios (nombre,clave) values ('Boca','Luis');

 select * from usuarios;