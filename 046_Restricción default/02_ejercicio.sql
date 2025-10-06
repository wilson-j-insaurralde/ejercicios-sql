/*
Una playa de estacionamiento almacena cada día los datos de los vehículos que ingresan en la tabla 
llamada "vehiculos".
1- Elimine la tabla, si existe:
 if object_id('vehiculos') is not null
  drop table vehiculos;

2- Cree la tabla:
 create table vehiculos(
  patente char(6) not null,
  tipo char(1),--'a'=auto, 'm'=moto
  horallegada datetime,
  horasalida datetime
 );

3- Establezca una restricción "default" para el campo "tipo" que almacene el valor "a" en caso de no 
ingresarse valor para dicho campo.

4- Ingrese un registro sin valor para el campo "tipo":
 insert into vehiculos values('BVB111',default,default,null);

5- Recupere los registros:
 select * from vehiculos;

6- Intente establecer otra restricción "default" para el campo "tipo" que almacene el valor "m" en 
caso de no ingresarse valor para dicho campo.
No lo permite porque un campo solamente admite una restricción "default" y ya tiene una.

7- Establezca una restricción "default" para el campo "horallegada" que almacene la fecha y hora del 
sistema.

8- Ingrese un registro sin valor para los campos de tipo datetime.

9- Recupere los registros:
 select * from vehiculos;

10- Vea las restricciones.
2 restricciones.

*/

if OBJECT_ID('vehiculos') is not null 
	drop table vehiculos ;

create table vehiculos(
	patente char (6) not null,
	tipo char(1) ,--'a'=auto, 'm'=moto
	horallegada datetime,
	horasalida datetime

);

alter table vehiculos 
add constraint df_vehiculos_tipo
default 'a' for tipo;

insert into vehiculos values('BVB111',default,default,null);
 select * from vehiculos;
 /*
 alter table vehiculos 
add constraint df_vehiculos_tipo2
default 'm' for tipo;
 */

  alter table vehiculos
  add constraint DF_vehiculos_horallegada
  default getdate()
  for horallegada;

 insert into vehiculos (patente,tipo) values('CAA258','a');

  select * from vehiculos; 

  exec sp_helpconstraint vehiculos; 