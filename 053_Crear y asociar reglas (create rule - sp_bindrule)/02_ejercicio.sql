--Problema:
--Una empresa tiene registrados datos de sus empleados en una tabla llamada "empleados".
--Eliminamos la tabla si existe:

 if object_id('empleados') is not null
  drop table empleados;
--La creamos con la siguiente estructura:

 create table empleados (
  documento varchar(8) not null,
  nombre varchar(30),
  seccion varchar(20),
  fechaingreso datetime,
  fechanacimiento datetime,
  hijos tinyint,
  sueldo decimal(6,2)
 );
--Recuerde que las reglas son objetos independientes de las tablas (no se eliminan al borrar la tabla), así que debemos eliminarlas con las siguientes intrucciones (en el siguiente capítulo explicaremos este tema):

 if object_id ('RG_documento_patron') is not null
   drop rule RG_documento_patron;
 if object_id ('RG_empleados_seccion') is not null
   drop rule RG_empleados_seccion;
 if object_id ('RG_empleados_fechaingreso') is not null
   drop rule RG_empleados_fechaingreso;
 if object_id ('RG_hijos') is not null
   drop rule RG_hijos;
 if object_id ('RG_empleados_sueldo') is not null
   drop rule RG_empleados_sueldo;
 if object_id ('RG_empleados_sueldo2') is not null
   drop rule RG_empleados_sueldo2;
--Ingresamos algunos registros:

 insert into empleados 
   values('22222222','Ana Acosta','Contaduria','1990-10-10','1972-10-10',2,700);
 insert into empleados 
   values('23333333','Carlos Costa','Contaduria','1990-12-10','1972-05-04',0,750);
 insert into empleados 
   values('24444444','Daniel Duarte','Sistemas','1995-05-05','1975-10-06',1,880);
 insert into empleados 
   values('25555555','Fabiola Fuentes','Secretaria','1998-02-25','1978-02-08',3,550);
 insert into empleados 
   values('26666666','Gaston Garcia','Secretaria','1999-05-08','1981-01-01',3,670);
 insert into empleados 
   values('27777777','Ines Irala','Gerencia','2000-04-10','1985-12-12',0,6000);
--Creamos una regla que establezca un patrón para el documento:

 create rule RG_documento_patron
 as @documento like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]';
--Ejecutamos el procedimiento almacenado del sistema "sp_help" para ver si la regla creada anteriormente fue creada:

 exec sp_help;
--Ejecutamos el procedimiento almacenado del sistema "sp_helpconstraint" para ver si está asociada la regla a algún campo de "empleados":

 exec sp_helpconstraint empleados;
--No aparece porque aún no la asociamos.

--Si ingresamos un registro con un documento que no cumpla la regla, SQL Server lo acepta porque la regla aún no está asociada al campo:

 insert into empleados 
  values('ab888888','Juan Juarez','Secretaria','2001-04-11','1986-11-12',0,600);
--Asociamos la regla "RG_documento_patron" al campo "documento":

 exec sp_bindrule RG_documento_patron, 'empleados.documento';
--Note que hay un documento que no cumple la regla, pero SQL Server no controla los datos existentes, actúa en inserciones y actualizaciones, si intentamos ingresar un valor para "documento" en el cual incluyamos caracteres, aparecerá un mensaje de error.

--Volvemos a ejecutar "sp_helpconstraint":

 exec sp_helpconstraint empleados;
--Aparece la regla.

--Creamos una regla para restringir los valores que se pueden ingresar en un campo "seccion":

 create rule RG_empleados_seccion
 as @seccion in ('Secretaria','Contaduria','Sistemas','Gerencia');
--La asociamos al campo "seccion":

 exec sp_bindrule RG_empleados_seccion, 'empleados.seccion';
--Creamos una regla para restringir los valores que se pueden ingresar en el campo "fechaingreso", para que no sea posterior a la fecha actual:

 create rule RG_empleados_fechaingreso
 as @fecha <= getdate();
--Asociamos la regla anteriormente creada a los campos "fechaingreso" y "fechanacimiento":

 exec sp_bindrule RG_empleados_fechaingreso, 'empleados.fechaingreso';
 exec sp_bindrule RG_empleados_fechaingreso, 'empleados.fechanacimiento';
--Creamos una regla para restringir los valores que se pueden ingresar en el campo "hijos":

 create rule RG_hijos
 as @hijos between 0 and 20;
--La asociamos al campo "hijos":

 exec sp_bindrule RG_hijos, 'empleados.hijos';
--Creamos una regla para restringir los valores que se pueden ingresar en un campo "sueldo":

 create rule RG_empleados_sueldo
 as @sueldo>0 and @sueldo<= 5000;
--La asociamos al campo "sueldo":

 exec sp_bindrule RG_empleados_sueldo, 'empleados.sueldo';
--Si intentamos ingresar (o actualizar) un registro con el valor "6000" para "sueldo", SQL Server muestra un mensaje de error y la acción no se realiza.

--Creamos otra regla para restringir los valores que se pueden ingresar en un campo "sueldo":

 create rule RG_empleados_sueldo2
 as @sueldo>0 and @sueldo<= 7000;
--La asociamos al campo "sueldo":

 exec sp_bindrule RG_empleados_sueldo2, 'empleados.sueldo';
--La nueva regla reeemplaza la asociación anterior. Ahora podemos ingresar el valor "6000" en el campo "sueldo":

 insert into empleados 
   values('29999999','Luis Lopez','Secretaria','2002-03-03','1990-09-09',0,6000);
--La regla "RG_empleados_sueldo" no desaparece, solamente se deshizo la asociación, veámoslo:

 exec sp_help;
--La regla "RG_empleados_sueldo" aún existe en la base de datos.

--Veamos las reglas asociadas:

 exec sp_helpconstraint empleados;
--La regla "RG_empleados_sueldo" ya no está asociada a ningún campo de la tabla "empleados" así que no aparece; la regla "RG_empleados_sueldo2" si, junto con las otras 5 reglas asociadas.