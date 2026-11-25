Descripción del proyecto: 

se nos plantea la siguiente situación. Hay una proteína llamada BRAF que es crucial en los procesos de crecimiento, división y supervivencia celular. Esta, cuando sufre un cambio conformacional, pasa de forma activa a inactiva (On-state y Off-state). Cuando hay una mutación en el código genético y la proteína no se forma como debería, no es capaz de pasar a forma inactiva y, por tanto, los procesos mencionados anteriormente se ven altamente alterados. Hay una mutación concreta en la cual una valina es permutada por ácido glutámico, llamándose esta V600E. Esta secuencia es muy común en pacientes con melanoma, cáncer colorrectal, de pulmón y de tiroides.
Afortunadamente, se ha desarrollado un nuevo medicamento que funciona en aquellos pacientes que tengan la mutación anteriormente explicada. 
Tenemos cuatro archivos formato fasta distintos cada uno con 10 pacientes. Cada paciente tiene su correspondiente cabecera y secuencia. Lo que buscamos con este script es encontrar la secuencia CTACAGAGAAATC, que es la culpable de esta mutación para así averiguar qué pacientes son candidatos para ser tratados con el medicamento desarrollado. Tras esto, los resultados serán redirigidos a un archivo tipo fasta.  
Asimismo, al estar generalizado, este script nos permite buscar cualquier secuencia. Además, permite cambiar el tipo de archivo sobre el que se va a trabajar, el directorio y el nombre del archivo de salida

Datos de entrada: 

para que el script funcione, el usuario ha de introducir una serie de datos. En primer lugar, el script pedirá que se introduzca la ruta para acceder al directorio sobre el que se quiere trabajar. Después, pedirá que se introduzca la secuencia a buscar. En penúltimo lugar, se deberá indicar el tipo de archivo a analizar y, para finalizar, el usuario tendrá que establecer el nombre del archivo en el que se guardarán los resultados. 

Script: 

el funcionamiento del script es el siguiente: 
1. Con un echo, aparece por pantalla "Introduzca la ruta que conduce al directorio en el que quiere trabajar", por lo que el usuario la introducirá. Posteriormente, gracias al comando read, esta ruta se guardará en la variable directorio. Un ejemplo podría ser /home/fcb_alumno04/tema2. Lo mismo ocurrirá con otros tres echos y reads, gracias a los cuales se guardarán las variables "secuencia", "formato_archivos" y "nombre_archivo_resultados". 
2. Se establece la variable salida, es decir,variable del archivo en el que se introducen los resultados. Este archivo se guardará en la carpeta desde la que se ejecuta el script con el nombre que hemos indicado anteriormente. Esto ocurre gracias a igualar salida a $PWD y $nombre_archivo_resultado. 
3. En este punto se abre un condicional en el que se comprueba que existe el directorio indicado en la primera variable. Si existe, se realizará lo que se indica en el script a continuación. Si no, aparecerá en la pantalla "El directorio no existe. Vuelva a ejecutar el script de nuevo."
4. Posteriormente, rm -f eliminará, antes de comenzar a analizar los archivos, el archivo que se crea con los resultados. Esto se hace para que, si se ejecuta el script dos veces, los resultados no se mezclen ni se confundan. Cada vez que se utilice el script se eliminará el archivo anterior en caso de que exista y se creará uno nuevo. Se realiza gracias al comando mencionado seguido de $salida. 
5. Se abre un bucle for para que se puedan analizar todos los archivos del directorio indicado y del tipo que se ha pedido. Se escribe además, tras un $ para recuperar la variable, tanto directorio como formato_archivos para indicar al propio bucle el directorio y el formato de los archivos que tiene que analizar.
6. Ahora se abre otro if para comprobar que el archivo que se ha indicado existe. Si es así, se seguirá ejecutando el código, pero, si no, este no podrá continuar realizándose. 
7. Dentro del condicional anterior, encontramos el comando grep -i -B1 --no-group-separator y, seguido "$secuencia" y "$archivo". Grep buscará en los archivos indicados la secuencia que se ha escrito anteriormente. Asimismo, gracias a -i ignorará si las muestras están en mayúsculas o minúsculas. Por otro lado, -B1 guardará tanto la línea en la que se encuentre la secuencia como la anterior (en el caso de un archivo fasta guardará la secuencia y la cabecera de la muestra). Con --no-group-separator conseguimos eliminar los dos guiones que se escriben por defecto tras ejecutar un grep y redirigir el resultado a un archivo. Por último, mediante >> redirigimos el resultado al archivo salida. 
8. Finaliza el if que se cumplía si el archivo existe. 
9. Finaliza el bucle for.
10. Aparece por pantalla "Se ha encontrado la secuencia en los archivos a analizar. Los resultados se encuentran en $salida" (No aparece $salida, sino el nombre que le hemos puesto al archivo de resultados). 
11. Else del primer if, ya explicado en la línea 3. 
12. Finaliza el primer condicional y, por tanto, finaliza el script. 

Resultados: 

tras ejecutar el script con los datos proporcionados por el enunciado de la práctica obtenemos un archivo con 28 líneas (lo sabemos tras ejecutar wc). Sabemos que a cada paciente le corresponden dos líneas, una es la cabecera y otra la secuencia en sí. Es por esto que llegamos a la conclusión de que son 14 los pacientes candidatos a utilizar el fármaco. Concretamente son los siguientes pacientes: 
- PAC003 | melanoma
- PAC004 | melanoma
- PAC005 | tiroides_papilar
- PAC007 | tiroides_papilar
- PAC009 | melanoma
- PAC013 | melanoma
- PAC015 | colorrectal
- PAC017 | pulmón
- PAC018 | melanoma
- PAC020 | tiroides_papilar
- PAC031 | melanoma
- PAC037 | pulmón
- PAC026 | tiroides_papilar
- PAC028 | melanoma

Tras analizar los resultados, podemos apreciar que es en las personas que tienen un melanoma en las que más se expresa esta mutación. 

Requisitos: 

Para que este código funcione correctamente debemos asegurarnos de que tanto la ruta para acceder al directorio como el tipo de archivo que introducimos al principio existen en el ordenador.
Se debe ejecutar con bash en una terminal Linux. 
Las muestras deben estar en una sola línea para que funcione correctamente si el archivo es formato fasta. Esto se debe a que, si no lo es, -B1 no copiará la cabecera y no se incluirá en el archivo de resultados. En el caso de la práctica 2, las secuencias están en una sola línea, por lo que sí es válido. 

