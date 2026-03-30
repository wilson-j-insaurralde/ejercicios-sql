--Una academia de enseñanza almacena los datos de sus alumnos en una tabla llamada "alumnos" y en otra tabla denominada "docentes" los datos de los profesores.
--Eliminamos ambas tablas, si existen:

 if object_id('alumnos') is not null
  drop table alumnos;
 if object_id('docentes') is not null
  drop table docentes;
--Queremos definir un nuevo tipo de dato llamado "tipo_documento". Primero debemos eliminarlo, si existe para volver a crearlo. Para ello empleamos esta sentencia que explicaremos próximamente:

 if exists (select *from systypes
  where name = 'tipo_documento')
  exec sp_droptype tipo_documento;
--Creamos un tipo de dato definido por el usuario llamado "tipo_documento" basado en el tipo "char" que permita 8 caracteres y valores nulos:

 exec sp_addtype tipo_documento, 'char(8)', 'null';
--Ejecutamos el procedimiento almacenado "sp_help" junto al nombre del tipo de dato definido anteriormente para obtener información del mismo:

 exec sp_help tipo_documento;
--Aparecen varias columnas que nos informan, entre otras cosas: el nombre (tipo_documento), el tipo de dato en que se basa (char), la longitud (8), si acepta valores nulos (yes); las columnas "default_name" y "rule_name" muestran "none" porque no tiene valores predeterminados ni reglas asociados.

--Creamos la tabla "alumnos" con 2 campos: documento (del tipo de dato definido anteriormente) y nombre (30 caracteres):

 create table alumnos(
  documento tipo_documento,
  nombre varchar(30)
 );
--Eliminamos si existe, la regla "RG_documento":

 if object_id ('RG_documento') is not null
   drop rule RG_documento;
--Creamos la regla que permita 8 caracteres que solamente pueden ser dígitos del 0 al 5 para el primer dígito y de 0 al 9 para los siguientes:

 create rule RG_documento
  as @documento like '[0-5][0-9][0-9][0-9][0-9][0-9][0-9][0-9]';
--Asociamos la regla al tipo de datos "tipo_documento" especificando que solamente se aplique a los futuros campos de este tipo:

 exec sp_bindrule RG_documento, 'tipo_documento', 'futureonly';
--Ejecutamos el procedimiento almacenado "sp_helpconstraint" para verificar que no se aplicó a la tabla "alumnos" porque especificamos la opción "futureonly":

 exec sp_helpconstraint alumnos;
--Creamos la tabla "docentes" con 2 campos: documento (del tipo de dato definido anteriormente) y nombre (30 caracteres):

 create table docentes(
  documento tipo_documento,
  nombre varchar(30)
 );
--Verificamos que se aplicó la regla en la nueva tabla:

 exec sp_helpconstraint docentes;
--Ingresamos registros en "alumnos" con valores para documento que infrinjan la regla:

 insert into alumnos values('a111111','Ana Acosta');
--Lo acepta porque en esta tabla no se aplica la regla. Pero no podríamos ingresar un valor como el anterior en la tabla "docentes" la cual si tiene asociada la regla.

--Quitamos la asociación:

 exec sp_unbindrule 'tipo_documento';
--Volvemos a asociar la regla, ahora sin el parámetro "futureonly":

 exec sp_bindrule RG_documento, 'tipo_documento';
--Note que hay valores que no cumplen la regla, recuerde que SQL Server NO controla los datos existentes al momento de asociar una regla; pero si al ejecutar un "insert" o "update".

--Verificamos que se aplicó la regla en ambas tablas:

 exec sp_helpconstraint docentes;
 exec sp_helpconstraint alumnos;
--Eliminamos si existe, la regla "RG_documento2":

 if object_id ('RG_documento2') is not null
   drop rule RG_documento2;
--Creamos la regla llamada "RG_documento2" que permita 8 caracteres que solamente pueden ser dígitos del 0 al 9 para todas las posiciones:

 create rule RG_documento2
  as @documento like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]';
--Asociamos la regla al tipo de datos "tipo_documento" (ya tiene una regla asociada):

 exec sp_bindrule RG_documento2, 'tipo_documento';
--Veamos si la asociación fue reemplazada en el tipo de datos:

 exec sp_help tipo_documento;
--Note que ahora en la columna "Rule_name" muestra "RG_documento2".

--Veamos si la asociación fue reemplazada en las tablas:

 exec sp_helpconstraint alumnos;
 exec sp_helpconstraint docentes;
--Note que ahora la regla asociada es "RG_documento2".

--Asociamos la regla "RG_documento" al campo "documento" de "alumnos":

 exec sp_bindrule RG_documento, 'alumnos.documento';
--Verificamos que "documento" de "alumnos" tiene asociada la regla "RG_documento":

 exec sp_helpconstraint alumnos;
--Verificamos que el tipo de dato "tipo_documento" tiene asociada la regla "RG_documento2":

 exec sp_help tipo_documento;
--Intente ingresar un valor para "documento" aceptado por la regla asociada al tipo de dato pero no por la regla asociada al campo:

 insert into alumnos values ('77777777','Juan Lopez');
--No lo permite.

--Ingrese un valor para "documento" aceptado por la regla asociada al campo:

 insert into alumnos values ('55555555','Juan Lopez');