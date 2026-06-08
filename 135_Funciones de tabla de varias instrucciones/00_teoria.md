Hemos visto el primer tipo de funciones definidas por el usuario, que retornan un valor escalar. Ahora veremos las funciones con varias instrucciones que retornan una tabla.



Las funciones que retornan una tabla pueden emplearse en lugar de un "from" de una consulta.



Este tipo de función es similar a un procedimiento almacenado; la diferencia es que la tabla retornada por la función puede ser referenciada en el "from" de una consulta, pero el resultado de un procedimiento almacenado no.



También es similar a una vista; pero en las vistas solamente podemos emplear "select", mientras que en funciones definidas por el usuario podemos incluir sentencias como "if", llamadas a funciones, procedimientos, etc.



Sintaxis:



&#x20;create function NOMBREFUNCION

&#x20;(@PARAMETRO TIPO)

&#x20;returns @NOMBRETABLARETORNO table-- nombre de la tabla

&#x20;--formato de la tabla

&#x20;(CAMPO1 TIPO,

&#x20; CAMPO2 TIPO,

&#x20; CAMPO3 TIPO

&#x20;)

&#x20;as

&#x20;begin

&#x20;  insert @NOMBRETABLARETORNO

&#x20;   select CAMPOS

&#x20;    from TABLA

&#x20;    where campo OPERADOR @PARAMETRO

&#x20;  RETURN

&#x20;end

Como cualquier otra función, se crea con "create function" seguida del nombre de la función; luego (opcionalmente) los parámetros de entrada con su tipo de dato.



La cláusula "returns" define un nombre de variable local para la tabla que retornará, el tipo de datos a retornar (que es "table") y el formato de la misma (campos y tipos).



El cuerpo de la función se define también en un bloque "begin... end", el cual contiene las instrucciones que insertan filas en la variable (tabla que será retornada) definida en "returns". "return" indica que las filas insertadas en la variable son retornadas; no puede ser un argumento.



El siguiente ejemplo crea una función denominada "f\_ofertas" que recibe un parámetro. La función retorna una tabla con el codigo, título, autor y precio de todos los libros cuyo precio sea inferior al parámetro:



&#x20;create function f\_ofertas

&#x20;(@minimo decimal(6,2))

&#x20;returns @ofertas table-- nombre de la tabla

&#x20;--formato de la tabla

&#x20;(codigo int,

&#x20; titulo varchar(40),

&#x20; autor varchar(30),

&#x20; precio decimal(6,2)

&#x20;)

&#x20;as

&#x20;begin

&#x20;  insert @ofertas

&#x20;   select codigo,titulo,autor,precio

&#x20;   from libros

&#x20;   where precio < @minimo

&#x20;  return

&#x20;end;

Las funciones que retornan una tabla pueden llamarse sin especificar propietario:



&#x20;select \*from f\_ofertas(30);

&#x20;select \*from dbo.f\_ofertas(30);

Dijimos que este tipo de función puede ser referenciada en el "from" de una consulta; la siguiente consulta realiza un join entre la tabla "libros" y la tabla retornada por la función "f\_ofertas":



&#x20;select \*from libros as l

&#x20; join dbo.f\_ofertas(25) as o

&#x20; on l.codigo=o.codigo;

Se puede llamar a la función como si fuese una tabla o vista listando algunos campos:



&#x20;select titulo,precio from dbo.f\_ofertas(40);

Servidor de SQL Server instalado en forma local.

Ingresemos el siguiente lote de comandos en el SQL Server Management Studio:



if object\_id('libros') is not null

&#x20; drop table libros; 



create table libros(

&#x20; codigo int identity,

&#x20; titulo varchar(40),

&#x20; autor varchar(30),

&#x20; editorial varchar(20),

&#x20; precio decimal(6,2)

);



go



insert into libros values('Uno','Richard Bach','Planeta',15);

insert into libros values('Ilusiones','Richard Bach','Planeta',10);

insert into libros values('El aleph','Borges','Emece',25);

insert into libros values('Aprenda PHP','Mario Molina','Siglo XXI',55);

insert into libros values('Alicia en el pais','Lewis Carroll','Paidos',35);

insert into libros values('Matematica estas ahi','Paenza','Nuevo siglo',25);



\-- Eliminamos la función "f\_ofertas" si existe":

if object\_id('f\_ofertas') is not null

&#x20; drop function f\_ofertas; 



go



\-- Creamos la función "f\_ofertas" que reciba un parámetro correspondiente a un precio y 

\-- nos retorne una tabla con código, título, autor y precio de todos los libros cuyo

\-- precio sea inferior al parámetro:

create function f\_ofertas

&#x20;(@minimo decimal(6,2)

&#x20;)

&#x20;returns @ofertas table-- nombre de la tabla

&#x20;--formato de la tabla

&#x20;(codigo int,

&#x20; titulo varchar(40),

&#x20; autor varchar(30),

&#x20; precio decimal(6,2)

&#x20;)

&#x20;as

&#x20;begin

&#x20;  insert @ofertas

&#x20;   select codigo,titulo,autor,precio

&#x20;   from libros

&#x20;   where precio<@minimo

&#x20;  return

&#x20;end;



go



\--Llamamos a la función como si fuera una tabla, recuerde que podemos

\-- omitir el nombre del propietario:

select \* from f\_ofertas(30);



\-- Realizamos un join entre "libros" y la tabla retornada por la función 

\-- "f\_ofertas" y mostramos todos los campos de "libros". 

\-- Incluimos una condición para el autor:

select l.titulo,l.autor,l.editorial

&#x20; from libros as l

&#x20; join dbo.f\_ofertas(25) as o

&#x20; on l.codigo=o.codigo

&#x20; where l.autor='Richard Bach';



\-- La siguiente consulta nos retorna algunos campos de la tabla 

\--retornada por "f\_ofertas" y algunos registros que cumplen 

\-- con la condición "where":

select titulo,precio from f\_ofertas(40)

&#x20; where autor like '%B%';



\-- Eliminamos la función "f\_listadolibros" si existe":

if object\_id('f\_listadolibros') is not null

&#x20; drop function f\_listadolibros; 



go



\-- Creamos otra función que retorna una tabla:

create function f\_listadolibros

&#x20;(@opcion varchar(10)

&#x20;)

&#x20;returns @listado table

&#x20;(titulo varchar(40),

&#x20;detalles varchar(60)

&#x20;)

&#x20;as 

&#x20;begin

&#x20; if @opcion not in ('autor','editorial')

&#x20;   set @opcion='autor'

&#x20; if @opcion='editorial'

&#x20;  insert @listado 

&#x20;   select titulo,

&#x20;  (editorial+'-'+autor) from libros

&#x20;  order by 2

&#x20; else

&#x20;   if @opcion='autor'

&#x20;    insert @listado

&#x20;    select titulo,

&#x20;    (autor+'-'+editorial) from libros  

&#x20;    order by 2

&#x20; return

end;



go



\-- Llamamos a la función enviando el valor "autor":

select \* from dbo.f\_listadolibros('autor');



\-- Llamamos a la función enviando el valor "editorial":

select \* from dbo.f\_listadolibros('editorial');



\-- Llamamos a la función enviando un valor inválido:

select \* from dbo.f\_listadolibros('precio');



