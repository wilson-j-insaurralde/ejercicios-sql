--Una academia de enseñanza almacena los datos de sus alumnos en una tabla llamada "alumnos".
--Eliminamos la tabla si existe:

 if object_id('alumnos') is not null
  drop table alumnos;
--Definimos un nuevo tipo de dato llamado "tipo_documento". Primero debemos eliminarlo, si existe, para volver a crearlo:

 if exists (select *from systypes
  where name = 'tipo_documento')
  exec sp_droptype tipo_documento;
--Creamos un tipo de dato definido por el usuario llamado "tipo_documento" basado en el tipo "char" que permita 8 caracteres y valores nulos:

 exec sp_addtype tipo_documento, 'char(8)', 'null';
--Eliminamos la regla "RG_documento" si existe:

 if object_id ('RG_documento') is not null
   drop rule RG_documento;
--Creamos la regla que permita 8 caracteres que solamente serán dígitos:

 create rule RG_documento
  as @documento like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]';
--Asociamos la regla al tipo de datos "tipo_documento":

 exec sp_bindrule RG_documento, 'tipo_documento';
--Creamos la tabla "alumnos":

 create table alumnos(
  nombre varchar(30),
  documento tipo_documento
 );
--No podemos eliminar el tipo de dato "tipo_documento" porque hay una tabla "alumnos" que lo utiliza. Entonces eliminamos la tabla:

 drop table alumnos;
--Ahora podemos eliminar el tipo de datos:

 exec sp_droptype tipo_documento;
--Note que no quitamos la asociación de la regla al tipo de datos, pero la asociación se quitó al eliminar el tipo de dato.

--Volvemos a crear el tipo de dato:

 exec sp_addtype tipo_documento, 'char(8)', 'null';
--Note que no tiene reglas asociadas:

 exec sp_help tipo_documento;
--Asociamos la regla nuevamente:

 exec sp_bindrule RG_documento, 'tipo_documento';
--Note que no hemos vuelto a crear la regla porque la regla subsiste