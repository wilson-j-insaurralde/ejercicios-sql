Hemos visto los operadores relacionales: = (igual), <> (distinto), > (mayor), < (menor), >= (mayor o igual), <= (menor o igual), is null/is not null (si un valor es NULL o no).



Otro operador relacional es "between", trabajan con intervalos de valores.



Hasta ahora, para recuperar de la tabla "libros" los libros con precio mayor o igual a 20 y menor o igual a 40, usamos 2 condiciones unidas por el operador lógico "and":



&nbsp;select \* from libros

&nbsp; where precio>=20 and

&nbsp; precio<=40;

Podemos usar "between" y así simplificar la consulta:



&nbsp;select \* from libros

&nbsp; where precio between 20 and 40;

Averiguamos si el valor de un campo dado (precio) está entre los valores mínimo y máximo especificados (20 y 40 respectivamente).



"between" significa "entre". Trabaja con intervalo de valores.

Este operador se puede emplear con tipos de datos numéricos y money (en tales casos incluyen los valores mínimo y máximo) y tipos de datos fecha y hora (incluye sólo el valor mínimo).



No tiene en cuenta los valores "null".



Si agregamos el operador "not" antes de "between" el resultado se invierte, es decir, se recuperan los registros que están fuera del intervalo especificado. Por ejemplo, recuperamos los libros cuyo precio NO se encuentre entre 20 y 35, es decir, los menores a 15 y mayores a 25:



&nbsp;select \*from libros

&nbsp; where precio not between 20 and 35;

Siempre que sea posible, emplee condiciones de búsqueda positivas ("between"), evite las negativas ("not between") porque hace más lenta la recuperación de los datos.



Entonces, se puede usar el operador "between" para reducir las condiciones "where".



Servidor de SQL Server instalado en forma local.

Ingresemos el siguiente lote de comandos en el SQL Server Management Studio:



if object\_id ('libros') is not null

&nbsp; drop table libros;



create table libros(

&nbsp; codigo int identity,

&nbsp; titulo varchar(40) not null,

&nbsp; autor varchar(20) default 'Desconocido',

&nbsp; editorial varchar(20),

&nbsp; precio decimal(6,2),

);



go



insert into libros

&nbsp; values('El aleph','Borges','Emece',15.90);

insert into libros

&nbsp; values('Cervantes y el quijote','Borges','Paidos',null);

insert into libros

&nbsp; values('Alicia en el pais de las maravillas','Lewis Carroll',null,19.90);

insert into libros

&nbsp; values('Martin Fierro','Jose Hernandez','Emece',25.90);

insert into libros (titulo,autor,precio)

&nbsp; values('Antología poética','Borges',32);

insert into libros (titulo,autor,precio)

&nbsp; values('Java en 10 minutos','Mario Molina',45.80);

insert into libros (titulo,autor,precio)

&nbsp; values('Martin Fierro','Jose Hernandez',40);

insert into libros (titulo,autor,precio)

&nbsp; values('Aprenda PHP','Mario Molina',56.50);



-- Recuperamos los registros cuyo precio esté entre 20 y 40 empleando "between":

select \* from libros

&nbsp; where precio between 20 and 40;



-- Para seleccionar los libros cuyo precio NO esté entre un intervalo de valores

-- antecedemos "not" al "between":

select \* from libros

&nbsp; where precio not between 20 and 35;

