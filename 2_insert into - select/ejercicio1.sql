/*
Primer problema:
Trabaje con la tabla "agenda" que almacena información de sus amigos.
1- Elimine la tabla "agenda", si existe:
 if object_id('agenda') is not null
  drop table agenda;

2- Cree una tabla llamada "agenda". Debe tener los siguientes campos: apellido (cadena de 30), 
nombre (cadena de 20), domicilio (cadena de 30) y telefono (cadena de 11):

3- Visualice las tablas existentes para verificar la creación de "agenda" 
(exec sp_tables @table_owner='dbo').

4- Visualice la estructura de la tabla "agenda" (sp_columns).

5- Ingrese los siguientes registros:
 insert into agenda (apellido, nombre, domicilio, telefono)
  values ('Moreno','Alberto','Colon 123','4234567');
 insert into agenda (apellido,nombre, domicilio, telefono)
  values ('Torres','Juan','Avellaneda 135','4458787');

6- Seleccione todos los registros de la tabla:
 select * from agenda;

7- Elimine la tabla "agenda":
 drop table agenda;

8- Intente eliminar la tabla nuevamente (aparece un mensaje de error):
 drop table agenda;
*/

 if object_id('agenda') is not null
  drop table agenda;

 create table agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
 );

 exec sp_tables @table_owner='dbo';

 exec sp_columns agenda;

 insert into agenda (apellido, nombre, domicilio, telefono)
  values ('Moreno','Alberto','Colon 123','4234567');
 insert into agenda (apellido,nombre, domicilio, telefono)
  values ('Torres','Juan','Avellaneda 135','4458787');

 select * from agenda;

 drop table agenda;

