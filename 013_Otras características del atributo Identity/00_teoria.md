El atributo "identity" permite indicar el valor de inicio de la secuencia y el incremento, para ello usamos la siguiente sintaxis:



&nbsp;create table libros(

&nbsp; codigo int identity(100,2),

&nbsp; titulo varchar(20),

&nbsp; autor varchar(30),

&nbsp; precio float

&nbsp;);

Los valores comenzarán en "100" y se incrementarán de 2 en 2; es decir, el primer registro ingresado tendrá el valor "100", los siguientes "102", "104", "106", etc.



La función "ident\_seed()" retorna el valor de inicio del campo "identity" de la tabla que nombramos:



&nbsp;select ident\_seed('libros');

La función "ident\_incr()" retorna el valor de incremento del campo "identity" de la tabla nombrada:



&nbsp;select ident\_incr('libros');

Hemos visto que en un campo declarado "identity" no puede ingresarse explícitamente un valor.

Para permitir ingresar un valor en un campo de identidad se debe activar la opción "identity\_insert":



&nbsp;set identity\_insert libros on;

Es decir, podemos ingresar valor en un campo "identity" seteando la opción "identity\_insert" en "on".



Cuando "identity\_insert" está en ON, las instrucciones "insert" deben explicitar un valor:



&nbsp;insert into libros (codigo,titulo)

&nbsp;values (5,'Alicia en el pais de las maravillas');

Si no se coloca un valor para el campo de identidad, la sentencia no se ejecuta y aparece un mensaje de error:



&nbsp;insert into libros (titulo,autor, editorial)

&nbsp;values ('Matematica estas ahi','Paenza','Paidos');

El atributo "identity" no implica unicidad, es decir, permite repetición de valores; por ello hay que tener cuidado al explicitar un valor porque se puede ingresar un valor repetido.



Para desactivar la opción "identity\_insert" tipeamos:



&nbsp;set identity\_insert libros off;

Servidor de SQL Server instalado en forma local.

Ingresemos el siguiente lote de comandos en el SQL Server Management Studio:



if object\_id('libros') is not null

&nbsp; drop table libros;



create table libros(

&nbsp; codigo int identity(100,2),

&nbsp; titulo varchar(20),

&nbsp; autor varchar(30),

&nbsp; precio float

);



go



insert into libros (titulo,autor,precio)

&nbsp; values('El aleph','Borges',23);

insert into libros (titulo,autor,precio)

&nbsp; values('Uno','Richard Bach',18);

insert into libros (titulo,autor,precio)

&nbsp; values('Aprenda PHP','Mario Molina',45.60);



select \* from libros;



-- Para saber cuál es el valor de inicio del campo "identity" de la tabla "libros":

select ident\_seed('libros');



-- Si intentamos ingresar un valor para el campo "codigo" (genera error):

insert into libros (codigo,titulo,autor,precio)

&nbsp; values(106,'Martin Fierro','Jose Hernandez',25);



-- Para permitir ingresar un valor en un campo de identidad activamos la opción "identity\_insert":

set identity\_insert libros on;



-- Recordemos que si "identity\_insert" está en ON, la instrucción "insert" DEBE explicitar un valor:

insert into libros (codigo,titulo,autor)

&nbsp;values (100,'Matematica estas ahi','Paenza');



-- Note que ingresamos un valor de código que ya existe; esto está permitido porque

-- el atributo "identity" no implica unicidad.

insert into libros (codigo,titulo,autor)

&nbsp;values (1,'Ilusiones','Richard Bach');



-- Si no se coloca un valor para el campo de identidad, 

-- la sentencia no se ejecuta y aparece un mensaje de error:

insert into libros (titulo,autor)

&nbsp;values ('Uno','Richard Bach');



-- Para desactivar la opción "identity\_insert" 

set identity\_insert libros off;



-- Intentemos ingresar un valor para el campo "codigo" (genera error):

insert into libros (codigo,titulo,autor)

&nbsp; values (300,'Uno','Richard Bach');

