/*

Una clínica almacena los turnos para los distintos médicos en una tabla llamada "consultas" y en 
otra tabla "medicos" los datos de los médicos.
1- Elimine las tablas si existen:
 if object_id('consultas') is not null
  drop table consultas;
 if object_id('medicos') is not null
  drop table medicos;

2- Cree las tablas con las siguientes estructuras:
 create table medicos (
  documento char(8) not null,
  nombre varchar(30),
  constraint PK_medicos 
   primary key clustered (documento)
 );

 create table consultas(
  fecha datetime,
  medico char(8) not null,
  paciente varchar(30),
  constraint PK_consultas
   primary key (fecha,medico),
  constraint FK_consultas_medico
   foreign key (medico)
   references medicos(documento)
   on update cascade
   on delete cascade
 );

3- Ingrese algunos registros:
 insert into medicos values('22222222','Alfredo Acosta');
 insert into medicos values('23333333','Pedro Perez');
 insert into medicos values('24444444','Marcela Morales');

 insert into consultas values('2007/03/26 8:00','22222222','Juan Juarez');
 insert into consultas values('2007/03/26 8:00','23333333','Gaston Gomez');
 insert into consultas values('2007/03/26 8:30','22222222','Nora Norte');
 insert into consultas values('2007/03/28 9:00','22222222','Juan Juarez');
 insert into consultas values('2007/03/29 8:00','24444444','Nora Norte');
 insert into consultas values('2007/03/24 8:30','22222222','Hector Huerta'); 
 insert into consultas values('2007/03/24 9:30','23333333','Hector Huerta');

4- Elimine la función "f_nombreDia" si existe:
 if object_id('f_nombreDia') is not null
  drop function f_nombreDia;

5- Cree la función "f_nombreDia" que recibe una fecha (tipo string) y nos retorne el nombre del día 
en español.
 
6- Elimine la función "f_horario" si existe:
 if object_id('f_horario') is not null
  drop function f_horario;

7- Cree la función "f_horario" que recibe una fecha (tipo string) y nos retorne la hora y minutos.

8- Elimine la función "f_fecha" si existe:
 if object_id('f_fecha') is not null
  drop function f_fecha;

9- Cree la función "f_fecha" que recibe una fecha (tipo string) y nos retorne la fecha (sin hora ni 
minutos)

10- Muestre todas las consultas del médico llamado 'Alfredo Acosta', incluyendo el día (emplee la 
función "f_nombreDia", la fecha (emplee la función "f_fecha"), el horario (emplee la función 
"f_horario") y el nombre del paciente.

11- Muestre todos los turnos para el día sábado, junto con la fecha, de todos los médicos.

12- Envíe a la función "f_nombreDia" una fecha y muestre el valor retornado:
 declare @valor char(30)
 set @valor='2007/04/09'
 select dbo.f_nombreDia(@valor);

*/

if OBJECT_ID('consultas') is not null
drop table  consultas;

if OBJECT_ID('medicos') is not null 
drop table medicos;

create table medicos (
  documento char(8) not null,
  nombre varchar(30),
  constraint PK_medicos 
  primary key clustered (documento)
  );


 create table consultas(
  fecha datetime,
  medico char(8) not null,
  paciente varchar(30),
  constraint PK_consultas
   primary key (fecha,medico),
  constraint FK_consultas_medico
   foreign key (medico)
   references medicos(documento)
   on update cascade
   on delete cascade
 );

  insert into medicos values('22222222','Alfredo Acosta');
 insert into medicos values('23333333','Pedro Perez');
 insert into medicos values('24444444','Marcela Morales');

 insert into consultas values('2007/03/26 8:00','22222222','Juan Juarez');
 insert into consultas values('2007/03/26 8:00','23333333','Gaston Gomez');
 insert into consultas values('2007/03/26 8:30','22222222','Nora Norte');
 insert into consultas values('2007/03/28 9:00','22222222','Juan Juarez');
 insert into consultas values('2007/03/29 8:00','24444444','Nora Norte');
 insert into consultas values('2007/03/24 8:30','22222222','Hector Huerta'); 
 insert into consultas values('2007/03/24 9:30','23333333','Hector Huerta');


 if OBJECT_ID('f_nombreDia') is not null 
 drop function f_nombreDia;

 create function f_nombreDia 
 (@fecha varchar(25))
  returns varchar(25)
  as 
 begin 
 declare 

