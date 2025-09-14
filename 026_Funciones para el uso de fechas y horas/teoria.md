Microsoft SQL Server ofrece algunas funciones para trabajar con fechas y horas. Estas son algunas:



\- getdate(): retorna la fecha y hora actuales. Ejemplo:



&nbsp;select getdate();

\- datepart(partedefecha,fecha): retorna la parte específica de una fecha, el año, trimestre, día, hora, etc.



Los valores para "partedefecha" pueden ser: year (año), quarter (cuarto), month (mes), day (dia), week (semana), hour (hora), minute (minuto), second (segundo) y millisecond (milisegundo). Ejemplos:



&nbsp;select datepart(month,getdate());

retorna el número de mes actual;



&nbsp;select datepart(day,getdate());

retorna el día actual;



&nbsp;select datepart(hour,getdate());

retorna la hora actual;



\- datename(partedefecha,fecha): retorna el nombre de una parte específica de una fecha. Los valores para "partedefecha" pueden ser los mismos que se explicaron anteriormente. Ejemplos:



&nbsp;select datename(month,getdate());

retorna el nombre del mes actual;



&nbsp;select datename(day,getdate());

\- dateadd(partedelafecha,numero,fecha): agrega un intervalo a la fecha especificada, es decir, retorna una fecha adicionando a la fecha enviada como tercer argumento, el intervalo de tiempo indicado por el primer parámetro, tantas veces como lo indica el segundo parámetro. Los valores para el primer argumento pueden ser: year (año), quarter (cuarto), month (mes), day (dia), week (semana), hour (hora), minute (minuto), second (segundo) y millisecond (milisegundo). Ejemplos:



&nbsp;select dateadd(day,3,'1980/11/02');

retorna "1980/11/05", agrega 3 días.



&nbsp;select dateadd(month,3,'1980/11/02');

retorna "1981/02/02", agrega 3 meses.



&nbsp;select dateadd(hour,2,'1980/11/02');

retorna "1980/02/02 2:00:00", agrega 2 horas.



&nbsp;select dateadd(minute,16,'1980/11/02');

retorna "1980/02/02 00:16:00", agrega 16 minutos.



\- datediff(partedelafecha,fecha1,fecha2): calcula el intervalo de tiempo (según el primer argumento) entre las 2 fechas. El resultado es un valor entero que corresponde a fecha2-fecha1. Los valores de "partedelafecha) pueden ser los mismos que se especificaron anteriormente. Ejemplos:



&nbsp;select datediff (day,'2005/10/28','2006/10/28');

retorna 365 (días).



&nbsp;select datediff(month,'2005/10/28','2006/11/29');

retorna 13 (meses).



\- day(fecha): retorna el día de la fecha especificada. Ejemplo:



&nbsp;select day(getdate());

\- month(fecha): retorna el mes de la fecha especificada. Ejemplo:



&nbsp;select month(getdate());

\- year(fecha): retorna el año de la fecha especificada. Ejemplo:



&nbsp;select year(getdate());

Se pueden emplear estas funciones enviando como argumento el nombre de un campo de tipo datetime o smalldatetime.



Servidor de SQL Server instalado en forma local.

Ingresemos el siguiente lote de comandos en el SQL Server Management Studio:



if object\_id ('libros') is not null

&nbsp; drop table libros;



create table libros(

&nbsp; titulo varchar(40) not null,

&nbsp; autor varchar(20) default 'Desconocido',

&nbsp; editorial varchar(20),

&nbsp; edicion datetime,

&nbsp; precio decimal(6,2)

);



go



set dateformat ymd;



insert into libros 

&nbsp; values('El aleph','Borges','Emece','1980/10/10',25.33);

insert into libros 

&nbsp; values('Java en 10 minutos','Mario Molina','Siglo XXI','2000/05/05',50.65);

insert into libros 

values('Alicia en el pais de las maravillas','Lewis Carroll','Emece','2000/08/09',19.95);

insert into libros 

&nbsp; values('Aprenda PHP','Mario Molina','Siglo XXI','2000/02/04',45);



-- Mostramos el título del libro y el año de edición:

select titulo, datepart (year,edicion) from libros;



-- Mostramos el título del libro y el nombre del mes de edición:

select titulo, datename (month,edicion) from libros;



-- Mostramos el título del libro y los años que tienen de editados:

select titulo, datediff(year,edicion,getdate()) from libros;



-- Muestre los títulos de los libros que se editaron el día 9, de cualquier mes de cualquier año:

&nbsp;select titulo from libros

&nbsp; where datepart(day,edicion)=9;

