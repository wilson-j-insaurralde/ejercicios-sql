Hemos aprendido a seleccionar algunos campos de una tabla.

También es posible recuperar algunos registros.



Existe una cláusula, "where" con la cual podemos especificar condiciones para una consulta "select". Es decir, podemos recuperar algunos registros, sólo los que cumplan con ciertas condiciones indicadas con la cláusula "where". Por ejemplo, queremos ver el usuario cuyo nombre es "Marcelo", para ello utilizamos "where" y luego de ella, la condición:



&nbsp;select nombre, clave

&nbsp; from usuarios

&nbsp; where nombre='Marcelo';

La sintaxis básica y general es la siguiente:



&nbsp;select NOMBRECAMPO1, ..., NOMBRECAMPOn

&nbsp; from NOMBRETABLA

&nbsp; where CONDICION;

Para las condiciones se utilizan operadores relacionales (tema que trataremos más adelante en detalle). El signo igual(=) es un operador relacional.

Para la siguiente selección de registros especificamos una condición que solicita los usuarios cuya clave es igual a "River":



&nbsp;select nombre,clave

&nbsp; from usuarios

&nbsp; where clave='River';

Si ningún registro cumple la condición establecida con el "where", no aparecerá ningún registro.



Entonces, con "where" establecemos condiciones para recuperar algunos registros.



Para recuperar algunos campos de algunos registros combinamos en la consulta la lista de campos y la cláusula "where":



&nbsp;select nombre

&nbsp; from usuarios

&nbsp; where clave='River';

En la consulta anterior solicitamos el nombre de todos los usuarios cuya clave sea igual a "River".



Servidor de SQL Server instalado en forma local.

Ingresemos el siguiente lote de comandos en el SQL Server Management Studio:



if object\_id('usuarios') is not null

&nbsp; drop table usuarios;



create table usuarios (

&nbsp; nombre varchar(30),

&nbsp; clave varchar(10)

);



go 



exec sp\_columns usuarios;



insert into usuarios (nombre, clave)

&nbsp; values ('Marcelo','Boca');

insert into usuarios (nombre, clave)

&nbsp; values ('JuanPerez','Juancito');

insert into usuarios (nombre, clave)

&nbsp; values ('Susana','River');

insert into usuarios (nombre, clave)

&nbsp; values ('Luis','River');



-- Recuperamos el usuario cuyo nombre es "Leonardo"

select \* from usuarios

&nbsp; where nombre='Leonardo';



-- Recuperamos el nombre de los usuarios cuya clave es "River"

select nombre from usuarios

&nbsp; where clave='River';



-- Recuperamos el nombres de los usuarios cuya clave es "Santi"

select nombre from usuarios

&nbsp; where clave='Santi';

