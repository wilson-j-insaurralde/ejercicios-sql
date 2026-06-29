/*

Un club de barrio almacena los datos de sus socios en una tabla llamada "socios", los datos de las 
inscripciones en una tabla denominada "inscriptos" y en una tabla "morosos" almacena el documento de 
los socios inscriptos que deben matrícula.
1- Elimine las tablas si existen:
 if object_id('inscriptos') is not null
  drop table inscriptos;
 if object_id('socios') is not null
  drop table socios;
 if object_id('morosos') is not null
  drop table morosos;

2- Cree las tablas, con las siguientes estructuras:
 create table socios(
  documento char(8) not null,
  nombre varchar(30),
  domicilio varchar(30),
  constraint PK_socios primary key (documento)
 );

 create table inscriptos(
  documento char(8) not null,
  deporte varchar(30) not null,
  matricula char(1),
  constraint CK_inscriptos check (matricula in ('s','n')),
  constraint PK_inscriptos primary key (documento,deporte),
  constraint FK_inscriptos_documento foreign key(documento)
   references socios (documento)
 );

 create table morosos(
  documento char(8) not null
 );

3- Ingrese algunos registros en las tres tablas:
 insert into socios values ('22222222','Ana Acosta','Avellaneda 800');
 insert into socios values ('23333333','Bernardo Bustos','Bulnes 234');
 insert into socios values ('24444444','Carlos Caseros','Colon 321');
 insert into socios values ('25555555','Mariana Morales','Maipu 483');

 insert into inscriptos values ('22222222','tenis','s');
 insert into inscriptos values ('22222222','natacion','n');
 insert into inscriptos values ('23333333','tenis','n');
 insert into inscriptos values ('24444444','tenis','s');
 insert into inscriptos values ('24444444','futbol','s');

 insert into morosos values ('22222222');
 insert into morosos values ('23333333');

4- Cree un disparador de inserción que no permita ingresar inscripciones si el socio es moroso, es 
decir, si está en la tabla "morosos".

5- Realice la inscripción de un socio que no deba matrículas.
El disparador se ejecutó.

6- Intente inscribir a un socio moroso.
El trigger se disparó, mostró un mensaje y no permitió la inserción.

7- Cree otro "insert trigger" para "inscriptos" que ingrese el socio en la tabla "morosos" si no 
paga la matrícula (si se ingresa 'n' para el campo "matricula"). Recuerde que podemos crear varios 
triggers para un mismo evento sobre una misma tabla.

8- Realice la inscripción de un socio que no deba matrículas con el valor 's' para "matricula".
El disparador "dis_inscriptos_insertar" se ejecuta y permite la transacción; el disparador 
"dis_inscriptos_insertar2" se ejecuta y permite la transacción.

9- Realice la inscripción de un socio que no deba matrículas con el valor 'n' para "matricula".
El disparador "dis_inscriptos_insertar" se ejecuta y permite la transacción; el disparador 
"dis_inscriptos_insertar2" se ejecuta y permite la transacción.

10- Verifique que el disparador "dis_inscriptos_insertar2" se ejecutó consultando la tabla 
"morosos":
 select *from morosos;

11- Realice la inscripción de un socio que deba matrículas con el valor 's' para "matricula".
El disparador "dis_inscriptos_insertar" se ejecuta y no permite la transacción; el disparador 
"dis_inscriptos_insertar2" no llega a ejecutarse.

12- Realice la inscripción de un socio que deba matrículas con el valor 'n' para "matricula".
El disparador "dis_inscriptos_insertar" se ejecuta y no permite la transacción; el disparador 
"dis_inscriptos_insertar2" no llega a ejecutarse.

13- Creamos un disparador sobre la tabla "socios" para que no permita ingresar nuevos socios. El 
mismo debe mostrar un mensaje al dispararse y deshacer la transacción.

14- Intente ingresar un nuevo socio.
El trigger se dispara, muestra el mensaje y deshace la transacción.

15- Actualizar el domicilio de un socio existente.
El trigger no se dispara porque está definido para el evento "insert".


*/

 if object_id('inscriptos') is not null
  drop table inscriptos;
 if object_id('socios') is not null
  drop table socios;
 if object_id('morosos') is not null
  drop table morosos;


  create table socios (
  documento char(8) not null,
  nombre varchar (30),
  domicilio varchar (30),
  constraint PK_socios primary key (documento)  
  );

  create table inscriptos (
  documento char(8) not null,
  deporte varchar(30) not null,
  matricula char(1),
  constraint CK_inscriptos check (matricula in ('s','n')),
  constraint PK_inscriptos primary key (documento,deporte),
  constraint FK_inscriptos_documento foreign key(documento)
   references socios (documento)  
  ); 

   create table morosos(
  documento char(8) not null
 );


 insert into socios values ('22222222','Ana Acosta','Avellaneda 800');
 insert into socios values ('23333333','Bernardo Bustos','Bulnes 234');
 insert into socios values ('24444444','Carlos Caseros','Colon 321');
 insert into socios values ('25555555','Mariana Morales','Maipu 483');

 insert into inscriptos values ('22222222','tenis','s');
 insert into inscriptos values ('22222222','natacion','n');
 insert into inscriptos values ('23333333','tenis','n');
 insert into inscriptos values ('24444444','tenis','s');
 insert into inscriptos values ('24444444','futbol','s');

 insert into morosos values ('22222222');
 insert into morosos values ('23333333');


 create trigger  dis_inscriptos_insertar
	on inscriptos 
	for insert 
	as 
	declare @doc char(8)
	select @doc= documento from inserted
	if exists (select * from morosos where documento=@doc)
	begin 
		raiserror('No puede inscribir al socio porque es moroso', 16, 1)
		rollback transaction
   end;

   insert into inscriptos values ('25555555','tenis','s');
   insert into inscriptos values ('23333333','futbol','s');

   create trigger dis_inscriptos_insertar2
   on inscriptos
   for insert 
   as 
    if (select matricula from inserted)='n'
	 insert into morosos select documento from inserted; 

 insert into inscriptos values ('25555555','natacion','s');

 insert into inscriptos values ('25555555','basquet','n');

 select *from morosos;

 insert into inscriptos values ('22222222','basquet','s');

 insert into inscriptos values ('22222222','basquet','n');


  create trigger dis_socios
  on socios
  for insert
  as
   raiserror('No puede ingresar nuevos socios', 16, 1)
   rollback transaction;


 insert into socios values('30000000','Ricardo Rojas','Rivadavia 265');

 update socios set domicilio='Rivadavia 135' where documento='22222222';