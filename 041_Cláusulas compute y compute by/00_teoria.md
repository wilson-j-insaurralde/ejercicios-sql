La cláusula compute y compute by están discontinuadas en las versiones de SQL Server 2012 y sucesivas.

No utilice esta característica en nuevos proyectos y modifique lo antes posible las aplicaciones que actualmente la utilizan. En su lugar, utilice rollup.



Las cláusulas "compute" y "compute by" generan totales que aparecen en columnas extras al final del resultado.



Produce filas de detalle y un valor único para una columna.



Se usa con las funciones de agrupamiento: avg(), count(), max(), min(), sum().



La sintaxis básica y general es la siguiente:



&nbsp;select CAMPOS

&nbsp; from TABLA

&nbsp; compute FUNCION(CAMPO);

El campo que se coloque en la cláusula "compute" debe estar incluida en la lista de campos del "select".



Para ver todos los datos de los visitantes y el promedio del monto de compra de nuestra tabla "visitantes":



&nbsp;select \*from visitantes

&nbsp;compute avg(montocompra);

Produce la misma salida que las siguientes 2 sentencias:



&nbsp;select \*from visitantes;

&nbsp;select avg(montocompra) from visitantes;

En una misma instrucción se pueden colocar varias cláusulas "compute":



&nbsp;select edad,ciudad,montocompra

&nbsp; from visitantes

&nbsp; compute avg(edad),sum(montocompra);

"Compute by" genera cortes de control y subtotales. Se generan filas de detalle y varios valores de resumen cuando cambian los valores del campo.



Con "compute by" se DEBE usar también la cláusula "order by" y los campos que se incluyan luego de "by" deben estar en el "order by". Listando varios campos luego del "by" corta un grupo en subgrupos y aplica la función de agregado en cada nivel de agrupamiento:



&nbsp;select nombre,ciudad,provincia

&nbsp; from visitantes

&nbsp; order by provincia

&nbsp; compute count(provincia)

&nbsp; by provincia;



&nbsp;select nombre,ciudad,provincia

&nbsp; from visitantes

&nbsp; order by provincia,ciudad

&nbsp; compute count(provincia)

&nbsp; by provincia,ciudad;

Los campos que aparecen luego de la cláusula "compute by" DEBEN ser idénticos a un subconjunto de los campos que aparecen después de "order by" y estar en el mismo orden. Si la cláusula "order by" tiene los siguientes campos:



... order by a,b,c...

la cláusula "compute by" puede incluir los siguientes subconjuntos de campos:



... compute ...

&nbsp;   by a...

o

... compute ...

&nbsp;   by a,b...

o

... compute ...

&nbsp;   by a,b,c...

En una misma instrucción se pueden colocar varias cláusulas "compute" combinadas con varias cláusulas "compute by":



&nbsp;select \*from visitantes

&nbsp; order by provincia,ciudad

&nbsp; compute avg(edad), sum(montocompra)

&nbsp; compute avg(montocompra),count(provincia)

&nbsp; by provincia,ciudad;

El resultado de la consulta anterior muestra el promedio de la compra y la cantidad al final de cada subgrupo de provincia y ciudad (compute by) y el promedio de las edades y el total del monto de compras de todos (compute).



Los tipos de datos ntext, text e image no se pueden incluir en una cláusula "compute" o "compute by".

