Para aclarar algunas instrucciones, en ocasiones, necesitamos agregar comentarios.

Es posible ingresar comentarios en la línea de comandos, es decir, un texto que no se ejecuta; para ello se emplean dos guiones (--) al comienzo de la línea:



&nbsp;select \* from libros --mostramos los registros de libros; 

en la línea anterior, todo lo que está luego de los guiones (hacia la derecha) no se ejecuta.



Para agregar varias líneas de comentarios, se coloca una barra seguida de un asterisco (/\*) al comienzo del bloque de comentario y al finalizarlo, un asterisco seguido de una barra (\*/).



&nbsp;select titulo, autor 

&nbsp;/\*mostramos títulos y

&nbsp;nombres de los autores\*/

&nbsp;from libros;

todo lo que está entre los símbolos "/\*" y "\*/" no se ejecuta.



Servidor de SQL Server instalado en forma local.

Ingresemos el siguiente lote de comandos en el SQL Server Management Studio:



if object\_id('libros') is not null

&nbsp; drop table libros;



create table libros(

&nbsp; titulo varchar(30),

&nbsp; autor varchar(20),

&nbsp; editorial varchar(15)

);



go



insert into libros (titulo,autor,editorial)

&nbsp; values ('El aleph','Borges','Emece');



select \* from libros --mostramos los registros de libros; 



select titulo, autor 

&nbsp;/\*mostramos títulos y

&nbsp;nombres de los autores\*/

&nbsp; from libros;

