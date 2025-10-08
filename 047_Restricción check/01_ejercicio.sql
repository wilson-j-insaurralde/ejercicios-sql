/*
Una empresa tiene registrados datos de sus empleados en una tabla llamada "empleados".
1- Elimine la tabla si existe:
 if object_id('empleados') is not null
  drop table empleados;

2- Créela con la siguiente estructura:
 create table empleados (
  documento varchar(8),
  nombre varchar(30),
  fechanacimiento datetime,
  cantidadhijos tinyint,
  seccion varchar(20),
  sueldo decimal(6,2)
 );

3- Agregue una restricción "check" para asegurarse que no se ingresen valores negativos para el 
sueldo:
 alter table empleados
   add constraint CK_empleados_sueldo_positivo
   check (sueldo>0);

4- Ingrese algunos registros válidos:
 insert into empleados values ('22222222','Alberto Lopez','1965/10/05',1,'Sistemas',1000);
 insert into empleados values ('33333333','Beatriz Garcia','1972/08/15',2,'Administracion',3000);
 insert into empleados values ('34444444','Carlos Caseres','1980/10/05',0,'Contaduría',6000);

5- Intente agregar otra restricción "check" al campo sueldo para asegurar que ninguno supere el 
valor 5000:
 alter table empleados
   add constraint CK_empleados_sueldo_maximo
   check (sueldo<=5000);
La sentencia no se ejecuta porque hay un sueldo que no cumple la restricción.

6- Elimine el registro infractor y vuelva a crear la restricción:
 delete from empleados where sueldo=6000;

 alter table empleados
   add constraint CK_empleados_sueldo_maximo
   check (sueldo<=5000); 

7- Establezca una restricción para controlar que la fecha de nacimiento que se ingresa no supere la 
fecha actual:
 alter table empleados
   add constraint CK_fechanacimiento_actual
   check (fechanacimiento<getdate());

8- Establezca una restricción "check" para "seccion" que permita solamente los valores "Sistemas", 
"Administracion" y "Contaduría":
 alter table empleados
   add constraint CK_empleados_seccion_lista
   check (seccion in ('Sistemas','Administracion','Contaduria'));

9- Establezca una restricción "check" para "cantidadhijos" que permita solamente valores entre 0 y 
15.

10- Vea todas las restricciones de la tabla (5 filas):
 exec sp_helpconstraint empleados;

11- Intente agregar un registro que vaya contra alguna de las restricciones al campo "sueldo".
Mensaje de error porque se infringe la restricción "CK_empleados_sueldo_positivo".

12- Intente agregar un registro con fecha de nacimiento futura.
Mensaje de error.

13- Intente modificar un registro colocando en "cantidadhijos" el valor "21".
Mensaje de error.

14- Intente modificar el valor de algún registro en el campo "seccion" cambiándolo por uno que no 
esté incluido en la lista de permitidos.
Mensaje de error.

15- Intente agregar una restricción al campo sección para aceptar solamente valores que comiencen 
con la letra "B":
 alter table empleados
   add constraint CK_seccion_letrainicial
   check (seccion like '%B');
Note que NO se puede establecer esta restricción porque va en contra de la establecida anteriormente 
para el mismo campo, si lo permitiera, no podríamos ingresar ningún valor para "seccion".
*/

if OBJECT_ID('empleados') is not null 
	drop table empleados; 

create table empleados (
	documento varchar(8), 
	nombre varchar(30),
	fechanacimiento datetime,
	cantidadhijos tinyint,
	seccion varchar(20),
	sueldo decimal(6,2)
	);

	alter table empleados 
	add constraint CK_empleados_sueldo_positivo
	check (sueldo>=0);

	 insert into empleados values ('22222222','Alberto Lopez','1965/10/05',1,'Sistemas',1000);
	 insert into empleados values ('33333333','Beatriz Garcia','1972/08/15',2,'Administracion',3000);
	 insert into empleados values ('34444444','Carlos Caseres','1980/10/05',0,'Contaduría',6000);

	 /*alter table empleados 
	 add constraint CK_empleados_sueldo_maximo 
	 check (sueldo<=5000);*/
	 /*La sentencia no se ejecuta porque hay un sueldo que no cumple la restricción*/

	 select * from empleados ;
	 delete from empleados where sueldo>5000 ;

	alter table empleados 
	add constraint CK_empleados_sueldo_maximo
	check (sueldo<=5000);

	alter table empleados 
	add constraint CK_empleados_fechanacimiento_actual
	check (fechanacimiento<getdate());

	alter table empleados 
	add constraint CK_empleados_seccion_lista
	check (seccion in ('Sistemas','Administracion','Contaduria'));

	alter table empleados 
	add constraint CK_empleados_cantidadhijos_limit 
	check (cantidadhijos between 0 and 15);

	exec sp_helpconstraint empleados;

	/*
	 insert into empleados
  values ('24444444','Carlos Fuentes','1980/02/05',2,'Administracion',-1500);

 insert into empleados
  values ('25555555','Daniel Garcia','2007/05/05',2,'Sistemas',1550);

 update empleados set cantidadhijos=21 where documento='22222222';

 update empleados set seccion='Recursos' where documento='22222222';
	*/
	/*
	 alter table empleados
   add constraint CK_empleados_seccion_letrainicial
   check (seccion like '%B');
   select * from empleados;
   exec sp_helpconstraint empleados;  */
