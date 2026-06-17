Las funciones de SQL Server no pueden ser modificadas, las funciones definidas por el usuario si.



Las funciones definidas por el usuario pueden modificarse con la instrucción "alter function".



Sintaxis general:



&#x20;alter function PROPIETARIO.NOMBREFUNCION

&#x20;NUEVADEFINICION;

Sintaxis para modificar funciones escalares:



&#x20;alter function PROPIETARIO.NOMBREFUNCION

&#x20;(@PARAMETRO TIPO=VALORPORDEFECTO) 

&#x20; returns TIPO

&#x20; as

&#x20; begin

&#x20;  CUERPO

&#x20;  return EXPRESIONESCALAR

&#x20; end

Sintaxis para modificar una función de varias instrucciones que retorna una tabla:



&#x20;alter function NOMBREFUNCION

&#x20; (@PARAMETRO TIPO=VALORPORDEFECTO) 

&#x20; returns @VARIABLE table

&#x20; (DEFINICION DE LA TABLA A RETORNAR)

&#x20; as

&#x20; begin

&#x20;   CUERPO DE LA FUNCION

&#x20;   return

&#x20; end

Sintaxis para modificar una función con valores de tabla en línea



&#x20;alter function NOMBREFUNCION

&#x20;(@PARAMETRO TIPO) 

&#x20;returns TABLE

&#x20;as

&#x20; return (SENTENCIAS SELECT) 

Veamos un ejemplo. Creamos una función que retorna una tabla en línea:



&#x20;create function f\_libros

&#x20;(@autor varchar(30)='Borges')

&#x20;returns table

&#x20;as

&#x20;return (

&#x20; select titulo,editorial

&#x20; from libros

&#x20; where autor like '%'+@autor+'%'

&#x20;);

La modificamos agregando otro campo en el "select":



&#x20;alter table f\_libros

&#x20;(@autor varchar(30)='Borges')

&#x20;returns table

&#x20;as

&#x20;return (

&#x20; select codigo,titulo,editorial

&#x20; from libros

&#x20; where autor like '%'+@autor+'%'

&#x20;);

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



if object\_id('f\_libros') is not null

&#x20; drop function f\_libros;



go



\-- Creamos una función que retorna una tabla en línea:

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



go



\-- La modificamos agregando otro campo en el "select":

alter function f\_libros

&#x20;(@autor varchar(30)='Borges')

&#x20;returns table

&#x20;as

&#x20;return (

&#x20; select codigo,titulo,editorial

&#x20; from libros

&#x20; where autor like '%'+@autor+'%'

&#x20;);



go



\-- Probamos la función para ver si se ha modificado:

select \* from f\_libros('Bach');

