--Una empresa almacena los datos de sus empleados en una tabla denominada "empleados".
--Eliminamos la tabla si existe:

 if object_id('empleados') is not null
  drop table empleados;
--Creamos la tabla, con la siguiente estructura:

 create table empleados(
  documento char(8) not null,
  nombre varchar(30) not null,
  domicilio varchar(30),
  constraint PK_empleados primary key(documento),
 );
--Ingresamos algunos registros:

 insert into empleados values('22000000','Ana Acosta','Avellaneda 56');
 insert into empleados values('23000000','Bernardo Bustos','Bulnes 188');
 insert into empleados values('24000000','Carlos Caseres','Caseros 364');
 insert into empleados values('25555555','Diana Duarte','Colon 1234');
 insert into empleados values('26666666','Diana Duarte','Colon 897');
 insert into empleados values('27777777','Matilda Morales','Colon 542');
--Creamos un disparador para que no permita eliminar más de un registro a la vez de la tabla empleados:

 create trigger dis_empleados_borrar
  on empleados
  for delete
 as
  if (select count(*) from deleted)>1
  begin
    raiserror('No puede eliminar más de un 1 empleado', 16, 1)
    rollback transaction
  end;
--Eliminamos 1 empleado:

 delete from empleados where documento ='22000000';
--El trigger se dispara y realiza la eliminación. Podemos verificarlo consultando "empleados".

--Intentamos eliminar varios empleados:

 delete from empleados where documento like '2%';
--El trigger se dispara, muestra un mensaje y deshace la transacción.

--Alteramos el disparador, para que cambia la cantidad de eliminaciones permitidas de 1 a 3:

 alter trigger dis_empleados_borrar
  on empleados
  for delete
  as 
   if (select count(*) from deleted)>3--antes era 1
   begin
    raiserror('No puede borrar más de 3 empleados',16, 1)
    rollback transaction
   end;
--Intentamos eliminar 5 empleados:

 delete from empleados where documento like '2%';
--El trigger se dispara, muestra el nuevo mensaje y deshace la transacción.

--Eliminamos 3 empleados:

 delete from empleados where domicilio like 'Colon%';
--El trigger se dispara y realiza las eliminaciones solicitadas. Puede verificarse consultando la tabla "empleados".