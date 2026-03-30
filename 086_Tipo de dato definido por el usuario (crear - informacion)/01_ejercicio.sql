--Una academia de enseñanza almacena los datos de sus alumnos en una tabla llamada "alumnos".

--Borramos la tabla alumno por si otro usuario creo tipos de datos definidos para la misma:

 if object_id('alumnos') is not null
  drop table alumnos;
--Queremos definir un nuevo tipo de dato llamado "tipo_documento". Primero debemos eliminarlo, si existe para volver a crearlo. Para ello empleamos esta sentencia que explicaremos en el siguiente capítulo:
 if exists (select *from systypes
  where name = 'tipo_documento')
  exec sp_droptype tipo_documento;
--Creamos un tipo de dato definido por el usuario llamado "tipo_documento" basado en el tipo "char" que permita 8 caracteres y valores nulos:

 exec sp_addtype tipo_documento, 'char(8)', 'null';
--Ejecutamos el procedimiento almacenado "sp_help" junto al nombre del tipo de dato definido anteriormente para obtener información del mismo:

 exec sp_help tipo_documento;
--Aparecen varias columnas: el nombre, el tipo de dato en que se basa, la longitud, si acepta valores nulos; las columnas "default_name" y "rule_name" muestran "none" porque no tiene valores predeterminados ni reglas asociados.

--Creamos la tabla "alumnos" con 2 campos: documento (del tipo de dato definido anteriormente) y nombre (30 caracteres). Antes la eliminamos (si existe):

 create table alumnos(
  documento tipo_documento,
  nombre varchar(30)
 );
--Ingresamos un registro con valor para "documento" permitido por el tipo de dato:

 insert into alumnos values('12345678','Ana Acosta');
--No podríamos ingresar en "documento" una cadena de 9 caracteres.