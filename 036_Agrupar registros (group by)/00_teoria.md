Hemos aprendido que las funciones de agregado permiten realizar varios cálculos operando con conjuntos de registros.



Las funciones de agregado solas producen un valor de resumen para todos los registros de un campo. Podemos generar valores de resumen para un solo campo, combinando las funciones de agregado con la cláusula "group by", que agrupa registros para consultas detalladas.



Queremos saber la cantidad de libros de cada editorial, podemos tipear la siguiente sentencia:



&nbsp;select count(\*) from libros

&nbsp; where editorial='Planeta';

y repetirla con cada valor de "editorial":



&nbsp;select count(\*) from libros

&nbsp; where editorial='Emece';

&nbsp;select count(\*) from libros

&nbsp; where editorial='Paidos';

&nbsp;...

Pero hay otra manera, utilizando la cláusula "group by":



&nbsp;select editorial, count(\*)

&nbsp; from libros

&nbsp; group by editorial;

La instrucción anterior solicita que muestre el nombre de la editorial y cuente la cantidad agrupando los registros por el campo "editorial". Como resultado aparecen los nombres de las editoriales y la cantidad de registros para cada valor del campo.



Los valores nulos se procesan como otro grupo.



Entonces, para saber la cantidad de libros que tenemos de cada editorial, utilizamos la función "count()", agregamos "group by" (que agrupa registros) y el campo por el que deseamos que se realice el agrupamiento, también colocamos el nombre del campo a recuperar; la sintaxis básica es la siguiente:



&nbsp;select CAMPO, FUNCIONDEAGREGADO

&nbsp; from NOMBRETABLA

&nbsp; group by CAMPO;

También se puede agrupar por más de un campo, en tal caso, luego del "group by" se listan los campos, separados por comas. Todos los campos que se especifican en la cláusula "group by" deben estar en la lista de selección.



&nbsp;select CAMPO1, CAMPO2, FUNCIONDEAGREGADO

&nbsp; from NOMBRETABLA

&nbsp; group by CAMPO1,CAMPO2;

Para obtener la cantidad libros con precio no nulo, de cada editorial utilizamos la función "count()" enviándole como argumento el campo "precio", agregamos "group by" y el campo por el que deseamos que se realice el agrupamiento (editorial):



&nbsp;select editorial, count(precio)

&nbsp; from libros

&nbsp; group by editorial;

Como resultado aparecen los nombres de las editoriales y la cantidad de registros de cada una, sin contar los que tienen precio nulo.



Recuerde la diferencia de los valores que retorna la función "count()" cuando enviamos como argumento un asterisco o el nombre de un campo: en el primer caso cuenta todos los registros incluyendo los que tienen valor nulo, en el segundo, los registros en los cuales el campo especificado es no nulo.



Para conocer el total en dinero de los libros agrupados por editorial:



&nbsp;select editorial, sum(precio)

&nbsp; from libros

&nbsp; group by editorial;

Para saber el máximo y mínimo valor de los libros agrupados por editorial:



&nbsp;select editorial,

&nbsp; max(precio) as mayor,

&nbsp; min(precio) as menor

&nbsp; from libros

&nbsp; group by editorial;

Para calcular el promedio del valor de los libros agrupados por editorial:



&nbsp;select editorial, avg(precio)

&nbsp; from libros

&nbsp; group by editorial;

Es posible limitar la consulta con "where".



Si incluye una cláusula "where", sólo se agrupan los registros que cumplen las condiciones.



Vamos a contar y agrupar por editorial considerando solamente los libros cuyo precio sea menor a 30 pesos:



&nbsp;select editorial, count(\*)

&nbsp; from libros

&nbsp; where precio<30

&nbsp; group by editorial;

Note que las editoriales que no tienen libros que cumplan la condición, no aparecen en la salida. Para que aparezcan todos los valores de editorial, incluso los que devuelven cero o "null" en la columna de agregado, debemos emplear la palabra clave "all" al lado de "group by":



&nbsp;select editorial, count(\*)

&nbsp; from libros

&nbsp; where precio<30

&nbsp; group by all editorial;

Entonces, usamos "group by" para organizar registros en grupos y obtener un resumen de dichos grupos. SQL Server produce una columna de valores por cada grupo, devolviendo filas por cada grupo especificado.



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

&nbsp; values('Harry Potter y la camara secreta','J.K. Rowling','Emece',null,100);

insert into libros

&nbsp; values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos',22.50,200);

insert into libros

&nbsp; values('PHP de la A a la Z',null,null,null,0);



-- Cantidad de libros de cada editorial:

select editorial, count(\*)

&nbsp; from libros

&nbsp; group by editorial;



-- Cantidad libros con precio no nulo de cada editorial:

select editorial, count(precio)

&nbsp; from libros

&nbsp; group by editorial;



-- Total en dinero de los libros agrupados por editorial:

select editorial, sum(precio)

&nbsp; from libros

&nbsp; group by editorial;



-- Máximo y mínimo valor de los libros agrupados por editorial:

select editorial,

&nbsp; max(precio) as mayor,

&nbsp; min(precio) as menor

&nbsp; from libros

&nbsp; group by editorial;



-- Promedio del valor de los libros agrupados por editorial:

select editorial, avg(precio)

&nbsp; from libros

&nbsp; group by editorial;



-- Contar y agrupar por editorial considerando solamente los libros cuyo precio es menor a 30 pesos:

select editorial, count(\*)

&nbsp; from libros

&nbsp; where precio<30

&nbsp; group by editorial;



-- Todos los valores de editorial, incluso los que devuelven cero o "null" en la columna de agregado,

--  debemos emplear la palabra clave "all" al lado de "group by":

select editorial, count(\*)

&nbsp; from libros

&nbsp; where precio<30

&nbsp; group by all editorial;

