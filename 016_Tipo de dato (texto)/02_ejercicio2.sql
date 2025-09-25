/*
Una empresa almacena los datos de sus clientes en una tabla llamada "clientes".
1- Elimine la tabla "clientes" si existe:
 if object_id('clientes') is not null
  drop table clientes;

2- Créela eligiendo el tipo de dato más adecuado para cada campo:
 create table clientes(
  documento char(8),
  apellido varchar(20),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar (11)
 );

3- Analice la definición de los campos. Se utiliza char(8) para el documento porque siempre constará 
de 8 caracteres. Para el número telefónico se usar "varchar" y no un tipo numérico porque si bien es 
un número, con él no se realizarán operaciones matemáticas.

4- Ingrese algunos registros:
 insert into clientes
  values('2233344','Perez','Juan','Sarmiento 980','4342345');
 insert into clientes (documento,apellido,nombre,domicilio)
  values('2333344','Perez','Ana','Colon 234');
 insert into clientes
  values('2433344','Garcia','Luis','Avellaneda 1454','4558877');
 insert into clientes
  values('2533344','Juarez','Ana','Urquiza 444','4789900');

5- Seleccione todos los clientes de apellido "Perez" (2 registros):
 select * from clientes
  where apellido='Perez';
*/

 if object_id('clientes') is not null
  drop table clientes;

 create table clientes(
  documento char(8),
  apellido varchar(20),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar (11)
 );

 insert into clientes
  values('2233344','Perez','Juan','Sarmiento 980','4342345');
 insert into clientes (documento,apellido,nombre,domicilio)
  values('2333344','Perez','Ana','Colon 234');
 insert into clientes
  values('2433344','Garcia','Luis','Avellaneda 1454','4558877');
 insert into clientes
  values('2533344','Juarez','Ana','Urquiza 444','4789900');

 select * from clientes
  where apellido='Perez';