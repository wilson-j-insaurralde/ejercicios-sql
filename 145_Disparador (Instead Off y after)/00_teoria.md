Hasta el momento hemos aprendido que un trigger se crea sobre una tabla específica para un evento (inserción, eliminación o actualización).



También podemos especificar el momento de disparo del trigger. El momento de disparo indica que las acciones (sentencias) del trigger se ejecuten luego de la acción (insert, delete o update) que dispara el trigger o en lugar de la acción.



La sintaxis para ello es:



&#x20;create trigger NOMBREDISPARADOR

&#x20; on NOMBRETABLA o VISTA

&#x20; MOMENTODEDISPARO-- after o instead of

&#x20; ACCION-- insert, update o delete

&#x20;as 

&#x20; SENTENCIAS

Entonces, el momento de disparo especifica cuando deben ejecutarse las acciones (sentencias) que realiza el trigger. Puede ser "después" (after) o "en lugar" (instead of) del evento que lo dispara.



Si no especificamos el momento de disparo en la creación del trigger, por defecto se establece como "after", es decir, las acciones que el disparador realiza se ejecutan luego del suceso disparador. Hasta el momento, todos los disparadores que creamos han sido "after".



Los disparadores "instead of" se ejecutan en lugar de la acción desencadenante, es decir, cancelan la acción desencadenante (suceso que disparó el trigger) reemplazándola por otras acciones.



Veamos un ejemplo. Una empresa almacena los datos de sus empleados en una tabla "empleados" y en otra tabla "clientes" los datos de sus clientes. Se crea una vista que muestra los datos de ambas tablas:



&#x20;create view vista\_empleados\_clientes

&#x20;as

&#x20; select documento,nombre, domicilio, 'empleado' as condicion from empleados

&#x20; union

&#x20;  select documento,nombre, domicilio,'cliente' from clientes;

Creamos un disparador sobre la vista "vista\_empleados\_clientes" para inserción, que redirija las inserciones a la tabla correspondiente:



&#x20;create trigger DIS\_empleadosclientes\_insertar

&#x20; on vista\_empleados\_clientes

&#x20; instead of insert

&#x20; as

&#x20;   insert into empleados 

&#x20;    select documento,nombre,domicilio

&#x20;    from inserted where condicion='empleado'



&#x20;   insert into clientes

&#x20;    select documento,nombre,domicilio

&#x20;    from inserted where condicion='cliente';

El disparador anterior especifica que cada vez que se ingresen registros en la vista "vista\_empleados\_clientes", en vez de (instead of) realizar la acción (insertar en la vista), se ejecuten las sentencias del trigger, es decir, se ingresen los registros en las tablas correspondientes.



Entonces, las opciones de disparo pueden ser:



a) "after": el trigger se dispara cuando las acciones especificadas (insert, delete y/o update) son ejecutadas; todas las acciones en cascada de una restricción "foreign key" y las comprobaciones de restricciones "check" deben realizarse con éxito antes de ejecutarse el trigger. Es la opción por defecto si solamente colocamos "for" (equivalente a "after").



La sintaxis es:



&#x20;create trigger NOMBREDISPARADOR

&#x20; on NOMBRETABLA

&#x20; after | for-- son equivalentes

&#x20; ACCION-- insert, update o delete

&#x20;as 

&#x20; SENTENCIAS

b) "instead of": sobreescribe la acción desencadenadora del trigger. Se puede definir solamente un disparador de este tipo para cada acción (insert, delete o update) sobre una tabla o vista.



Sintaxis:



&#x20;create trigger NOMBREDISPARADOR

&#x20; on NOMBRETABLA o VISTA

&#x20; instead of

&#x20; ACCION-- insert, update o delete

&#x20;as 

&#x20; SENTENCIAS

Consideraciones:



\- Se pueden crear disparadores "instead of" en vistas y tablas.



\- No se puede crear un disparador "instead of" en vistas definidas "with check option".



\- No se puede crear un disparador "instead of delete" y "instead of update" sobre tablas que tengan una "foreign key" que especifique una acción "on delete cascade" y "on update cascade" respectivamente.



\- Los disparadores "after" no pueden definirse sobre vistas.



\- No pueden crearse disparadores "after" en vistas ni en tablas temporales; pero pueden referenciar vistas y tablas temporales.



