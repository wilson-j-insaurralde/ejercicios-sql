/*
Un comercio que vende artículos de computación registra los datos de sus artículos en una tabla con 
ese nombre.

1- Elimine "articulos", si existe:
 if object_id('articulos') is not null
  drop table articulos;

2- Cree la tabla, con la siguiente estructura:
 create table articulos(
  codigo integer,
  nombre varchar(20),
  descripcion varchar(30),
  precio float,
  cantidad integer
 );

3- Vea la estructura de la tabla.

4- Ingrese algunos registros:
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (1,'impresora','Epson Stylus C45',400.80,20);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (2,'impresora','Epson Stylus C85',500,30);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (3,'monitor','Samsung 14',800,10);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (4,'teclado','ingles Biswal',100,50);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (5,'teclado','español Biswal',90,50);

5- Elimine los artículos cuyo precio sea mayor o igual a 500 (2 registros)
 delete from articulos
  where precio>=500;

7- Elimine todas las impresoras (1 registro)
 delete from articulos
  where nombre='impresora';

8- Elimine todos los artículos cuyo código sea diferente a 4 (1 registro)
 delete from articulos
  where codigo<>4;

9- Mostrar la tabla después que borra cada registro.

*/
if object_id('articulos') is not null
  drop table articulos;

 create table articulos(
  codigo integer,
  nombre varchar(20),
  descripcion varchar(30),
  precio float,
  cantidad integer
 );

 exec sp_columns articulos;

 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (1,'impresora','Epson Stylus C45',400.80,20);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (2,'impresora','Epson Stylus C85',500,30);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (3,'monitor','Samsung 14',800,10);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (4,'teclado','ingles Biswal',100,50);
 insert into articulos (codigo, nombre, descripcion, precio,cantidad)
  values (5,'teclado','español Biswal',90,50);

 delete from articulos
  where precio>=500;

 select * from articulos;

 delete from articulos
  where nombre='impresora';

 select * from articulos;

 delete from articulos
  where codigo<>4;

 select * from articulos;