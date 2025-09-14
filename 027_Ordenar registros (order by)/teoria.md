Podemos ordenar el resultado de un "select" para que los registros se muestren ordenados por algún campo, para ello usamos la cláusula "order by".



La sintaxis básica es la siguiente:



&nbsp;select \* from NOMBRETABLA

&nbsp; order by CAMPO; 

Por ejemplo, recuperamos los registros de la tabla "libros" ordenados por el título:



select \*from libros

&nbsp;order by titulo;

Aparecen los registros ordenados alfabéticamente por el campo especificado.



También podemos colocar el número de orden del campo por el que queremos que se ordene en lugar de su nombre, es decir, referenciar a los campos por su posición en la lista de selección. Por ejemplo, queremos el resultado del "select" ordenado por "precio":



&nbsp;select titulo,autor,precio

&nbsp; from libros order by 3;

Por defecto, si no aclaramos en la sentencia, los ordena de manera ascendente (de menor a mayor).

Podemos ordenarlos de mayor a menor, para ello agregamos la palabra clave "desc":



&nbsp;select \* libros

&nbsp; order by editorial desc;

También podemos ordenar por varios campos, por ejemplo, por "titulo" y "editorial":



&nbsp;select \* from libros

&nbsp; order by titulo,editorial;

Incluso, podemos ordenar en distintos sentidos, por ejemplo, por "titulo" en sentido ascendente y "editorial" en sentido descendente:



&nbsp;select \* from libros

&nbsp; order by titulo asc, editorial desc;

Debe aclararse al lado de cada campo, pues estas palabras claves afectan al campo inmediatamente anterior.



Es posible ordenar por un campo que no se lista en la selección.



Se permite ordenar por valores calculados o expresiones.



La cláusula "order by" no puede emplearse para campos text, ntext e image.



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

&nbsp; primary key (codigo)

);



go



insert into libros (titulo,autor,editorial,precio)

&nbsp; values('El aleph','Borges','Emece',25.33);

insert into libros

&nbsp; values('Java en 10 minutos','Mario Molina','Siglo XXI',50.65);

insert into libros (titulo,autor,editorial,precio)

&nbsp; values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',19.95);

insert into libros (titulo,autor,editorial,precio)

&nbsp; values('Alicia en el pais de las maravillas','Lewis Carroll','Planeta',15);



-- Recuperamos los registros ordenados por el título:

select \* from libros

&nbsp;order by titulo;



-- Ordenamos los registros por el campo "precio", referenciando el campo

-- por su posición en la lista de selección:

select titulo,autor,precio

&nbsp; from libros order by 3;



-- Los ordenamos por "editorial", de mayor a menor empleando "desc":

select \* from libros

&nbsp; order by editorial desc;



-- Ordenamos por dos campos:

&nbsp;select \* from libros

&nbsp; order by titulo,editorial;



-- Ordenamos en distintos sentidos:

&nbsp;select \* from libros

&nbsp; order by titulo asc, editorial desc;



-- Ordenamos por un campo que no se lista en la selección:

&nbsp;select titulo, autor

&nbsp; from libros

&nbsp; order by precio;



-- Ordenamos por un valor calculado:

&nbsp;select titulo, autor, editorial,

&nbsp;       precio+(precio\*0.1) as 'precio con descuento'

&nbsp;  from libros

&nbsp;  order by 4;	