\- Si existen restricciones en la tabla del disparador, se comprueban DESPUES de la ejecución del disparador "instead of" y ANTES del disparador "after". Si se infringen las restricciones, se revierten las acciones del disparador "instead of"; en el caso del disparador "after", no se ejecuta.



Servidor de SQL Server instalado en forma local.

Ingresemos el siguiente lote de comandos en el SQL Server Management Studio:



if object\_id('empleados') is not null

&#x20; drop table empleados;

if object\_id('clientes') is not null

&#x20; drop table clientes;



create table empleados(

&#x20; documento char(8) not null,

&#x20; nombre varchar(30),

&#x20; domicilio varchar(30),

&#x20; constraint PK\_empleados primary key(documento)

);



create table clientes(

&#x20; documento char(8) not null,

&#x20; nombre varchar(30),

&#x20; domicilio varchar(30),

&#x20; constraint PK\_clientes primary key(documento)

);



\-- Eliminamos la siguiente vista:

if object\_id('vista\_empleados\_clientes') is not null

&#x20; drop view vista\_empleados\_clientes;



go



\-- Creamos una vista que muestra los datos de ambas tablas:

create view vista\_empleados\_clientes

&#x20;as

&#x20; select documento,nombre, domicilio, 'empleado' as condicion from empleados

&#x20; union

&#x20;  select documento,nombre, domicilio,'cliente' from clientes;



go



\-- Creamos un disparador sobre la vista "vista\_empleados\_clientes" para inserción,

\-- que redirija las inserciones a la tabla correspondiente:

create trigger DIS\_empl\_clie\_insertar

&#x20; on vista\_empleados\_clientes

&#x20; instead of insert

&#x20; as

&#x20;   insert into empleados 

&#x20;    select documento,nombre,domicilio

&#x20;    from inserted where condicion='empleado'



&#x20;   insert into clientes

&#x20;    select documento,nombre,domicilio

&#x20;    from inserted where condicion='cliente';



go



\-- Ingresamos un empleado y un cliente en la vista:

insert into vista\_empleados\_clientes values('22222222','Ana Acosta', 'Avellaneda 345','empleado');

insert into vista\_empleados\_clientes values('23333333','Bernardo Bustos', 'Bulnes 587','cliente');



\-- Veamos si se almacenaron en la tabla correspondiente:

select \* from empleados;

select \* from clientes;



go



\-- Creamos un disparador sobre la vista "vista\_empleados\_clientes" para el evento "update",

\-- que redirija las actualizaciones a la tabla correspondiente:

create trigger DIS\_empl\_clie\_actualizar

&#x20; on vista\_empleados\_clientes

&#x20; instead of update

&#x20; as

&#x20;  declare @condicion varchar(10)

&#x20;  set @condicion = (select condicion from inserted)

&#x20;  if update(documento)

&#x20;  begin

&#x20;   raiserror('Los documentos no pueden modificarse', 10, 1)

&#x20;   rollback transaction

&#x20;  end

&#x20;  else

&#x20;  begin

&#x20;   if @condicion ='empleado'

&#x20;   begin

&#x20;    update empleados set empleados.nombre=inserted.nombre, empleados.domicilio=inserted.domicilio

&#x20;    from empleados

&#x20;    join inserted

&#x20;    on empleados.documento=inserted.documento

&#x20;   end

&#x20;   else

&#x20;    if @condicion ='cliente'

&#x20;    begin

&#x20;     update clientes set clientes.nombre=inserted.nombre, clientes.domicilio=inserted.domicilio

&#x20;     from clientes

&#x20;     join inserted

&#x20;     on clientes.documento=inserted.documento

&#x20;    end

&#x20;  end;



go



\-- Realizamos una actualización sobre la vista, de un empleado:

update vista\_empleados\_clientes set nombre= 'Ana Maria Acosta' where documento='22222222';



\-- Veamos si se actualizó la tabla correspondiente:

select \* from empleados;



\-- Realizamos una actualización sobre la vista, de un cliente:

update vista\_empleados\_clientes set domicilio='Bulnes 1234' where documento='23333333';



\-- Veamos si se actualizó la tabla correspondiente:

select \* from clientes;

