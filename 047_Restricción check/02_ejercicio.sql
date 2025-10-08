/*

Una playa de estacionamiento almacena los datos de los veh�culos que ingresan en la tabla llamada 
"vehiculos".
1- Elimine la tabla, si existe:
 if object_id('vehiculos') is not null
  drop table vehiculos;

2- Cree la tabla:
 create table vehiculos(
  numero int identity,
  patente char(6),
  tipo char(4),
  fechahoraentrada datetime,
  fechahorasalida datetime
 );

3- Ingresamos algunos registros:
 insert into vehiculos values('AIC124','auto','2007/01/17 8:05','2007/01/17 12:30');
 insert into vehiculos values('CAA258','auto','2007/01/17 8:10',null);
 insert into vehiculos values('DSE367','moto','2007/01/17 8:30','2007/01/17 18:00');

4- Agregue una restricci�n "check" que especifique un patr�n de 3 letras y 3 d�gitos para "patente":
 alter table vehiculos
   add constraint CK_vehiculos_patente_patron
   check (patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]');

5- Intente ingresar un registro con un valor inapropiado para "patente":
 insert into vehiculos values('AB1234','auto',getdate(),null);
No lo permite.

6- Agregue una restricci�n "check" que especifique que el campo "tipo" acepte solamente los valores 
"auto" y "moto":
 alter table vehiculos
   add constraint CK_vehiculos_tipo_valores
   check (tipo in ('auto','moto'));

7- Intente modificar el valor del campo "tipo" ingresando un valor inexistente en la lista de 
valores permitidos por la restricci�n establecida a dicho campo:
 update vehiculos set tipo='bici' where patente='AIC124';
No lo permite.

8- Agregue una restricci�n "default" para el campo "tipo" que almacene el valor "bici":
 alter table vehiculos
   add constraint DF_vehiculos_tipo
   default 'bici'
   for tipo;
Lo acepta. Pero, note que va en contra de la restricci�n "check" impuesta en el punto 6.

9- Intente ingresar un registro sin valor para "tipo":
  insert into vehiculos values('SDF134',default,null,null);
No lo permite porque va contra la restricci�n "check" del campo.

10- Agregue una restricci�n "check" para asegurarse que la fecha de entrada a la playa no sea 
posterior a la fecha y hora actual:
 alter table vehiculos
   add constraint CK_vehiculos_fechahoraentrada_actual
   check (fechahoraentrada<=getdate());

11- Agregue otra restricci�n "check" al campo "fechahoraentrada" que establezca que sus valores no 
sean posteriores a "fechahorasalida":
 alter table vehiculos
   add constraint CK_vehiculos_fechahoraentradasalida
   check (fechahoraentrada<=fechahorasalida);

12- Intente ingresar un valor que no cumpla con la primera restricci�n establecida en el campo 
"fechahoraentrada":
 insert into vehiculos values('ABC123','auto','2007/05/05 10:10',null);
La inserci�n no se realiza.

13- Intente modificar un registro para que la salida sea anterior a la entrada:
 update vehiculos set fechahorasalida='2007/01/17 7:30'
   where patente='CAA258';
Mensaje de error.

14- Vea todas las restricciones para la tabla "vehiculos":
 exec sp_helpconstraint vehiculos;
aparecen 5 filas, 4 correspondientes a restricciones "check" y 1 a "default".

15- Establezca una restricci�n "default" para el campo "fechahoraentrada" para que almacene la fecha 
actual del sistema:
 alter table vehiculos
   add constraint DF_vehiculos_fechahoraentrada
   default getdate()
   for fechahoraentrada;

16- Ingrese un registro sin valor para "fechahoraentrada":
 insert into vehiculos values('DFR156','moto',default,default);

17- Vea todos los registros:
 select * from vehiculos;

18- Vea las restricciones:
 exec sp_helpconstraint vehiculos;
4 restricciones "check" y 2 "default".

*/

if OBJECT_ID('vehiculos') is not null
	drop table vehiculos; 

create table vehiculos (
	numero int identity,
	patente char(6),
	tipo char(4),
	fechahoraentrada datetime,
    fechahorasalida datetime

);

 insert into vehiculos values('AIC124','auto','2007/01/17 8:05','2007/01/17 12:30');
 insert into vehiculos values('CAA258','auto','2007/01/17 8:10',null);
 insert into vehiculos values('DSE367','moto','2007/01/17 8:30','2007/01/17 18:00');


 select* from vehiculos;

 alter table vehiculos 
 add constraint CK_vehiculos_patente_patron 
 check (patente like '[A-Z][A-Z][A-Z][0-9][0-9][0-9]');

 /* insert into vehiculos values('AB1234','auto',getdate(),null);*/

 alter table vehiculos 
 add constraint CK_vehiculos_tipo_valores 
 check (tipo in('auto','moto'));

/* update vehiculos set tipo='bici' where patente='AIC124'; */

alter table vehiculos 
add constraint DF_vehiculos_tipo
default 'bici' for tipo ;

  /*insert into vehiculos values('SDF134',default,null,null);*/
  alter table vehiculos 
  add constraint CK_vehiculos_fechahoraentrada_actual
  check (fechahoraentrada<=getdate());

  alter table vehiculos 
  add constraint CK_vehiculos_fechahorasalida_salida
  check (fechahorasalida>=fechahoraentrada);

   /*insert into vehiculos values('ABC123','auto','2025/10/10 21:30',null);*/

  /*  update vehiculos set fechahorasalida='2007/01/17 7:30'
   where patente='CAA258';*/
   exec sp_helpconstraint vehiculos; 
    insert into vehiculos values('DFR156','moto',default,default);

	select * from vehiculos;