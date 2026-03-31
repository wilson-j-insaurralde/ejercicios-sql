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
--Eliminamos si existe, el valor predeterminado "VP_documento0":

 if object_id ('VP_documento0') is not null
   drop default VP_documento0;
--Creamos el valor predeterminado "VP_documento0" que almacene el valor '00000000':

 create default VP_documento0
  as '00000000';
--Asociamos el valor predeterminado al tipo de datos "tipo_documento" especificando que solamente se aplique a los futuros campos de este tipo:

 exec sp_bindefault VP_documento0, 'tipo_documento', 'futureonly';
--Ejecutamos el procedimiento almacenado "sp_helpconstraint" para verificar que no se aplicó a la tabla "alumnos" porque especificamos la opción "futureonly":

 exec sp_helpconstraint alumnos;
--Creamos la tabla "docentes" con 2 campos: documento (del tipo de dato definido anteriormente) y nombre (30 caracteres):

 create table docentes(
  documento tipo_documento,
  nombre varchar(30)
 );
--Verificamos que se aplicó el valor predeterminado creado anteriormente al campo "documento" de la nueva tabla:

 exec sp_helpconstraint docentes;
--Ingresamos un registro en "alumnos" sin valor para documento y vemos qué se almacenó:

 insert into alumnos default values;
 select * from alumnos;
--En esta tabla no se aplica el valor predeterminado por ello almacena "null", que es el valor por defecto.

--Si ingresamos en la tabla "docentes" un registro con valores por defecto:

 insert into docentes default values;
 select * from docentes;
--Si se almacena el valor predeterminado porque está asociado.

--Quitamos la asociación:

 exec sp_unbindefault 'tipo_documento';
--Volvemos a asociar el valor predeterminado, ahora sin el parámetro "futureonly":

 exec sp_bindefault VP_documento0, 'tipo_documento';
--Ingresamos un registro en "alumnos" y en "docentes" sin valor para documento y vemos qué se almacenó:

 insert into alumnos default values;
 select * from alumnos;
 insert into docentes default values;
 select * from docentes;
--En ambas se almacenó '00000000'.

--Eliminamos si existe, el valor predeterminado "VP_documentoDesconocido":

 if object_id ('VP_documentoDesconocido') is not null
   drop default VP_documentoDesconocido;
--Creamos el valor predeterminado llamado "VP_documentoDesconocido" que almacene el valor 'SinDatos':

 create default VP_documentoDesconocido
  as 'SinDatos';
--Asociamos el valor predeterminado al tipo de datos "tipo_documento" (ya tiene otro valor predeterminado asociado):

 exec sp_bindefault VP_DocumentoDesconocido, 'tipo_documento';
--Veamos si la asociación fue reemplazada en el tipo de datos:

 exec sp_help tipo_documento;
--Note que ahora en la columna "default_name" muestra "VP_documentoDesconocido".

--Veamos si la asociación fue reemplazada en la tabla "alumnos":

 exec p_helpconstraint alumnos;
--Note que ahora el valor predeterminado asociado es "VP_documentoDesconocido".

--Quitamos la asociación del valor predeterminado:

 exec sp_unbindefault 'tipo_documento';
--Veamos si se quitó de ambas tablas:

 exec sp_helpconstraint alumnos;
 exec sp_helpconstraint docentes;
--Ingresamos un registro en "alumnos" y vemos qué se almacenó en el campo "documento":

 insert into alumnos default values;
 select * from alumnos;
--Agregue a la tabla "docentes" una restricción "default" para el campo "documento":

 alter table docentes
 add constraint DF_docentes_documento
 default '--------'
 for documento;
--Ingrese un registro en "docentes" con valores por defecto y vea qué se almacenó en "documento" recuperando los registros:

 insert into docentes default values;
 select * from docentes;
--Asocie el valor predeterminado "VP_documento0" al tipo de datos "tipo_documento":

 exec sp_bindefault VP_documento0, 'tipo_documento';
--Vea qué informa "sp_helpconstraint" acerca de la tabla "docentes":

 exec sp_helpconstraint docentes;
--Tiene asociado el valor por defecto establecido con la restricción "default".

--Ingrese un registro en "docentes" con valores por defecto y vea qué se almacenó en "documento":

 insert into docentes default values;
 select * from docentes;
--Note que guarda el valor por defecto establecido con la restricción.

--Eliminamos la restricción:

 alter table docentes
  drop DF_docentes_documento;
--Vea qué informa "sp_helpconstraint" acerca de la tabla "docentes":

 exec sp_helpconstraint docentes;
--No tiene ningún valor por defecto asociado.

--Asociamos el valor predeterminado "VP_documento0" al tipo de datos "tipo_documento":

 exec sp_bindefault VP_documento0, 'tipo_documento';
--Intente agregar una restricción "default" al campo "documento" de "docentes":

 alter table docentes
 add constraint DF_docentes_documento
 default '--------'
 for documento;
SQL Server no lo permite porque el tipo de dato de ese campo ya tiene un valor predeterminado asociado.