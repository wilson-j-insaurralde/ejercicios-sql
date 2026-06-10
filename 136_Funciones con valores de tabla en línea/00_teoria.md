Una función con valores de tabla en línea retorna una tabla que es el resultado de una única instrucción "select".



Es similar a una vista, pero más flexible en el empleo de parámetros. En una vista no se puede incluir un parámetro, lo que hacemos es agregar una cláusula "where" al ejecutar la vista. Las funciones con valores de tabla en línea funcionan como una vista con parámetros.



Sintaxis:



&#x20;create function NOMBREFUNCION

&#x20;(@PARAMETRO TIPO=VALORPORDEFECTO)

&#x20;returns table

&#x20;as

&#x20;return (

&#x20; select CAMPOS

&#x20; from TABLA

&#x20; where CONDICION

&#x20;);

Como todas las funciones definidas por el usuario, se crea con "create function" seguido del nombre que le damos a la función; luego declaramos los parámetros de entrada con su tipo de dato entre paréntesis. El valor por defecto es opcional.



"returns" especifica "table" como el tipo de datos a retornar. No se define el formato de la tabla a retornar porque queda establecido en el "select".



El cuerpo de la función no contiene un bloque "begin...end" como las otras funciones.



La cláusula "return" contiene una sola instrucción "select" entre paréntesis. El resultado del "select" es la tabla que se retorna. El "select" está sujeto a las mismas reglas que los "select" de las vistas.



Creamos una función con valores de tabla en línea que recibe un valor de autor como parámetro:



&#x20;create function f\_libros

&#x20;(@autor varchar(30)='Borges')

&#x20;returns table

&#x20;as

&#x20;return (

&#x20; select titulo,editorial

&#x20; from libros

&#x20; where autor like '%'+@autor+'%'

&#x20;);

Estas funciones retornan una tabla y se hace referencia a ellas en la cláusula "from", como una vista:



&#x20;select \*from f\_libros('Bach');

Recuerde a que todas las funciones que tienen definidos parámetros se les DEBE suministrar valores para ellos al invocarse.



Recuerde que para que el parámetro tome el valor por defecto (si lo tiene) DEBE enviarse "default" al llamar a la función; si no le enviamos parámetros, SQL Server muestra un mensaje de error.



\--incorrecto: select \*from f\_libros();

&#x20;select \*from f\_libros(default);--correcto

Servidor de SQL Server instalado en forma local.

Ingresemos el siguiente lote de comandos en el SQL Server Management Studio:



if object\_id('libros') is not null

&#x20; drop table libros;



create table libros(

&#x20; codigo int identity,

&#x20; titulo varchar(40),

&#x20; autor varchar(30),

&#x20; editorial varchar(20)

);



go



insert into libros values('Uno','Richard Bach','Planeta');

insert into libros values('El aleph','Borges','Emece');

insert into libros values('Ilusiones','Richard Bach','Planeta');

insert into libros values('Aprenda PHP','Mario Molina','Nuevo siglo');

insert into libros values('Matematica estas ahi','Paenza','Nuevo siglo');



\-- Eliminamos, si existe la función "f\_libros":

if object\_id('f\_libros') is not null

&#x20; drop function f\_libros;



go



\-- Creamos una función con valores de tabla en línea que recibe un valor

\-- de autor como parámetro:

create function f\_libros

&#x20;(@autor varchar(30)='Borges')

&#x20;returns table

&#x20;as

&#x20;return (

&#x20; select titulo,editorial

&#x20; from libros

&#x20; where autor like '%'+@autor+'%'

&#x20;);



go



\-- Llamamos a la función creada anteriormente enviando un autor:

select \* from f\_libros('Bach');



\-- Eliminamos, si existe la función "f\_libros\_autoreditorial":

if object\_id('f\_libros\_autoreditorial') is not null

&#x20; drop function f\_libros\_autoreditorial;



go



\-- Creamos una función con valores de tabla en línea que recibe dos parámetros:

create function f\_libros\_autoreditorial

&#x20;(@autor varchar(30)='Borges',

&#x20;@editorial varchar(20)='Emece')

&#x20;returns table

&#x20;as

&#x20;return (

&#x20; select titulo,autor,editorial

&#x20; from libros

&#x20; where autor like '%'+@autor+'%' and

&#x20; editorial like '%'+@editorial+'%'

&#x20;);



go



\-- Llamamos a la función creada anteriormente:

select \* from f\_libros\_autoreditorial('','Nuevo siglo');



\-- Llamamos a la función creada anteriormente enviando "default"

\-- para que tome los valores por defecto:

select \* from f\_libros\_autoreditorial(default,default);

