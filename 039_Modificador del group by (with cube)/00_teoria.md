Hemos aprendido el modificador "rollup", que agrega filas extras mostrando resultados de resumen por cada grupo y subgrupo.



Por ejemplo, tenemos una tabla llamada "empleados" que contiene, entre otros, los campos "sexo", "estadocivil" y "seccion".



Si se agrupa por esos tres campos (en ese orden) y se emplea "rollup":



&nbsp;select sexo,estadocivil,seccion,

&nbsp; count(\*) from empleados

&nbsp; group by sexo,estadocivil,seccion

&nbsp; with rollup;

SQL Server genera varias filas extras con información de resumen para los siguientes subgrupos:



\- sexo y estadocivil (seccion seteado a "null"),

\- sexo (estadocivil y seccion seteados a "null") y

\- total (todos los campos seteados a "null").

Si se emplea "cube":



&nbsp;select sexo,estadocivil,seccion,

&nbsp; count(\*) from empleados

&nbsp; group by sexo,estadocivil,seccion

&nbsp; with cube;

retorna más filas extras además de las anteriores:



\- sexo y seccion (estadocivil seteado a "null"),

\- estadocivil y seccion (sexo seteado a "null"),

\- seccion (sexo y estadocivil seteados a "null") y

\- estadocivil (sexo y seccion seteados a "null"),

Es decir, "cube" genera filas de resumen de subgrupos para todas las combinaciones posibles de los valores de los campos por los que agrupamos.



Se pueden colocar hasta 10 campos en el "group by".



Con "cube" se puede emplear "where" y "having", pero no es compatible con "all".



Servidor de SQL Server instalado en forma local.

Ingresemos el siguiente lote de comandos en el SQL Server Management Studio:



if object\_id('empleados') is not null

&nbsp; drop table empleados;



create table empleados (

&nbsp; documento varchar(8) not null,

&nbsp; nombre varchar(30),

&nbsp; sexo char(1),

&nbsp; estadocivil char(1),--c=casado, s=soltero,v=viudo

&nbsp; seccion varchar(20),

&nbsp; primary key (documento)

);



go



insert into empleados

&nbsp; values ('22222222','Alberto Lopez','m','c','Sistemas');

insert into empleados

&nbsp; values ('23333333','Beatriz Garcia','f','c','Administracion');

insert into empleados

&nbsp; values ('24444444','Carlos Fuentes','m','s','Administracion');

insert into empleados

&nbsp; values ('25555555','Daniel Garcia','m','s','Sistemas');

insert into empleados

&nbsp; values ('26666666','Ester Juarez','f','c','Sistemas');

insert into empleados

&nbsp; values ('27777777','Fabian Torres','m','s','Sistemas');

insert into empleados

&nbsp; values ('28888888','Gabriela Lopez','f','c','Sistemas');

insert into empleados

&nbsp; values ('29999999','Hector Garcia','m','c','Administracion');

insert into empleados

&nbsp; values ('30000000','Ines Torres','f','c','Administracion');

insert into empleados

&nbsp; values ('11111111','Juan Garcia','m','v','Administracion');

insert into empleados

&nbsp; values ('12222222','Luisa Perez','f','v','Administracion');

insert into empleados

&nbsp; values ('31111111','Marcela Garcia','f','s','Administracion');

insert into empleados

&nbsp; values ('32222222','Nestor Fuentes','m','c','Sistemas');

insert into empleados

&nbsp; values ('33333333','Oscar Garcia','m','s','Sistemas');

insert into empleados

&nbsp; values ('34444444','Patricia Juarez','f','c','Administracion');

insert into empleados

&nbsp; values ('35555555','Roberto Torres','m','c','Sistemas');

insert into empleados

&nbsp; values ('36666666','Susana Torres','f','c','Administracion');



select sexo,estadocivil,seccion,

&nbsp; count(\*) from empleados

&nbsp; group by sexo,estadocivil,seccion

&nbsp; with rollup;



select sexo,estadocivil,seccion,

&nbsp; count(\*) from empleados

&nbsp; group by sexo,estadocivil,seccion

&nbsp; with cube;

