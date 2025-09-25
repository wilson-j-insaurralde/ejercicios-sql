/*
Trabaje con la tabla "agenda" que registra la información referente a sus amigos.

1- Elimine la tabla si existe:
 if object_id('agenda') is not null
  drop table agenda;

2- Cree la tabla con los siguientes campos: apellido (cadena de 30), nombre (cadena de 20), 
domicilio (cadena de 30) y telefono (cadena de 11):
 create table agenda(
  apellido varchar(30),
  nombre varchar(20),
  domicilio varchar(30),
  telefono varchar(11)
 );

3- Ingrese los siguientes registros (insert into):
 Alvarez,Alberto,Colon 123,4234567,
 Juarez,Juan,Avellaneda 135,4458787,
 Lopez,Maria,Urquiza 333,4545454,
 Lopez,Jose,Urquiza 333,4545454,
 Salas,Susana,Gral. Paz 1234,4123456.

4- Elimine el registro cuyo nombre sea "Juan" (1 registro afectado)

5- Elimine los registros cuyo número telefónico sea igual a "4545454" (2 registros afectados):

6- Muestre la tabla.

7- Elimine todos los registros (2 registros afectados):

8- Muestre la tabla.
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
   values('Alvarez','Alberto','Colon 123','4234567');
 insert into agenda (apellido,nombre,domicilio,telefono)
   values('Juarez','Juan','Avellaneda 135','4458787');
 insert into agenda (apellido,nombre,domicilio,telefono)
   values('Lopez','Maria','Urquiza 333','4545454');
 insert into agenda (apellido,nombre,domicilio,telefono)
   values('Lopez','Jose','Urquiza 333','4545454');
 insert into agenda (apellido,nombre,domicilio,telefono)
   values('Salas','Susana','Gral. Paz 1234','4123456');

 delete from agenda
 where nombre='Juan';

 delete from agenda
 where telefono='4545454';

 select * from agenda;

 delete from agenda;

 select * from agenda;