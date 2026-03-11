/*  
Primer problema:
Una empresa registra los datos de sus clientes en una tabla llamada "clientes".
1- Elimine la tabla si existe:
 if object_id ('clientes') is not null
  drop table clientes;

2- Recuerde que si elimina una tabla, las asociaciones de reglas y valores predeterminados de sus 
campos desaparecen, pero las reglas y valores predeterminados siguen existiendo. Si intenta crear 
una regla o un valor predeterminado con igual nombre que uno existente, aparecerá un mensaje 
indicándolo, por ello, debe eliminarlos (si existen) para poder crearlos nuevamente:
 if object_id ('VP_legajo_patron') is not null
   drop default VP_legajo_patron;
 if object_id ('RG_legajo_patron') is not null
   drop rule RG_legajo_patron;
 if object_id ('RG_legajo') is not null
   drop rule RG_legajo;
 if object_id ('VP_datodesconocido') is not null
   drop default VP_datodesconocido;
 if object_id ('VP_fechaactual') is not null
   drop default VP_fechaactual;

3- Cree la tabla:
 create table clientes(
  legajo char(4),
  nombre varchar(30),
  domicilio varchar(30),
  ciudad varchar(15),
  provincia varchar(20) default 'Cordoba',
  fechaingreso datetime
 );

4- Cree una regla para establecer un patrón para los valores que se ingresen en el campo "legajo" (2 
letras seguido de 2 cifras) llamada "RG_legajo_patron":

5- Asocie la regla al campo "legajo".

6- Cree un valor predeterminado para el campo "legajo" ('AA00') llamado "VP_legajo_patron".

7- Asócielo al campo "legajo".
Recuerde que un campo puede tener un valor predeterminado y reglas asociados.

8- Cree un valor predeterminado con la cadena "??" llamado "VP_datodesconocido".

9- Asócielo al campo "domicilio".

10- Asócielo al campo "ciudad".
Recuerde que un valor predeterminado puede asociarse a varios campos.

11- Ingrese un registro con valores por defecto para los campos "domicilio" y "ciudad" y vea qué 
almacenaron.

12- Intente asociar el valor predeterminado "VP_datodesconocido" al campo "provincia".
No se puede porque dicho campo tiene una restricción "default".

13- Cree un valor predeterminado con la fecha actual llamado "VP_fechaactual".

14- Asócielo al campo "fechaingreso".

15- Ingrese algunos registros para ver cómo se almacenan los valores para los cuales no se insertan 
datos.

16- Asocie el valor predeterminado "VP_datodesconocido" al campo "fechaingreso".
Note que se asoció un valor predeterminado de tipo caracter a un campo de tipo "datetime"; SQL 
Server lo permite, pero al intentar ingresar el valor aparece un mensaje de error.

17- Ingrese un registro con valores por defecto.
No lo permite porque son de distintos tipos.

18- Cree una regla que entre en conflicto con el valor predeterminado "VP_legajo_patron".

19- Asocie la regla al campo "legajo".
Note que la regla especifica que el campo "legajo" debe comenzar con la letra "B", pero el valor 
predeterminado tiene el valor "AA00"; SQL Server realiza la asociación, pero al intentar ingresar el 
valor predeterminado, no puede hacerlo y muestra un mensaje de error.

20- Intente ingresar un registro con el valor "default" para el campo "legajo".
No lo permite porque al intentar ingresar el valor por defecto establecido con el valor 
predeterminado entra en conflicto con la regla "RG_legajo".



*/

if OBJECT_ID('clientes') is not null 
drop table  clientes;

if OBJECT_ID('VP_legajo_patron') is not null 
drop default VP_legajo_patron;
if OBJECT_ID('RG_legajo_patron') is not null 
drop rule RG_legajo_patron;
if OBJECT_ID('RG_legajo') is not null 
drop rule RG_legajo;
if OBJECT_ID('VP_datodesconocido') is not null 
drop default VP_datodesconocido;
if OBJECT_ID('VP_fechaactual') is not null 
drop default VP_fechaactual ;


create table clientes(
	legajo char(4),
	nombre varchar(30),
	domicilio varchar(30),
	ciudad varchar(15),
	provincia varchar(20) default 'Cordoba',
	fechaingreso datetime
);


 create rule RG_legajo_patron
 as @valor like '[A-Z][A-Z][0-9][0-9]';

 exec sp_bindrule RG_legajo_patron,'clientes.legajo';

 create default VP_legajo_patron
  as 'AA00';

 exec sp_bindefault VP_legajo_patron,'clientes.legajo';

 create default VP_datodesconocido
  as '??';

 exec sp_bindefault VP_datodesconocido,'clientes.domicilio';

 exec sp_bindefault VP_datodesconocido,'clientes.ciudad';

 insert into clientes values('GF12','Ana Perez',default,default,'Cordoba','2001-10-10');
 select * from clientes;

 exec sp_bindefault VP_datodesconocido,'clientes.provincia';

 create default VP_fechaactual
  as getdate();

 exec sp_bindefault VP_fechaactual,'clientes.fechaingreso';

 insert into clientes default values;
 select * from clientes;

 exec sp_bindefault VP_datodesconocido,'clientes.fechaingreso';

 insert into clientes default values;

 create rule RG_legajo
  as @valor like 'B%';

 exec sp_bindrule RG_legajo,'clientes.legajo';

 insert into clientes values (default,'Luis Garcia','Colon 876','Cordoba','Cordoba','2001-10-10');
