Así como la cláusula "where" permite seleccionar (o rechazar) registros individuales; la cláusula "having" permite seleccionar (o rechazar) un grupo de registros.



Si queremos saber la cantidad de libros agrupados por editorial usamos la siguiente instrucción ya aprendida:



&nbsp;select editorial, count(\*)

&nbsp; from libros

&nbsp; group by editorial;

Si queremos saber la cantidad de libros agrupados por editorial pero considerando sólo algunos grupos, por ejemplo, los que devuelvan un valor mayor a 2, usamos la siguiente instrucción:



&nbsp;select editorial, count(\*) from libros

&nbsp; group by editorial

&nbsp; having count(\*)>2;

Se utiliza "having", seguido de la condición de búsqueda, para seleccionar ciertas filas retornadas por la cláusula "group by".



Veamos otros ejemplos. Queremos el promedio de los precios de los libros agrupados por editorial, pero solamente de aquellos grupos cuyo promedio supere los 25 pesos:



&nbsp;select editorial, avg(precio) from libros

&nbsp; group by editorial

&nbsp; having avg(precio)>25;

En algunos casos es posible confundir las cláusulas "where" y "having". Queremos contar los registros agrupados por editorial sin tener en cuenta a la editorial "Planeta".

Analicemos las siguientes sentencias:



&nbsp;select editorial, count(\*) from libros

&nbsp; where editorial<>'Planeta'

&nbsp; group by editorial;

&nbsp;select editorial, count(\*) from libros

&nbsp; group by editorial

&nbsp; having editorial<>'Planeta';

Ambas devuelven el mismo resultado, pero son diferentes. La primera, selecciona todos los registros rechazando los de editorial "Planeta" y luego los agrupa para contarlos. La segunda, selecciona todos los registros, los agrupa para contarlos y finalmente rechaza fila con la cuenta correspondiente a la editorial "Planeta".



No debemos confundir la cláusula "where" con la cláusula "having"; la primera establece condiciones para la selección de registros de un "select"; la segunda establece condiciones para la selección de registros de una salida "group by".



Veamos otros ejemplos combinando "where" y "having". Queremos la cantidad de libros, sin considerar los que tienen precio nulo, agrupados por editorial, sin considerar la editorial "Planeta":



&nbsp;select editorial, count(\*) from libros

&nbsp; where precio is not null

&nbsp; group by editorial

&nbsp; having editorial<>'Planeta';

Aquí, selecciona los registros rechazando los que no cumplan con la condición dada en "where", luego los agrupa por "editorial" y finalmente rechaza los grupos que no cumplan con la condición dada en el "having".



Se emplea la cláusula "having" con funciones de agrupamiento, esto no puede hacerlo la cláusula "where". Por ejemplo queremos el promedio de los precios agrupados por editorial, de aquellas editoriales que tienen más de 2 libros:



&nbsp;select editorial, avg(precio) from libros

&nbsp; group by editorial

&nbsp; having count(\*) > 2; 

En una cláusula "having" puede haber hasta 128 condiciones. Cuando utilice varias condiciones, tiene que combinarlas con operadores lógicos (and, or, not).



Podemos encontrar el mayor valor de los libros agrupados y ordenados por editorial y seleccionar las filas que tengan un valor menor a 100 y mayor a 30:



&nbsp;select editorial, max(precio) as 'mayor'

&nbsp; from libros

&nbsp; group by editorial

&nbsp; having min(precio)<100 and

&nbsp; min(precio)>30

&nbsp; order by editorial; 

&nbsp;

Entonces, usamos la claúsula "having" para restringir las filas que devuelve una salida "group by". Va siempre después de la cláusula "group by" y antes de la cláusula "order by" si la hubiere.



Servidor de SQL Server instalado en forma local.

Ingresemos el siguiente lote de comandos en el SQL Server Management Studio:



if object\_id('libros') is not null

&nbsp; drop table libros;



create table libros(

&nbsp; codigo int identity,

&nbsp; titulo varchar(40),

&nbsp; autor varchar(30),

&nbsp; editorial varchar(15),

&nbsp; precio decimal(5,2),

&nbsp; cantidad tinyint,

&nbsp; primary key(codigo)

);



go



insert into libros

&nbsp; values('El aleph','Borges','Planeta',35,null);

insert into libros

&nbsp; values('Martin Fierro','Jose Hernandez','Emece',22.20,200);

insert into libros

&nbsp; values('Martin Fierro','Jose Hernandez','Planeta',40,200);

insert into libros

&nbsp; values('Antologia poetica','J.L. Borges','Planeta',null,150);

insert into libros

&nbsp; values('Aprenda PHP','Mario Molina','Emece',18,null);

insert into libros

&nbsp; values('Manual de PHP', 'J.C. Paez', 'Siglo XXI',56,120);

insert into libros

&nbsp; values('Cervantes y el quijote','Bioy Casares- J.L. Borges','Paidos',null,100);

insert into libros

&nbsp; values('Harry Potter y la piedra filosofal','J.K. Rowling',default,45.00,90);

insert into libros

&nbsp; values('Harry Potter y la camara secreta','J.K. Rowling','Emece',null,100);

insert into libros

&nbsp; values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',42,80);

insert into libros

&nbsp; values('PHP de la A a la Z',null,null,110,0);

insert into libros

&nbsp; values('Uno','Richard Bach','Planeta',25,null);



--  Cantidad de libros agrupados por editorial pero considerando sólo algunos grupos, 

--  los que devuelvan un valor mayor a 2

select editorial, count(\*) from libros

&nbsp; group by editorial

&nbsp; having count(\*)>2;



-- Promedio de los precios de los libros agrupados por editorial, pero solamente de 

-- aquellos grupos cuyo promedio supere los 25 pesos:

&nbsp;select editorial, avg(precio) from libros

&nbsp; group by editorial

&nbsp; having avg(precio)>25;



-- Cantidad de libros, sin considerar los que tienen precio nulo (where), agrupados por 

-- editorial (group by), sin considerar la editorial "Planeta" (having):

&nbsp;select editorial, count(\*) from libros

&nbsp; where precio is not null

&nbsp; group by editorial

&nbsp; having editorial<>'Planeta';



-- Promedio de los precios agrupados por editorial, 

-- de aquellas editoriales que tienen más de 2 libros:

&nbsp;select editorial, avg(precio) from libros

&nbsp; group by editorial

&nbsp; having count(\*) > 2; 



-- Mayor valor de los libros agrupados y ordenados por editorial y seleccionamos las 

-- filas que tienen un valor menor a 100 y mayor a 30:

&nbsp;select editorial, max(precio) as 'mayor'

&nbsp; from libros

&nbsp; group by editorial

&nbsp; having max(precio)<100 and

&nbsp; max(precio)>30

&nbsp; order by editorial; 

