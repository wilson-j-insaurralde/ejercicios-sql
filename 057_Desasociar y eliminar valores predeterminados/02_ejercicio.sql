/*
Primer problema:
Una librería almacena los datos de sus libros en una tabla llamada "libros".
1- Elimine la tabla si existe:
 if object_id ('libros') is not null
  drop table libros;

2- Recuerde que si elimina una tabla, las asociaciones de reglas y valores predeterminados de sus 
campos desaparecen, pero las reglas y valores predeterminados siguen existiendo. Si intenta crear 
una regla o un valor predeterminado con igual nombre que uno existente, aparecerá un mensaje 
indicándolo, por ello, debe eliminarlos (si existen) para poder crearlos nuevamente:
 if object_id ('VP_cero') is not null
   drop default VP_cero;
 if object_id ('VP_desconocido') is not null
   drop default VP_desconocido;
 if object_id ('RG_positivo') is not null
   drop rule RG_positivo;

3- Cree la tabla:
 create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(20),
  precio decimal(5,2),
  cantidad smallint
 );

4- Cree una regla para impedir que se ingresen valores negativos, llamada "RG_positivo".

5- Asocie la regla al campo "precio".

6- Asocie la regla al campo "cantidad".

7- Cree un valor predeterminado para que almacene el valor cero, llamado "VP_cero".

8- Asócielo al campo "precio".

9- Asócielo al campo "cantidad".

10- Cree un valor predeterminado con la cadena "Desconocido" llamado "VP_desconocido".

11- Asócielo al campo "autor".

12- Asócielo al campo "editorial".

13- Vea las reglas y valores predeterminados con "sp_help":
 exec sp_help;

14- Vea las reglas y valores predeterminados asociados a "libros".
Aparecen 6 filas, 2 corresponden a la regla "RG_positivo" asociadas a los campos "precio" y 
"cantidad"; 2 al valor predeterminado "VP_cero" asociados a los campos "precio" y "cantidad" y 2 al 
valor predeterminado "VP_desconocido" asociados a los campos "editorial" y "autor".

15- Ingrese un registro con valores por defecto para todos los campos, excepto "titulo" y vea qué se 
almacenó.

15- Quite la asociación del valor predeterminado "VP_cero" al campo "precio".

16- Ingrese otro registro con valor predeterminado para el campo "precio" y vea cómo se almacenó.

17- Vea las reglas y valores predeterminados asociados a "libros".
5 filas; el valor predeterminado "VP_cero" ya no está asociado al campo "precio".

18- Verifique que el valor predeterminado "VP_cero" existe aún en la base de datos.

19- Intente eliminar el valor predeterminado "VP_cero".
No se puede porque está asociado al campo "cantidad".

20- Quite la asociación del valor predeterminado "VP_cero" al campo "cantidad".

21- Verifique que ya no existe asociación de este valor predeterminado con la tabla "libros".
4 filas.

22- Verifique que el valor predeterminado "VP_cero" aun existe en la base de datos.

23- Elimine el valor predeterminado "VP_cero".

24- Verifique que ya no existe en la base de datos.
*/


if OBJECT_ID('libros') is not null
drop table libros ;

if OBJECT_ID('VP_cero') is not null
drop default VP_cero;
go
if OBJECT_ID('VP_desconocido') is not null 
drop default VP_desconocido;
go
if OBJECT_ID('RG_positivo') is not null 
drop rule RG_positivo;

create table libros (
	codigo int identity,
	titulo varchar(40) not null,
	autor varchar(30),
	editorial varchar(20),
	precio decimal(5,2),
	cantidad smallint

);

create rule RG_positivo
as @positivo >=0;

go
exec sp_bindrule 'RG_positivo','libros.precio';
go
exec sp_bindrule 'RG_positivo','libros.cantidad';
go 

create default VP_cero
	as 0 ;

go

exec sp_bindefault 'VP_cero','libros.precio';
go
exec sp_bindefault 'VP_cero','libros.cantidad';
go
create default VP_desconocido
as 'desconocido';
go
exec sp_bindefault 'VP_desconocido','libros.autor';
go
exec sp_bindefault 'VP_desconocido','libros.editorial';
go

exec sp_help libros;
exec sp_helpconstraint libros;

 insert into libros (titulo) values('Aprenda PHP');
 select * from libros;

  exec sp_unbindefault 'libros.precio';

   insert into libros (titulo) values('Matematica estas ahi');
 select * from libros;

  exec sp_helpconstraint libros;

 exec sp_help VP_cero;

 drop default VP_cero;

 exec sp_unbindefault 'libros.cantidad';

 exec sp_helpconstraint libros;

 exec sp_help VP_cero;

 drop default VP_cero;

 exec sp_help VP_cero;
