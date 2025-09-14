Existe un operador relacional que se usa para realizar comparaciones exclusivamente de cadenas, "like" y "not like".



Hemos realizado consultas utilizando operadores relacionales para comparar cadenas. Por ejemplo, sabemos recuperar los libros cuyo autor sea igual a la cadena "Borges":



&nbsp;select \*from libros

&nbsp; where autor='Borges';

El operador igual ("=") nos permite comparar cadenas de caracteres, pero al realizar la comparación, busca coincidencias de cadenas completas, realiza una búsqueda exacta.



Imaginemos que tenemos registrados estos 2 libros:



&nbsp;"El Aleph", "Borges";

&nbsp;"Antologia poetica", "J.L. Borges";

Si queremos recuperar todos los libros de "Borges" y especificamos la siguiente condición:



&nbsp;select \* from libros

&nbsp;where autor='Borges';

sólo aparecerá el primer registro, ya que la cadena "Borges" no es igual a la cadena "J.L. Borges".



Esto sucede porque el operador "=" (igual), también el operador "<>" (distinto) comparan cadenas de caracteres completas. Para comparar porciones de cadenas utilizamos los operadores "like" y "not like".



Entonces, podemos comparar trozos de cadenas de caracteres para realizar consultas. Para recuperar todos los registros cuyo autor contenga la cadena "Borges" debemos tipear:



&nbsp;select \* from libros

&nbsp; where autor like "%Borges%";

El símbolo "%" (porcentaje) reemplaza cualquier cantidad de caracteres (incluyendo ningún caracter). Es un caracter comodín. "like" y "not like" son operadores de comparación que señalan igualdad o diferencia.



Para seleccionar todos los libros que comiencen con "M":



&nbsp;select \* from libros

&nbsp; where titulo like 'M%';

Note que el símbolo "%" ya no está al comienzo, con esto indicamos que el título debe tener como primera letra la "M" y luego, cualquier cantidad de caracteres.



Para seleccionar todos los libros que NO comiencen con "M":



&nbsp;select \* from libros

&nbsp; where titulo not like 'M%';

Así como "%" reemplaza cualquier cantidad de caracteres, el guión bajo "\_" reemplaza un caracter, es otro caracter comodín. Por ejemplo, queremos ver los libros de "Lewis Carroll" pero no recordamos si se escribe "Carroll" o "Carrolt", entonces tipeamos esta condición:



&nbsp;select \* from libros

&nbsp; where autor like "%Carrol\_";

Otro caracter comodín es \[] reemplaza cualquier carácter contenido en el conjunto especificado dentro de los corchetes.



Para seleccionar los libros cuya editorial comienza con las letras entre la "P" y la "S" usamos la siguiente sintaxis:



&nbsp;select titulo,autor,editorial

&nbsp; from libros

&nbsp; where editorial like '\[P-S]%';

Ejemplos:



... like '\[a-cf-i]%': busca cadenas que comiencen con a,b,c,f,g,h o i;

... like '\[-acfi]%': busca cadenas que comiencen con -,a,c,f o i;

... like 'A\[\_]9%': busca cadenas que comiencen con 'A\_9';

... like 'A\[nm]%': busca cadenas que comiencen con 'An' o 'Am'.

El cuarto caracter comodín es \[^] reemplaza cualquier caracter NO presente en el conjunto especificado dentro de los corchetes.



Para seleccionar los libros cuya editorial NO comienza con las letras "P" ni "N" tipeamos:



&nbsp;select titulo,autor,editorial

&nbsp; from libros

&nbsp; where editorial like '\[^PN]%';

"like" se emplea con tipos de datos char, nchar, varchar, nvarchar o datetime. Si empleamos "like" con tipos de datos que no son caracteres, SQL Server convierte (si es posible) el tipo de dato a caracter. Por ejemplo, queremos buscar todos los libros cuyo precio se encuentre entre 10.00 y 19.99:



&nbsp;select titulo,precio from libros

&nbsp; where precio like '1\_.%';

Queremos los libros que NO incluyen centavos en sus precios:



&nbsp;select titulo,precio from libros

&nbsp; where precio like '%.00';

Para búsquedas de caracteres comodines como literales, debe incluirlo dentro de corchetes, por ejemplo, si busca:



... like '%\[%]%': busca cadenas que contengan el signo '%';

... like '%\[\_]%': busca cadenas que contengan el signo '\_';

... like '%\[\[]%': busca cadenas que contengan el signo '\[';

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

&nbsp; primary key(codigo)

);



go



insert into libros

&nbsp; values('El aleph','Borges','Emece',15.90);

insert into libros

&nbsp; values('Antología poética','J. L. Borges','Planeta',null);

insert into libros

&nbsp; values('Alicia en el pais de las maravillas','Lewis Carroll',null,19.90);

insert into libros

&nbsp; values('Matematica estas ahi','Paenza','Siglo XXI',15);

insert into libros

&nbsp; values('Martin Fierro','Jose Hernandez',default,40);

insert into libros

&nbsp; values('Aprenda PHP','Mario Molina','Nuevo siglo',56.50);



-- Recuperamos todos los libros que contengan en el campo "autor" la cadena "Borges":

select \* from libros

&nbsp; where autor like '%Borges%';



-- Seleccionamos los libros cuyos títulos comienzan con la letra "M":

select \* from libros

&nbsp; where titulo like 'M%';



-- Seleccionamos todos los títulos que NO comienzan con "M":

select \* from libros

&nbsp; where titulo not like 'M%';



-- Si queremos ver los libros de "Lewis Carroll" pero no recordamos si se escribe 

-- "Carroll" o "Carrolt", podemos emplear el comodín "\_" (guión bajo) y establecer

-- la siguiente condición:

select \* from libros

&nbsp; where autor like '%Carrol\_';



-- Buscamos los libros cuya editorial comienza con las letras entre la "P" y la "S":

select titulo,autor,editorial

&nbsp; from libros

&nbsp; where editorial like '\[P-S]%';



-- Seleccionamos los libros cuya editorial NO comienza con las letras "P" ni "N":

select titulo,autor,editorial

&nbsp; from libros

&nbsp; where editorial like '\[^PN]%';



-- Recuperamos todos los libros cuyo precio se encuentra entre 10.00 y 19.99:

select titulo,precio from libros

&nbsp; where precio like '1\_.%';



-- Recuperamos los libros que NO incluyen centavos en sus precios:

select titulo,precio from libros

&nbsp; where precio like '%.00';

