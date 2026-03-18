/*
Una agencia matrimonial almacena la información de sus clientes de sexo femenino en una tabla 
llamada "mujeres" y en otra la de sus clientes de sexo masculino llamada "varones".
1- Elimine las tablas si existen y créelas:
 if object_id('mujeres') is not null
  drop table mujeres;
 if object_id('varones') is not null
  drop table varones;
 create table mujeres(
  nombre varchar(30),
  domicilio varchar(30),
  edad int
 );
 create table varones(
  nombre varchar(30),
  domicilio varchar(30),
  edad int
 );

2- Ingrese los siguientes registros:
 insert into mujeres values('Maria Lopez','Colon 123',45);
 insert into mujeres values('Liliana Garcia','Sucre 456',35);
 insert into mujeres values('Susana Lopez','Avellaneda 98',41);

 insert into varones values('Juan Torres','Sarmiento 755',44);
 insert into varones values('Marcelo Oliva','San Martin 874',56);
 insert into varones values('Federico Pereyra','Colon 234',38);
 insert into varones values('Juan Garcia','Peru 333',50);

3- La agencia necesita la combinación de todas las personas de sexo femenino con las de sexo 
masculino. Use un "cross join" (12 registros)

4- Realice la misma combinación pero considerando solamente las personas mayores de 40 años (6 
registros)

5- Forme las parejas pero teniendo en cuenta que no tengan una diferencia superior a 10 años (8 
registros)

*/

if OBJECT_ID('mujeres')is not null 
drop table mujeres;

if OBJECT_ID('varones') is not null
drop table varones;

create table varones(

	nombre varchar(30),
	domicilio varchar(30),
	edad int 
	);
create table mujeres (
	nombre varchar(30),
	domicilio varchar(30),
	edad int
);

 insert into mujeres values('Maria Lopez','Colon 123',45);
 insert into mujeres values('Liliana Garcia','Sucre 456',35);
 insert into mujeres values('Susana Lopez','Avellaneda 98',41);

 insert into varones values('Juan Torres','Sarmiento 755',44);
 insert into varones values('Marcelo Oliva','San Martin 874',56);
 insert into varones values('Federico Pereyra','Colon 234',38);
 insert into varones values('Juan Garcia','Peru 333',50);

 select m.nombre,m.edad,v.nombre,v.edad
 from mujeres as m
 cross join varones as v ;

 select m.nombre,m.edad,v.nombre,v.edad
 from mujeres as m
 cross join varones as v 
 where v.edad >=40 and m.edad>=40 ;


 select m.nombre,m.edad,v.nombre,v.edad
 from mujeres as m
 cross join varones as v
 where m.edad-v.edad between -10 and 10;
