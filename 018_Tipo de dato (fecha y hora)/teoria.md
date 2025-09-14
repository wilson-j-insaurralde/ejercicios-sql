

Ver video



Ya explicamos que al crear una tabla debemos elegir la estructura adecuada, esto es, definir los campos y sus tipos más precisos, según el caso.



Para almacenar valores de tipo FECHA Y HORA SQL Server dispone de dos tipos:



1\) datetime: puede almacenar valores desde 01 de enero de 1753 hasta 31 de diciembre de 9999.



2\) smalldatetime: el rango va de 01 de enero de 1900 hasta 06 de junio de 2079.



Las fechas se ingresan entre comillas simples.



Para almacenar valores de tipo fecha se permiten como separadores "/", "-" y ".".



SQL Server reconoce varios formatos de entrada de datos de tipo fecha. Para establecer el orden de las partes de una fecha (dia, mes y año) empleamos "set dateformat". Estos son los formatos:



-mdy: 4/15/96 (mes y día con 1 ó 2 dígitos y año con 2 ó 4 dígitos),

-myd: 4/96/15,

-dmy: 15/4/1996

-dym: 15/96/4,

-ydm: 96/15/4,

-ydm: 1996/15/4,

Para ingresar una fecha con formato "día-mes-año", tipeamos:



&nbsp;set dateformat dmy;

El formato por defecto es "mdy".



Todos los valores de tipo "datetime" se muestran en formato "año-mes-día hora:minuto:segundo .milisegundos", independientemente del formato de ingreso que hayamos seteado.



Podemos ingresar una fecha, sin hora, en tal caso la hora se guarda como "00:00:00". Por ejemplo, si ingresamos '25-12-01' (año de 2 dígitos), lo mostrará así: '2001-12-25 00:00:00.000'.



Podemos ingresar una hora sin fecha, en tal caso, coloca la fecha "1900-01-01". Por ejemplo, si ingresamos '10:15', mostrará '1900-01-01 10:15.000'.



Podemos emplear los operadores relacionales vistos para comparar fechas.



Tipo		Bytes de almacenamiento

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

datetime	8

smalldatetime	4

Servidor de SQL Server instalado en forma local.

Ingresemos el siguiente lote de comandos en el SQL Server Management Studio:



if object\_id('empleados') is not null

&nbsp; drop table empleados;



create table empleados(

&nbsp; nombre varchar(20),

&nbsp; documento char(8),

&nbsp; fechaingreso datetime

);



go



-- Seteamos el formato de la fecha para que guarde día, mes y año:

set dateformat dmy;



insert into empleados values('Ana Gomez','22222222','12-01-1980');

insert into empleados values('Bernardo Huerta','23333333','15-03-81');

insert into empleados values('Carla Juarez','24444444','20/05/1983');

insert into empleados values('Daniel Lopez','25555555','2.5.1990');



-- Note que el formato de visualización es "y-m-d".

select \* from empleados;



-- Mostramos los datos de los empleados cuya fecha de ingreso es anterior a '01-01-1985':

select \* from empleados where fechaingreso<'01-01-1985';



-- Actualizamos el nombre a "Maria Carla Juarez' 

-- del empleado cuya fecha de ingreso es igual a '20/05/1983':

update empleados set nombre='Maria Carla Juarez' where fechaingreso='20.5.83';



select \* from empleados;



-- Borramos los empleados cuya fecha de ingreso es distinta a '20.5.83':

delete from empleados where fechaingreso<>'20/05/1983';



select \* from empleados;

