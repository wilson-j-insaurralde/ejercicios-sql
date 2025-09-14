

Ver video



Se utiliza "in" para averiguar si el valor de un campo está incluido en una lista de valores especificada.



En la siguiente sentencia usamos "in" para averiguar si el valor del campo autor está incluido en la lista de valores especificada (en este caso, 2 cadenas).



Hasta ahora, para recuperar los libros cuyo autor sea 'Paenza' o 'Borges' usábamos 2 condiciones:



&nbsp;select \*from libros

&nbsp; where autor='Borges' or autor='Paenza';

Podemos usar "in" y simplificar la consulta:



&nbsp;select \* from libros

&nbsp; where autor in('Borges','Paenza');

Para recuperar los libros cuyo autor no sea 'Paenza' ni 'Borges' usábamos:



&nbsp;select \* from libros

&nbsp; where autor<>'Borges' and

&nbsp; autor<>'Paenza';

También podemos usar "in" anteponiendo "not":



&nbsp;select \* from libros

&nbsp; where autor not in ('Borges','Paenza');

Empleando "in" averiguamos si el valor del campo está incluido en la lista de valores especificada; con "not" antecediendo la condición, invertimos el resultado, es decir, recuperamos los valores que no se encuentran (coindicen) con la lista de valores.



Los valores "null" no se consideran.



Recuerde: siempre que sea posible, emplee condiciones de búsqueda positivas ("in"), evite las negativas ("not in") porque con ellas se evalún todos los registros y esto hace más lenta la recuperación de los datos.



Servidor de SQL Server instalado en forma local.

Ingresemos el siguiente lote de comandos en el SQL Server Management Studio:



if object\_id ('libros') is not null

&nbsp; drop table libros;



create table libros(

&nbsp; codigo int identity,

&nbsp; titulo varchar(40) not null,

&nbsp; autor varchar(20),

&nbsp; editorial varchar(20),

&nbsp; precio decimal(6,2),

);



go



insert into libros

&nbsp; values('El aleph','Borges','Emece',15.90);

insert into libros

&nbsp; values('Cervantes y el quijote','Borges','Paidos',null);

insert into libros

&nbsp; values('Alicia en el pais de las maravillas','Lewis Carroll',null,19.90);

insert into libros

&nbsp; values('Matematica estas ahi','Paenza','Siglo XXI',15);

insert into libros (titulo,precio)

&nbsp; values('Antología poética',32);

insert into libros (titulo,autor,precio)

&nbsp; values('Martin Fierro','Jose Hernandez',40);

insert into libros (titulo,autor,precio)

&nbsp; values('Aprenda PHP','Mario Molina',56.50);



select \* from libros

&nbsp; where autor in('Borges','Paenza');



select \* from libros

&nbsp; where autor not in ('Borges','Paenza');

