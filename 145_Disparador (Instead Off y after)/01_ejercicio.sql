--Una empresa almacena los datos de sus empleados en una tabla "empleados" y en otra tabla "clientes" los datos de sus clientes.
--Eliminamos las tablas si existen:

 if object_id('empleados') is not null
  drop table empleados;
 if object_id('clientes') is not null
  drop table clientes;
--Creamos ambas tablas:

 create table empleados(
  documento char(8) not null,
  nombre varchar(30),
  domicilio varchar(30),
  constraint PK_empleados primary key(documento)
 );

 create table clientes(
  documento char(8) not null,
  nombre varchar(30),
  domicilio varchar(30),
  constraint PK_clientes primary key(documento)
 );
--Eliminamos la siguiente vista:

 if object_id('vista_empleados_clientes') is not null
  drop view vista_empleados_clientes;
--Creamos una vista que muestra los datos de ambas tablas:

 create view vista_empleados_clientes
 as
  select documento,nombre, domicilio, 'empleado' as condicion from empleados
  union
   select documento,nombre, domicilio,'cliente' from clientes;
--Creamos un disparador sobre la vista "vista_empleados_clientes" para inserción, que redirija las inserciones a la tabla correspondiente:

 create trigger DIS_empl_clie_insertar
  on vista_empleados_clientes
  instead of insert
  as
    insert into empleados 
     select documento,nombre,domicilio
     from inserted where condicion='empleado'

    insert into clientes
     select documento,nombre,domicilio
     from inserted where condicion='cliente';
--Ingresamos un empleado y un cliente en la vista:

 insert into vista_empleados_clientes values('22222222','Ana Acosta', 'Avellaneda 345','empleado');
 insert into vista_empleados_clientes values('23333333','Bernardo Bustos', 'Bulnes 587','cliente');
--Veamos si se almacenaron en la tabla correspondiente:

 select *from empleados;
 select *from clientes;
--Creamos un disparador sobre la vista "vista_empleados_clientes" para el evento "update", que redirija las actualizaciones a la tabla correspondiente:

 create trigger DIS_empl_clie_actualizar
  on vista_empleados_clientes
  instead of update
  as
   declare @condicion varchar(10)
   set @condicion = (select condicion from inserted)
   if update(documento)
   begin
    raiserror('Los documentos no pueden modificarse', 10, 1)
    rollback transaction
   end
   else
   begin
    if @condicion ='empleado'
    begin
     update empleados set empleados.nombre=inserted.nombre, empleados.domicilio=inserted.domicilio
     from empleados
     join inserted
     on empleados.documento=inserted.documento
    end
    else
     if @condicion ='cliente'
     begin
      update clientes set clientes.nombre=inserted.nombre, clientes.domicilio=inserted.domicilio
      from clientes
      join inserted
      on clientes.documento=inserted.documento
     end
   end;
--Realizamos una actualización sobre la vista, de un empleado:

 update vista_empleados_clientes set nombre= 'Ana Maria Acosta' where documento='22222222';
--Veamos si se actualizó la tabla correspondiente:

 select *from empleados;
--Realizamos una actualización sobre la vista, de un cliente:

 update vista_empleados_clientes set domicilio='Bulnes 1234' where documento='23333333';
--Veamos si se actualizó la tabla correspondiente:

 select *from clientes;