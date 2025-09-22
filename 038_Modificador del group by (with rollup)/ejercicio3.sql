/*
Problema:
Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes" algunos datos de las personas que visitan o compran en su stand para luego enviarle publicidad de sus productos.

Eliminamos la tabla si existe:

 if object_id('visitantes') is not null
  drop table visitantes;
La creamos con la siguiente estructura:

 create table visitantes(
  nombre varchar(30),
  edad tinyint,
  sexo char(1),
  domicilio varchar(30),
  ciudad varchar(20),
  telefono varchar(11),
  montocompra decimal(6,2) not null
 );
Ingresamos algunos registros:

 insert into visitantes
  values ('Susana Molina',28,'f',null,'Cordoba',null,45.50); 
 insert into visitantes
  values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',22.40);
 insert into visitantes
  values ('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25); 
 insert into visitantes
  values ('Teresa Garcia',33,'f',default,'Alta Gracia','03547123456',120);
 insert into visitantes
  values ('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20);
 insert into visitantes
  values ('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',95);
 insert into visitantes
  values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia',null,53.50);
 insert into visitantes
  values ('Roxana Lopez',20,'f','null','Alta Gracia',null,240);
 insert into visitantes
  values ('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48);
 insert into visitantes
  values ('Juan Torres',43,'m','Sarmiento 876','Cordoba',null,15.30);
Necesitamos la cantidad de visitantes por ciudad y el total de visitantes. Para obtener ambos resultados en una sola consulta empleamos "with rollup":

 select ciudad,
  count(*) as cantidad
  from visitantes
  group by ciudad with rollup;
La consulta anterior retorna los registros agrupados por ciudad y una fila extra (la cuarta) en la que la primera columna contiene "null" y la columna con la cantidad muestra la cantidad total.

Veamos las filas de resumen cuando agrupamos por 2 campos, "ciudad" y "sexo":

 select ciudad,sexo,
  count(*) as cantidad
  from visitantes
  group by ciudad,sexo
  with rollup;
La salida muestra los totales por ciudad y sexo (5 filas) y produce 4 filas extras, 3 muestran los totales para cada ciudad (con la columna correspondiente al sexo conteniendo "null") y 1 mostrando el total de todos los visitantes (con las columnas correspondientes a la ciudad y al sexo conteniendo "null").

Podemos incluir varias funciones de agrupamiento; para conocer la cantidad de visitantes y la suma de sus compras agrupados por ciudad y sexo, tipeamos:

 select ciudad,sexo,
  count(*) as cantidad,
  sum(montocompra) as total
  from visitantes
  group by ciudad,sexo
  with rollup;
Note que por cada agrupación aparece una fila extra con valores de resumen.
*/

 if object_id('visitantes') is not null
  drop table visitantes;

 create table visitantes(
  nombre varchar(30),
  edad tinyint,
  sexo char(1),
  domicilio varchar(30),
  ciudad varchar(20),
  telefono varchar(11),
  montocompra decimal(6,2) not null
 );

 insert into visitantes
  values ('Susana Molina',28,'f',null,'Cordoba',null,45.50); 
 insert into visitantes
  values ('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',22.40);
 insert into visitantes
  values ('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25); 
 insert into visitantes
  values ('Teresa Garcia',33,'f',default,'Alta Gracia','03547123456',120);
 insert into visitantes
  values ('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20);
 insert into visitantes
  values ('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',95);
 insert into visitantes
  values ('Julieta Gomez',24,'f','San Martin 333','Alta Gracia',null,53.50);
 insert into visitantes
  values ('Roxana Lopez',20,'f','null','Alta Gracia',null,240);
 insert into visitantes
  values ('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48);
 insert into visitantes
  values ('Juan Torres',43,'m','Sarmiento 876','Cordoba',null,15.30);

 select ciudad,
  count(*) as cantidad
  from visitantes
  group by ciudad with rollup;

 select ciudad,sexo,
  count(*) as cantidad
  from visitantes
  group by ciudad,sexo
  with rollup;

 select ciudad,sexo,
  count(*) as cantidad,
  sum(montocompra) as total
  from visitantes
  group by ciudad,sexo
  with rollup;
