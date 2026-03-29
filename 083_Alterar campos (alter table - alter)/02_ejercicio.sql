/*

Trabaje con una tabla llamada "empleados".
1- Elimine la tabla, si existe y créela:
 if object_id('empleados') is not null
  drop table empleados;

 create table empleados(
  legajo int not null,
  documento char(7) not null,
  nombre varchar(10),
  domicilio varchar(30),
  ciudad varchar(20) default 'Buenos Aires',
  sueldo decimal(6,2),
  cantidadhijos tinyint default 0,
  primary key(legajo)
 );

2- Modifique el campo "nombre" extendiendo su longitud.

3- Controle la modificación:
 sp_columns empleados;

4- Modifique el campo "sueldo" para que no admita valores nulos.

4- Modifique el campo "documento" ampliando su longitud a 8 caracteres.

5- Intente modificar el tipo de datos del campo "legajo" a "tinyint":
 alter table empleados
  alter column legajo tinyint not null;
No se puede porque tiene una restricción.

6- Ingrese algunos registros, uno con "nombre" nulo:
 insert into empleados values(1,'22222222','Juan Perez','Colon 123','Cordoba',500,3);
 insert into empleados values(2,'30000000',null,'Sucre 456','Cordoba',600,2);

7- Intente modificar el campo "nombre" para que no acepte valores nulos:
 alter table empleados
  alter column nombre varchar(30) not null;
No se puede porque hay registros con ese valor.

8- Elimine el registro con "nombre" nulo y realice la modificación del punto 7:
 delete from empleados where nombre is null;
 alter table empleados
  alter column nombre varchar(30) not null;

9- Modifique el campo "ciudad" a 10 caracteres.

10- Intente agregar un registro con el valor por defecto para "ciudad":
 insert into empleados values(3,'33333333','Juan Perez','Sarmiento 856',default,500,4);
No se puede porque el campo acepta 10 caracteres y  el valor por defecto tiene 12 caracteres.

11- Modifique el campo "ciudad" sin que afecte la restricción dándole una longitud de 15 caracteres.

12- Agregue el registro que no pudo ingresar en el punto 10:
 insert into empleados values(3,'33333333','Juan Perez','Sarmiento 856',default,500,4);

13- Intente agregar el atributo identity de "legajo".
No se puede agregar este atributo.

*/

if OBJECT_ID('empleados') is not null
drop table empleados;

create table empleados (
  legajo int not null,
  documento char(7) not null,
  nombre varchar(10),
  domicilio varchar(30),
  ciudad varchar(20) default 'Buenos Aires',
  sueldo decimal(6,2),
  cantidadhijos tinyint default 0,
  primary key(legajo)
);


alter table empleados 
alter column nombre varchar(30);

exec sp_columns empleados;

alter table empleados 
alter column sueldo decimal(6,2) not null;
exec sp_columns empleados ;

alter table empleados 
alter column documento char(8) not null;
exec sp_columns empleados;

 alter table empleados
  alter column legajo tinyint not null;

 insert into empleados values(1,'22222222','Juan Perez','Colon 123','Cordoba',500,3);
 insert into empleados values(2,'30000000',null,'Sucre 456','Cordoba',600,2);

 alter table empleados
  alter column nombre varchar(30) not null;

  delete from empleados where nombre is null;
  alter table empleados
  alter column nombre varchar(30) not null;

  alter table empleados 
  alter column ciudad varchar(10);

  insert into empleados values(3,'33333333','Juan Perez','Sarmiento 856',default,500,4);

   alter table empleados
  alter column ciudad varchar(15);

  insert into empleados values(3,'33333333','Juan Perez','Sarmiento 856',default,500,4);

   alter table empleados
  alter column legajo int identity;