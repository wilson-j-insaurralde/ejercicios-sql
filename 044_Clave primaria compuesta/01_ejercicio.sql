/*
Un consultorio m�dico en el cual trabajan 3 m�dicos registra las consultas de los pacientes en una 
tabla llamada "consultas".
1- Elimine la tabla si existe:
 if object_id('consultas') is not null
  drop table consultas;

2- La tabla contiene los siguientes datos:
  - fechayhora: datetime not null, fecha y hora de la consulta,
  - medico: varchar(30), not null, nombre del m�dico (Perez,Lopez,Duarte),
  - documento: char(8) not null, documento del paciente,
  - paciente: varchar(30), nombre del paciente,
  - obrasocial: varchar(30), nombre de la obra social (IPAM,PAMI, etc.).
 );

3- Un m�dico s�lo puede atender a un paciente en una fecha y hora determianada. En una fecha y hora 
determinada, varios m�dicos atienden a distintos pacientes. Cree la tabla definiendo una clave 
primaria compuesta:
 create table consultas(
  fechayhora datetime not null,
  medico varchar(30) not null,
  documento char(8) not null,
  paciente varchar(30),
  obrasocial varchar(30),
  primary key(fechayhora,medico)
 );

4- Ingrese varias consultas para un mismo m�dico en distintas horas el mismo d�a.

5- Ingrese varias consultas para diferentes m�dicos en la misma fecha y hora.

6- Intente ingresar una consulta para un mismo m�dico en la misma hora el mismo d�a.
*/

if OBJECT_ID('consultas') is not null 
	drop table consultas ;

create table consultas (
	fechayhora datetime not null,
	medico varchar(30) not null,
	documento char(8) not null,
	paciente varchar(30),
	obrasocial varchar(30),
	primary key (fechayhora,medico)

);

insert into consultas
  values ('2006/11/05 8:00','Lopez','12222222','Acosta Betina','PAMI');
 insert into consultas
  values ('2006/11/05 8:30','Lopez','23333333','Fuentes Carlos','PAMI');

 insert into consultas
  values ('2006/11/05 8:00','Perez','34444444','Garcia Marisa','IPAM');
 insert into consultas
  values ('2006/11/05 8:00','Duarte','45555555','Pereyra Luis','PAMI');

 insert into consultas
  values ('2006/11/05 8:00','Perez','23333333','Fuentes Carlos','PAMI');