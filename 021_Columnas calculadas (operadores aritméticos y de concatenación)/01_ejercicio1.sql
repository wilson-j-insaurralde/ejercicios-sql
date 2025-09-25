/*
Un comercio que vende art�culos de computaci�n registra los datos de sus art�culos en una tabla con 
ese nombre.
1- Elimine la tabla si existe:
 if object_id ('articulos') is not null
  drop table articulos;

2- Cree la tabla:
 create table articulos(
  codigo int identity,
  nombre varchar(20),
  descripcion varchar(30),
  precio smallmoney,
  cantidad tinyint default 0,
  primary key (codigo)
 );

3- Ingrese algunos registros:
 insert into articulos (nombre, descripcion, precio,cantidad)
  values ('impresora','Epson Stylus C45',400.80,20);
 insert into articulos (nombre, descripcion, precio)
  values ('impresora','Epson Stylus C85',500);
 insert into articulos (nombre, descripcion, precio)
  values ('monitor','Samsung 14',800);
 insert into articulos (nombre, descripcion, precio,cantidad)
  values ('teclado','ingles Biswal',100,50);

4- El comercio quiere aumentar los precios de todos sus art�culos en un 15%. Actualice todos los 
precios empleando operadores aritm�ticos.

5- Vea el resultado:
 select * from articulos;

6- Muestre todos los art�culos, concatenando el nombre y la descripci�n de cada uno de ellos 
separados por coma.

7- Reste a la cantidad de todos los teclados, el valor 5, empleando el operador aritm�tico menos ("-")
*/

 if object_id ('articulos') is not null
  drop table articulos;

 create table articulos(
  codigo int identity,
  nombre varchar(20),
  descripcion varchar(30),
  precio smallmoney,
  cantidad tinyint default 0,
  primary key (codigo)
 );

 insert into articulos (nombre, descripcion, precio,cantidad)
  values ('impresora','Epson Stylus C45',400.80,20);
 insert into articulos (nombre, descripcion, precio)
  values ('impresora','Epson Stylus C85',500);
 insert into articulos (nombre, descripcion, precio)
  values ('monitor','Samsung 14',800);
 insert into articulos (nombre, descripcion, precio,cantidad)
  values ('teclado','ingles Biswal',100,50);

 update articulos set precio=precio+(precio*0.15);

 select * from articulos;

 select nombre+','+descripcion
  from articulos;

 update articulos set cantidad=cantidad-5
 where nombre='teclado';

 select * from articulos;
