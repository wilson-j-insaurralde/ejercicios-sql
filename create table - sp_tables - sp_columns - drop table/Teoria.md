Ver video



Una base de datos almacena su información en tablas.



Una tabla es una estructura de datos que organiza los datos en columnas y filas; cada columna es un campo (o atributo) y cada fila, un registro. La intersección de una columna con una fila, contiene un dato específico, un solo valor.



Cada registro contiene un dato por cada columna de la tabla.

Cada campo (columna) debe tener un nombre. El nombre del campo hace referencia a la información que almacenará.

Cada campo (columna) también debe definir el tipo de dato que almacenará.



Las tablas forman parte de una base de datos.



Nosotros trabajaremos con la base de datos llamada wi121505\_bd1 (este nombre se debe a que la empresa de hosting es la que lo define), que ya he creado en el servidor.



Para ver las tablas existentes creadas por los usuarios en una base de datos usamos el procedimiento almacenado "sp\_tables @table\_owner='dbo';":



exec sp\_tables @table\_owner='dbo';

El parámetro @table\_owner='dbo' indica que solo muestre las tablas de usuarios y no las que crea el SQL Server para administración interna.



Finalizamos cada comando con un punto y coma.



Al crear una tabla debemos resolver qué campos (columnas) tendrá y que tipo de datos almacenarán cada uno de ellos, es decir, su estructura.



La sintaxis básica y general para crear una tabla es la siguiente:



&nbsp;create table NOMBRETABLA(

&nbsp; NOMBRECAMPO1 TIPODEDATO,

&nbsp; ...

&nbsp; NOMBRECAMPON TIPODEDATO

&nbsp;);

La tabla debe ser definida con un nombre que la identifique y con el cual accederemos a ella.



Creamos una tabla llamada "usuarios" y entre paréntesis definimos los campos y sus tipos:



&nbsp;create table usuarios (

&nbsp; nombre varchar(30),

&nbsp; clave varchar(10)

&nbsp;);

Cada campo con su tipo debe separarse con comas de los siguientes, excepto el último.



Cuando se crea una tabla debemos indicar su nombre y definir al menos un campo con su tipo de dato. En esta tabla "usuarios" definimos 2 campos:



nombre: que contendrá una cadena de caracteres de 30 caracteres de longitud, que almacenará el nombre de usuario y

clave: otra cadena de caracteres de 10 de longitud, que guardará la clave de cada usuario.

Cada usuario ocupará un registro de esta tabla, con su respectivo nombre y clave.



Para nombres de tablas, se puede utilizar cualquier caracter permitido para nombres de directorios, el primero debe ser un caracter alfabético y no puede contener espacios. La longitud máxima es de 128 caracteres.



Si intentamos crear una tabla con un nombre ya existente (existe otra tabla con ese nombre), mostrará un mensaje indicando que ya hay un objeto llamado 'usuarios' en la base de datos y la sentencia no se ejecutará. Esto es muy importante ya que cuando haga los ejercicios en este sitio puede haber otra persona que haya creado una tabla con el nombre que usted especifique.



Para ver la estructura de una tabla usamos el procedimiento almacenado "sp\_columns" junto al nombre de la tabla:



exec sp\_columns usuarios;

aparece mucha información que no analizaremos en detalle, como el nombre de la tabla, su propietario, los campos, el tipo de dato de cada campo, su longitud, etc.:



...COLUMN\_NAME	TYPE\_NAME	LENGHT

\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_

&nbsp;  nombre	varchar		30	

&nbsp;  clave	varchar		10

Para eliminar una tabla usamos "drop table" junto al nombre de la tabla a eliminar:



&nbsp;drop table usuarios;

Si intentamos eliminar una tabla que no existe, aparece un mensaje de error indicando tal situación y la sentencia no se ejecuta. Para evitar este mensaje podemos agregar a la instrucción lo siguiente:



&nbsp;if object\_id('usuarios') is not null

&nbsp; drop table usuarios;

En la sentencia precedente especificamos que elimine la tabla "usuarios" si existe.

