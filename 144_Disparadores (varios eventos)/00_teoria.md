Hemos aprendido a crear disparadores para diferentes eventos (insert, update y delete).

Dijimos que un disparador puede definirse para más de una acción; en tal caso, deben separarse con comas.



Creamos un trigger para evitar que se inscriban socios que deben matrículas y no permitir que se eliminen las inscripciones de socios deudores. El trigger se define para ambos eventos en la misma sentencia de creación.



&#x20;create trigger dis\_inscriptos\_insert\_delete

&#x20; on inscriptos

&#x20; for insert,delete

&#x20; as

&#x20;  if exists (select \*from inserted join morosos 

&#x20;             on morosos.documento=inserted.documento)

&#x20;  begin

&#x20;    raiserror('El socio es moroso, no puede inscribirse en otro curso', 16, 1)

&#x20;    rollback transaction

&#x20;  end

&#x20;  else

&#x20;    if exists (select \*from deleted join morosos

&#x09;        on morosos.documento=deleted.documento)

&#x20;    begin

&#x20;      raiserror('El socio debe matriculas, no puede borrarse su inscripcion', 16, 1)

&#x20;      rollback transaction

&#x20;    end

&#x20;    else

&#x20;     if (select matricula from inserted)='n'

&#x20;      insert into morosos select documento from inserted;

El trigger controla:



\- si se intenta ingresar una inscripción de un socio moroso, se deshace la transacción;



\- si se intenta eliminar una inscripción de un socio que está en "morosos", se deshace la transacción;



\- si se ingresa una nueva inscripción y no se paga la matrícula, dicho socio se ingresa a la tabla "morosos".



Servidor de SQL Server instalado en forma local.

Ingresemos el siguiente lote de comandos en el SQL Server Management Studio:



if object\_id('inscriptos') is not null

&#x20; drop table inscriptos;

if object\_id('socios') is not null

&#x20; drop table socios;

if object\_id('morosos') is not null

&#x20; drop table morosos;



create table socios(

&#x20; documento char(8) not null,

&#x20; nombre varchar(30),

&#x20; domicilio varchar(30),

&#x20; constraint PK\_socios primary key(documento)

);



create table inscriptos(

&#x20; numero int identity,

&#x20; documento char(8) not null,

&#x20; deporte varchar(20),

&#x20; matricula char(1),

&#x20; constraint FK\_inscriptos\_documento

&#x20;  foreign key (documento)

&#x20;  references socios(documento),

&#x20; constraint CK\_inscriptos\_matricula check (matricula in ('s','n')),

&#x20; constraint PK\_inscriptos primary key(documento,deporte)

);

&#x20;

create table morosos(

&#x20; documento char(8) not null

);



go



insert into socios values('22222222','Ana Acosta','Avellaneda 800');

insert into socios values('23333333','Bernardo Bustos','Bulnes 345');

insert into socios values('24444444','Carlos Caseros','Colon 382');

insert into socios values('25555555','Mariana Morales','Maipu 234');



insert into inscriptos values('22222222','tenis','s');

insert into inscriptos values('22222222','natacion','n');

insert into inscriptos values('23333333','tenis','n');

insert into inscriptos values('24444444','futbol','s');

insert into inscriptos values('24444444','natacion','s');



insert into morosos values('22222222');

insert into morosos values('23333333');



go



\-- Creamos un trigger para evitar que se inscriban socios que deben matrículas y

\-- no permitir que se eliminen las inscripciones de socios deudores.

\-- El trigger se define para ambos eventos en la misma sentencia de creación.

create trigger dis\_inscriptos\_insert\_delete

&#x20; on inscriptos

&#x20; for insert,delete

&#x20; as

&#x20;  if exists (select \*from inserted join morosos 

&#x20;             on morosos.documento=inserted.documento)

&#x20;  begin

&#x20;    raiserror('El socio es moroso, no puede inscribirse en otro curso', 16, 1)

&#x20;    rollback transaction

&#x20;  end

&#x20;  else

&#x20;    if exists (select \*from deleted join morosos

&#x09;        on morosos.documento=deleted.documento)

&#x20;    begin

&#x20;      raiserror('El socio debe matriculas, no puede borrarse su inscripcion', 16, 1)

&#x20;      rollback transaction

&#x20;    end

&#x20;    else

&#x20;     if (select matricula from inserted)='n'

&#x20;      insert into morosos select documento from inserted;



go



\-- Ingresamos una inscripción de un socio no deudor con matrícula paga:

insert into inscriptos values('25555555','tenis','s');

\-- El disparador se activa ante el "insert" y permite la transacción.



\-- Ingresamos una inscripción de un socio no deudor con matrícula 'n':

insert into inscriptos values('25555555','natacion','n');

\-- El disparador se activa ante el "insert", permite la transacción y agrega 

\-- al socio en la tabla "morosos".



\--Verifiquémoslo consultando las tablas correspondientes: 

select \* from inscriptos;

select \* from morosos;



\-- Ingresamos una inscripción de un socio deudor:

insert into inscriptos values('25555555','basquet','s');

\-- El disparador se activa ante el "insert" y deshace la transacción porque

\-- encuentra su documento en la tabla "morosos".



\-- Eliminamos una inscripción de un socio no deudor:

delete inscriptos where numero=4;

\-- El disparador se activa ante la sentencia "delete" y permite la transacción.



\-- Verificamos que la inscripción nº 4 fue eliminada de "inscriptos":

select \* from inscriptos;



\-- Intentamos eliminar una inscripción de un socio deudor:

delete inscriptos where numero=6;

\-- El disparador se activa ante el "delete" y deshace la transacción porque

\-- encuentra su documento en "morosos".



