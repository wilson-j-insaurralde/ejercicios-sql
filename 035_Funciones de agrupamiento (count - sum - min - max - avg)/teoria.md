Hemos visto que SQL Server tiene funciones que nos permiten contar registros, calcular sumas, promedios, obtener valores máximos y mínimos, las funciones de agregado.



Ya hemos aprendido una de ellas, "count()", veamos otras.



Se pueden usar en una instrucción "select" y combinarlas con la cláusula "group by".



Todas estas funciones retornan "null" si ningún registro cumple con la condición del "where", excepto "count" que en tal caso retorna cero.



El tipo de dato del campo determina las funciones que se pueden emplear con ellas.



Las relaciones entre las funciones de agrupamiento y los tipos de datos es la siguiente:



\- count: se puede emplear con cualquier tipo de dato.



\- min y max: con cualquier tipo de dato.



\- sum y avg: sólo en campos de tipo numérico.



La función "sum()" retorna la suma de los valores que contiene el campo especificado. Si queremos saber la cantidad total de libros que tenemos disponibles para la venta, debemos sumar todos los valores del campo "cantidad":



&nbsp;select sum(cantidad)

&nbsp; from libros;

Para averiguar el valor máximo o mínimo de un campo usamos las funciones "max()" y "min()" respectivamente.

Queremos saber cuál es el mayor precio de todos los libros:



&nbsp;select max(precio)

&nbsp; from libros;

Entonces, dentro del paréntesis de la función colocamos el nombre del campo del cuál queremos el máximo valor.



La función "avg()" retorna el valor promedio de los valores del campo especificado. Queremos saber el promedio del precio de los libros referentes a "PHP":



&nbsp;select avg(precio)

&nbsp; from libros

&nbsp; where titulo like '%PHP%';

Ahora podemos entender porque estas funciones se denominan "funciones de agrupamiento", porque operan sobre conjuntos de registros, no con datos individuales.



Tratamiento de los valores nulos:



Si realiza una consulta con la función "count" de un campo que contiene 18 registros, 2 de los cuales contienen valor nulo, el resultado devuelve un total de 16 filas porque no considera aquellos con valor nulo.



Todas las funciones de agregado, excepto "count(\*)", excluye los valores nulos de los campos. "count(\*)" cuenta todos los registros, incluidos los que contienen "null".



Servidor de SQL Server instalado en forma local.

Ingresemos el siguiente lote de comandos en el SQL Server Management Studio:



if object\_id('libros') is not null

&nbsp; drop table libros;



create table libros(

&nbsp; codigo int identity,

&nbsp; titulo varchar(40) not null,

&nbsp; autor varchar(30) default 'Desconocido',

&nbsp; editorial varchar(15),

&nbsp; precio decimal(5,2),

&nbsp; cantidad tinyint,

&nbsp; primary key(codigo)

);



go



insert into libros

&nbsp; values('El aleph','Borges','Planeta',15,null);

insert into libros

&nbsp; values('Martin Fierro','Jose Hernandez','Emece',22.20,200);

insert into libros

&nbsp; values('Antologia poetica','J.L. Borges','Planeta',null,150);

insert into libros

&nbsp; values('Aprenda PHP','Mario Molina','Emece',18.20,null);

insert into libros

&nbsp; values('Cervantes y el quijote','Bioy Casares- J.L. Borges','Paidos',null,100);

insert into libros

&nbsp; values('Manual de PHP', 'J.C. Paez', 'Siglo XXI',31.80,120);

insert into libros

&nbsp; values('Harry Potter y la piedra filosofal','J.K. Rowling',default,45.00,90);

insert into libros

&nbsp; values('Harry Potter y la camara secreta','J.K. Rowling','Emece',46.00,100);

insert into libros (titulo,autor,cantidad)

&nbsp; values('Alicia en el pais de las maravillas','Lewis Carroll',220);

insert into libros (titulo,autor,cantidad)

&nbsp; values('PHP de la A a la Z',default,0);



-- Cantidad total de libros, sumamos las cantidades de cada uno:

&nbsp;select sum(cantidad)

&nbsp; from libros;



-- Para conocer cuántos libros tenemos de la editorial "Emece":

&nbsp;select sum(cantidad)

&nbsp; from libros

&nbsp; where editorial='Emece';



-- Queremos saber cuál es el libro más costoso:

&nbsp;select max(precio)

&nbsp; from libros;



-- Para conocer el precio mínimo de los libros de "Rowling":

&nbsp;select min(precio)

&nbsp; from libros

&nbsp; where autor like '%Rowling%';



&nbsp;-- Queremos saber el promedio del precio de los libros referentes a "PHP":

&nbsp;select avg(precio)

&nbsp; from libros

&nbsp; where titulo like '%PHP%';

