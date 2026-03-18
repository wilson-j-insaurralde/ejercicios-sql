--Un pequeño restaurante tiene almacenados los nombres, precios y rubro de sus comidas en una tabla llamada "comidas".

--Eliminamos la tabla, si existe:

 if object_id('comidas') is not null
  drop table comidas;
--Creamos la tabla:

 create table comidas(
  codigo int identity,
  nombre varchar(30),
  precio decimal(4,2),
  rubro char(6),-- 'plato'=plato principal', 'postre'=postre
  primary key(codigo)
 );
--Ingresamos algunos registros:

 insert into comidas values('ravioles',5,'plato');
 insert into comidas values('tallarines',4,'plato');
 insert into comidas values('milanesa',7,'plato');
 insert into comidas values('cuarto de pollo',6,'plato');
 insert into comidas values('flan',2.5,'postre');
 insert into comidas values('porcion torta',3.5,'postre');
--Realizamos un "cross join":

 select c1.nombre as 'plato principal',
  c2.nombre as postre,
  c1.precio+c2.precio as total
  from comidas as c1
  cross join comidas as c2;
--Note que aparecen filas duplicadas, por ejemplo, "ravioles" se combina con "ravioles" y la combinación "ravioles- flan" se repite como "flan- ravioles". Debemos especificar que combine el rubro "plato" con "postre":

 select c1.nombre as 'plato principal',
  c2.nombre as postre,
  c1.precio+c2.precio as total
  from comidas as c1
  cross join comidas as c2
  where c1.rubro='plato' and
  c2.rubro='postre';
--La salida muestra cada plato combinado con cada postre, y una columna extra que calcula el total del menú.

--También se puede realizar una autocombinación con "join":

 select c1.nombre as 'plato principal',
  c2.nombre as postre,
  c1.precio+c2.precio as total
  from comidas as c1
  join comidas as c2
  on c1.codigo<>c2.codigo
  where c1.rubro='plato' and
  c2.rubro='postre';
--Para que no aparezcan filas duplicadas se agrega un "where".

