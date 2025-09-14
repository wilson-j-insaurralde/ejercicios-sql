Aprendimos que los operadores son símbolos que permiten realizar distintos tipos de operaciones.

Dijimos que SQL Server tiene 4 tipos de operadores: 1) relacionales o de comparación (los vimos), 2) lógicos (lo veremos más adelante, 3) aritméticos y 4) de concatenación.



Los operadores aritméticos permiten realizar cálculos con valores numéricos.

Son: multiplicación (\*), división (/) y módulo (%) (el resto de dividir números enteros), suma (+) y resta (-).



Es posible obtener salidas en las cuales una columna sea el resultado de un cálculo y no un campo de una tabla.



Si queremos ver los títulos, precio y cantidad de cada libro escribimos la siguiente sentencia:



&nbsp;select titulo,precio,cantidad

&nbsp; from libros;

Si queremos saber el monto total en dinero de un título podemos multiplicar el precio por la cantidad por cada título, pero también podemos hacer que SQL Server realice el cálculo y lo incluya en una columna extra en la salida:



&nbsp;

&nbsp;select titulo, precio,cantidad,

&nbsp; precio\*cantidad

&nbsp; from libros;

Si queremos saber el precio de cada libro con un 10% de descuento podemos incluir en la sentencia los siguientes cálculos:



&nbsp;select titulo,precio,

&nbsp; precio-(precio\*0.1)

&nbsp; from libros;

También podemos actualizar los datos empleando operadores aritméticos:



&nbsp;update libros set precio=precio-(precio\*0.1);

Todas las operaciones matemáticas retornan "null" en caso de error. Ejemplo:



&nbsp;select 5/0;

Los operadores de concatenación: permite concatenar cadenas, el más (+).



Para concatenar el título, el autor y la editorial de cada libro usamos el operador de concatenación ("+"):



&nbsp;select titulo+'-'+autor+'-'+editorial

&nbsp; from libros;

Note que concatenamos además unos guiones para separar los campos.



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

&nbsp; cantidad tinyint default 0,

&nbsp; primary key (codigo)

);



go



insert into libros (titulo,autor,editorial,precio)

&nbsp; values('El aleph','Borges','Emece',25);

insert into libros

&nbsp; values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);

insert into libros (titulo,autor,editorial,precio,cantidad)

&nbsp; values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50);



-- Queremos saber el monto total en dinero de cada libro: 

select titulo, precio,cantidad,

&nbsp; precio\*cantidad

&nbsp; from libros;



-- Conocer el precio de cada libro con un 10% de descuento:

select titulo,precio,

&nbsp; precio-(precio\*0.1)

&nbsp; from libros;



-- Actualizar los precios con un 10% de descuento:

update libros set precio=precio-(precio\*0.1);



select \* from libros;



-- Queremos una columna con el título, el autor y la editorial de cada libro:

select titulo+'-'+autor+'-'+editorial

&nbsp; from libros;



