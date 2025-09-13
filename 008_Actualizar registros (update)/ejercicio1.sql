/*
Trabaje con la tabla "agenda" que almacena los datos de sus amigos.

1- Elimine la tabla si existe:
 if object_id('agenda') is not null
  drop table agenda;

2- Cree la tabla:
 create table agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
 );

3- Ingrese los siguientes registros (1 registro actualizado):
 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Acosta','Alberto','Colon 123','4234567');
 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Juarez','Juan','Avellaneda 135','4458787');
 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Lopez','Maria','Urquiza 333','4545454');
 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Lopez','Jose','Urquiza 333','4545454');
 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Suarez','Susana','Gral. Paz 1234','4123456');

4- Modifique el registro cuyo nombre sea "Juan" por "Juan Jose" (1 registro afectado)

5- Actualice los registros cuyo n�mero telef�nico sea igual a "4545454" por "4445566" 
(2 registros afectados)

6- Actualice los registros que tengan en el campo "nombre" el valor "Juan" por "Juan Jose" (ning�n 
registro afectado porque ninguno cumple con la condici�n del "where")

7 - Luego de cada actualizaci�n ejecute un select que muestre todos los registros de la tabla.
*/

 if object_id('agenda') is not null
  drop table agenda;

 create table agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
 );

 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Acosta','Alberto','Colon 123','4234567');
 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Juarez','Juan','Avellaneda 135','4458787');
 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Lopez','Maria','Urquiza 333','4545454');
 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Lopez','Jose','Urquiza 333','4545454');
 insert into agenda (apellido,nombre,domicilio,telefono)
  values ('Suarez','Susana','Gral. Paz 1234','4123456');

 select * from agenda;

 update agenda set nombre='Juan Jose'
  where nombre='Juan';

 select * from agenda;

 update agenda set telefono='4445566'
  where telefono='4545454';

 select * from agenda;

 update agenda set nombre='Juan Jose'
  where nombre='Juan';

 select * from agenda;
