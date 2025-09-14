Las funciones matemáticas realizan operaciones con expresiones numéricas y retornan un resultado, operan con tipos de datos numéricos.



Microsoft SQL Server tiene algunas funciones para trabajar con números. Aquí presentamos algunas.



-abs(x): retorna el valor absoluto del argumento "x". Ejemplo:



&nbsp;select abs(-20);

retorna 20.



-ceiling(x): redondea hacia arriba el argumento "x". Ejemplo:



&nbsp;select ceiling(12.34);

retorna 13.



-floor(x): redondea hacia abajo el argumento "x". Ejemplo:



&nbsp;select floor(12.34);

retorna 12.



\- %: %: devuelve el resto de una división. Ejemplos:



&nbsp;select 10%3;

retorna 1.



&nbsp;select 10%2;

retorna 0.



-power(x,y): retorna el valor de "x" elevado a la "y" potencia. Ejemplo:



&nbsp;select power(2,3);

retorna 8.



-round(numero,longitud): retorna un número redondeado a la longitud especificada. "longitud" debe ser tinyint, smallint o int. Si "longitud" es positivo, el número de decimales es redondeado según "longitud"; si es negativo, el número es redondeado desde la parte entera según el valor de "longitud". Ejemplos:



&nbsp;select round(123.456,1);

retorna "123.400", es decir, redondea desde el primer decimal.



&nbsp;select round(123.456,2);

retorna "123.460", es decir, redondea desde el segundo decimal.



&nbsp;select round(123.456,-1);

retorna "120.000", es decir, redondea desde el primer valor entero (hacia la izquierda).



&nbsp;select round(123.456,-2);

retorna "100.000", es decir, redondea desde el segundo valor entero (hacia la izquierda).



-sign(x): si el argumento es un valor positivo devuelve 1;-1 si es negativo y si es 0, 0.



-square(x): retorna el cuadrado del argumento. Ejemplo:



&nbsp;select square(3); retorna 9.

-srqt(x): devuelve la raiz cuadrada del valor enviado como argumento.



SQL Server dispone de funciones trigonométricas que retornan radianes.



Se pueden emplear estas funciones enviando como argumento el nombre de un campo de tipo numérico.



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



-- Vamos a mostrar los precios de los libros redondeando el valor hacia abajo y hacia arriba:

select titulo,autor,precio,

&nbsp; floor(precio) as abajo,

&nbsp; ceiling(precio) as arriba

&nbsp; from libros;

