Los operadores son símbolos que permiten realizar operaciones matemáticas, concatenar cadenas, hacer comparaciones.



SQL Server tiene 4 tipos de operadores:



relacionales (o de comparación)

aritméticos

de concatenación

lógicos.

Por ahora veremos solamente los primeros.



Los operadores relacionales (o de comparación) nos permiten comparar dos expresiones, que pueden ser variables, valores de campos, etc.



Hemos aprendido a especificar condiciones de igualdad para seleccionar registros de una tabla; por ejemplo:



&nbsp;select \* from libros

&nbsp; where autor='Borges';

Utilizamos el operador relacional de igualdad.



Los operadores relacionales vinculan un campo con un valor para que SQL Server compare cada registro (el campo especificado) con el valor dado.



Los operadores relacionales son los siguientes:



=	igual

<>	distinto

>	mayor

<	menor

>=	mayor o igual

<=	menor o igual

Podemos seleccionar los registros cuyo autor sea diferente de "Borges", para ello usamos la condición:



&nbsp;select \* from libros

&nbsp; where autor<>'Borges';

Podemos comparar valores numéricos. Por ejemplo, queremos mostrar los títulos y precios de los libros cuyo precio sea mayor a 20 pesos:



&nbsp;select titulo, precio

&nbsp; from libros

&nbsp; where precio>20;

Queremos seleccionar los libros cuyo precio sea menor o igual a 30:



&nbsp;select \*from libros

&nbsp; where precio<=30;

Los operadores relacionales comparan valores del mismo tipo. Se emplean para comprobar si un campo cumple con una condición.



No son los únicos, existen otros que veremos mas adelante.



Servidor de SQL Server instalado en forma local.

Ingresemos el siguiente lote de comandos en el SQL Server Management Studio:



if object\_id('libros') is not null

&nbsp; drop table libros;



create table libros(

&nbsp; titulo varchar(30),

&nbsp; autor varchar(30),

&nbsp; editorial varchar(15),

&nbsp; precio float

);



go



insert into libros (titulo,autor,editorial,precio)

&nbsp; values ('El aleph','Borges','Emece',24.50);

insert into libros (titulo,autor,editorial,precio)

&nbsp; values ('Martin Fierro','Jose Hernandez','Emece',16.00);

insert into libros (titulo,autor,editorial,precio)

&nbsp; values ('Aprenda PHP','Mario Molina','Emece',35.40);

insert into libros (titulo,autor,editorial,precio)

&nbsp; values ('Cervantes y el quijote','Borges','Paidos',50.90);



-- Seleccionamos los registros cuyo autor sea diferente de 'Borges'

select \* from libros

&nbsp; where autor<>'Borges';



-- Seleccionamos los registros cuyo precio supere los 20 pesos, sólo el título y precio

select titulo,precio

&nbsp; from libros

&nbsp; where precio>20;



-- Recuperamos aquellos libros cuyo precio es menor o igual a 30

select \* from libros

&nbsp; where precio<=30;

