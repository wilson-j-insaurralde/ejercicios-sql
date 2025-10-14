Hemos visto que las restricciones aplicadas a tablas aseguran valores únicos para cada registro.

Anteriormente aprendimos la restricción "primary key", otra restricción para las tablas es "unique".



La restricción "unique" impide la duplicación de claves alternas (no primarias), es decir, especifica que dos registros no puedan tener el mismo valor en un campo. Se permiten valores nulos. Se pueden aplicar varias restricciones de este tipo a una misma tabla, y pueden aplicarse a uno o varios campos que no sean clave primaria.



Se emplea cuando ya se estableció una clave primaria (como un número de legajo) pero se necesita asegurar que otros datos también sean únicos y no se repitan (como número de documento).



La sintaxis general es la siguiente:



&nbsp;alter table NOMBRETABLA

&nbsp;add constraint NOMBRERESTRICCION

&nbsp;unique (CAMPO);

Ejemplo:



&nbsp;alter table alumnos

&nbsp; add constraint UQ\_alumnos\_documento

&nbsp; unique (documento);

En el ejemplo anterior se agrega una restricción "unique" sobre el campo "documento" de la tabla "alumnos", esto asegura que no se pueda ingresar un documento si ya existe. Esta restricción permite valores nulos, asi que si se ingresa el valor "null" para el campo "documento", se acepta.



Por convención, cuando demos el nombre a las restricciones "unique" seguiremos la misma estructura: "UQ\_NOMBRETABLA\_NOMBRECAMPO". Quizá parezca innecesario colocar el nombre de la tabla, pero cuando empleemos varias tablas verá que es útil identificar las restricciones por tipo, tabla y campo.



Recuerde que cuando agregamos una restricción a una tabla que contiene información, SQL Server controla los datos existentes para confirmar que cumplen la condición de la restricción, si no los cumple, la restricción no se aplica y aparece un mensaje de error. En el caso del ejemplo anterior, si la tabla contiene números de documento duplicados, la restricción no podrá establecerse; si podrá establecerse si tiene valores nulos.



SQL Server controla la entrada de datos en inserciones y actualizaciones evitando que se ingresen valores duplicados.



Servidor de SQL Server instalado en forma local.

Ingresemos el siguiente lote de comandos en el SQL Server Management Studio:



if object\_id('alumnos') is not null

&nbsp; drop table alumnos;



create table alumnos(

&nbsp; legajo char(4) not null,

&nbsp; apellido varchar(20),

&nbsp; nombre varchar(20),

&nbsp; documento char(8)

);



go



-- Agregamos una restricción "primary" para el campo "legajo":

alter table alumnos

&nbsp;add constraint PK\_alumnos\_legajo

&nbsp;primary key(legajo);



-- Agregamos una restricción "unique" para el campo "documento":

alter table alumnos

&nbsp;add constraint UQ\_alumnos\_documento

&nbsp;unique (documento);



insert into alumnos values('A111','Lopez','Ana','22222222');

insert into alumnos values('A123','Garcia','Maria','23333333');



exec sp\_helpconstraint alumnos;

