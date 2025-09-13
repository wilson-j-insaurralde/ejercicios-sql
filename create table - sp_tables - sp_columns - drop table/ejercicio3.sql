/*
Problema:
Vamos a crear una tabla llamada "usuarios". En primer lugar vamos a eliminar la tabla "usuarios" averiguando si existe (a esto vamos a repetirlo siempre porque puede haber otro usuario que haya creado una tabla con el mismo nombre):

 if object_id('usuarios') is not null
  drop table usuarios;
Recordar que debemos finalizar cada comando con un punto y coma.

La tabla "usuarios" contendrá los siguientes campos:

- nombre: varchar de 30 caracteres de longitud,
- clave: varchar de 10 caracteres de longitud.
Ahora si creamos la tabla:

 create table usuarios (
  nombre varchar(30),
  clave varchar(10)
 );
aparece un mensaje indicando que el comando se completó exitosamente.

Veamos las tablas existentes:

 exec sp_tables @table_owner='dbo';
Veamos la estructura de la tabla "usuarios":

 exec sp_columns usuarios;
aparece mucha información que no analizaremos en detalle, como el nombre de la tabla, su propietario, los campos y sus tipos de datos, su longitud, etc.:

...COLUMN_NAME	TYPE_NAME	LENGHT...
_______________________________________
   nombre	varchar		30
   clave	varchar		10
Intentemos crear una tabla con el mismo nombre, mostrará un mensaje indicando que ya hay un objeto llamado 'usuarios' en la base de datos y la sentencia no se ejecutará:

 create table usuarios (
  nombre varchar(30),
  clave varchar(10)
 );
Eliminemos la tabla:

 drop table usuarios;
Verifiquemos si se ha eliminado:

 exec sp_tables @table_owner='dbo';
no debe aparecer la tabla "usuarios".
*/
 if object_id('usuarios') is not null
  drop table usuarios;

 create table usuarios (
  nombre varchar(30),
  clave varchar(10)
 );

exec sp_tables @table_owner='dbo';

exec sp_columns usuarios;

 create table usuarios (
  nombre varchar(30),
  clave varchar(10)
 );

 drop table usuarios;

exec sp_tables @table_owner='dbo';