/*
Una agencia matrimonial almacena la información de sus clientes en una tabla llamada "clientes".
1- Elimine la tabla si existe y créela:
 if object_id('clientes') is not null
  drop table clientes;

 create table clientes(
  nombre varchar(30),
  sexo char(1),--'f'=femenino, 'm'=masculino
  edad int,
  domicilio varchar(30)
 );


2- Ingrese los siguientes registros:
 insert into clientes values('Maria Lopez','f',45,'Colon 123');
 insert into clientes values('Liliana Garcia','f',35,'Sucre 456');
 insert into clientes values('Susana Lopez','f',41,'Avellaneda 98');
 insert into clientes values('Juan Torres','m',44,'Sarmiento 755');
 insert into clientes values('Marcelo Oliva','m',56,'San Martin 874');
 insert into clientes values('Federico Pereyra','m',38,'Colon 234');
 insert into clientes values('Juan Garcia','m',50,'Peru 333');

3- La agencia necesita la combinación de todas las personas de sexo femenino con las de sexo 
masculino. Use un  "cross join" (12 registros)

4- Obtenga la misma salida enterior pero realizando un "join".

5- Realice la misma autocombinación que el punto 3 pero agregue la condición que las parejas no 
tengan una diferencia superior a 5 años (5 registros)

*/

 if object_id('clientes') is not null
  drop table clientes;

   create table clientes(
  nombre varchar(30),
  sexo char(1),--'f'=femenino, 'm'=masculino
  edad int,
  domicilio varchar(30)
 );

 insert into clientes values('Maria Lopez','f',45,'Colon 123');
 insert into clientes values('Liliana Garcia','f',35,'Sucre 456');
 insert into clientes values('Susana Lopez','f',41,'Avellaneda 98');
 insert into clientes values('Juan Torres','m',44,'Sarmiento 755');
 insert into clientes values('Marcelo Oliva','m',56,'San Martin 874');
 insert into clientes values('Federico Pereyra','m',38,'Colon 234');
 insert into clientes values('Juan Garcia','m',50,'Peru 333');

 select cm.nombre,cm.edad,cv.nombre,cv.edad
 from clientes as cm
 cross join clientes as cv
 where cm.sexo='f' and cv.sexo='m';


 select cm.nombre,cm.edad,cv.nombre,cv.edad
 from clientes as cm
 join clientes as cv 
 on cm.nombre<>cv.nombre
 where cm.sexo='f' and cv.sexo='m';

 select cm.nombre,cm.edad,cv.nombre,cv.edad
 from clientes as cm
 cross join clientes as cv
 where cm.sexo='f' and cv.sexo='m' 
 and cm.edad-cv.edad between -5 and 5;