La restricción "check" especifica los valores que acepta un campo, evitando que se ingresen valores inapropiados.



La sintaxis básica es la siguiente:



&nbsp;alter table NOMBRETABLA

&nbsp;add constraint NOMBRECONSTRAINT

&nbsp;check CONDICION;

Trabajamos con la tabla "libros" de una librería que tiene los siguientes campos: codigo, titulo, autor, editorial, preciomin (que indica el precio para los minoristas) y preciomay (que indica el precio para los mayoristas).



Los campos correspondientes a los precios (minorista y mayorista) se definen de tipo decimal(5,2), es decir, aceptan valores entre -999.99 y 999.99. Podemos controlar que no se ingresen valores negativos para dichos campos agregando una restricción "check":



&nbsp;alter table libros

&nbsp;add constraint CK\_libros\_precio\_positivo

&nbsp;check (preciomin>=0 and preciomay>=0);

Este tipo de restricción verifica los datos cada vez que se ejecuta una sentencia "insert" o "update", es decir, actúa en inserciones y actualizaciones.



Si la tabla contiene registros que no cumplen con la restricción que se va a establecer, la restricción no se puede establecer, hasta que todos los registros cumplan con dicha restricción.



La condición puede hacer referencia a otros campos de la misma tabla. Por ejemplo, podemos controlar que el precio mayorista no sea mayor al precio minorista:



&nbsp;alter table libros

&nbsp;add constraint CK\_libros\_preciominmay

&nbsp;check (preciomay<=preciomin);

Por convención, cuando demos el nombre a las restricciones "check" seguiremos la misma estructura: comenzamos con "CK", seguido del nombre de la tabla, del campo y alguna palabra con la cual podamos identificar fácilmente de qué se trata la restricción, por si tenemos varias restricciones "check" para el mismo campo.



Un campo puede tener varias restricciones restricciones "check" y una restricción "check" puede incluir varios campos.



Las condiciones para restricciones "check" también pueden pueden incluir un patrón o una lista de valores. Por ejemplo establecer que cierto campo conste de 4 caracteres, 2 letras y 2 dígitos:



&nbsp;...

&nbsp;check (CAMPO like '\[A-Z]\[A-Z]\[0-9]\[0-9]');

O establecer que cierto campo asuma sólo los valores que se listan:



&nbsp;...

&nbsp;check (CAMPO in ('lunes','miercoles','viernes'));

No se puede aplicar esta restricción junto con la propiedad "identity".



Si un campo permite valores nulos, "null" es un valor aceptado aunque no esté incluido en la condición de restricción.



Si intentamos establecer una restricción "check" para un campo que entra en conflicto con otra restricción "check" establecida al mismo campo, SQL Server no lo permite.



Pero si establecemos una restricción "check" para un campo que entra en conflicto con una restricción "default" establecida para el mismo campo, SQL Server lo permite; pero al intentar ingresar un registro, aparece un mensaje de error.



Servidor de SQL Server instalado en forma local.

Ingresemos el siguiente lote de comandos en el SQL Server Management Studio:



if object\_id('libros') is not null

&nbsp; drop table libros;



create table libros(

&nbsp; codigo int identity,

&nbsp; titulo varchar(40),

&nbsp; autor varchar(30),

&nbsp; editorial varchar(15),

&nbsp; preciomin decimal(5,2),

&nbsp; preciomay decimal(5,2)

);



go



insert into libros values ('Uno','Bach','Planeta',22,20);

insert into libros values ('El quijote','Cervantes','Emece',15,13);

insert into libros values ('Aprenda PHP','Mario Molina','Siglo XXI',48,53);

insert into libros values ('Java en 10 minutos','Garcia','Siglo XXI',35,40);



-- Agregamos una restricción "check" para asegurar que los valores de los campos

-- correspondientes a precios no puedan ser negativos:

alter table libros

&nbsp; add constraint CK\_libros\_precios\_positivo

&nbsp; check (preciomin>=0 and preciomay>=0);



update libros set preciomay=48

&nbsp; where titulo='Aprenda PHP';



delete from libros where titulo='Java en 10 minutos'; 



-- Agregamos la restricción "check" que impida que se ingresen valores 

-- para "preciomay" superiores a "preciomin":

alter table libros

&nbsp;add constraint CK\_libros\_preciominmay

&nbsp;check (preciomay<=preciomin);



exec sp\_helpconstraint libros;



insert into libros default values;



select \* from libros;



-- Genera un error si intentamos ingresar un preciomin negativo

insert into libros values ('Java Total','Martinez','Cuello',-1,40);

