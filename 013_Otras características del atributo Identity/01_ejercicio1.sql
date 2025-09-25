/*
Una farmacia guarda informaci�n referente a sus medicamentos en una tabla llamada "medicamentos".
1- Elimine la tabla,si existe:
 if object_id('medicamentos') is not null
  drop table medicamentos;

2- Cree la tabla con un campo "codigo" que genere valores secuenciales autom�ticamente comenzando en 
10 e increment�ndose en 1:
 create table medicamentos(
  codigo integer identity(10,1),
  nombre varchar(20) not null,
  laboratorio varchar(20),
  precio float,
  cantidad integer
 );

3- Ingrese los siguientes registros:
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
   values('Sertal','Roche',5.2,100);
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Buscapina','Roche',4.10,200);
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Amoxidal 500','Bayer',15.60,100);

4- Verifique que SQL Server gener� valores para el campo "c�digo" de modo autom�tico:
 select *from medicamentos;

5- Intente ingresar un registro con un valor para el campo "codigo".

6- Setee la opci�n "identity_insert" en "on"

7- Ingrese un nuevo registro sin valor para el campo "codigo" (no lo permite):
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Amoxilina 500','Bayer',15.60,100);

8- Ingrese un nuevo registro con valor para el campo "codigo" repetido.

9- Use la funci�n "ident_seed()" para averiguar el valor de inicio del campo "identity" de la tabla 
"medicamentos"

10- Emplee la funci�n "ident_incr()" para saber cu�l es el valor de incremento del campo "identity" 
de "medicamentos"
*/

 if object_id('medicamentos') is not null
  drop table medicamentos;

 create table medicamentos(
  codigo integer identity(10,1),
  nombre varchar(20) not null,
  laboratorio varchar(20),
  precio float,
  cantidad integer
 );

 insert into medicamentos (nombre, laboratorio,precio,cantidad)
   values('Sertal','Roche',5.2,100);
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Buscapina','Roche',4.10,200);
 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Amoxidal 500','Bayer',15.60,100);

 select * from medicamentos;

 insert into medicamentos (codigo,nombre, laboratorio,precio,cantidad)
  values(4,'Amoxilina 500','Bayer',15.60,100);

  set identity_insert medicamentos on;

 insert into medicamentos (nombre, laboratorio,precio,cantidad)
  values('Amoxilina 500','Bayer',15.60,100);

 insert into medicamentos (codigo,nombre, laboratorio,precio,cantidad)
  values(10,'Amoxilina 500','Bayer',15.60,100);

 select ident_seed('medicamentos');

 select ident_incr('medicamentos');