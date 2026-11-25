#!/bin/bash #Este script permite al usuario encontrar una secuencia concreta en los archivos de un directorio concreto y añadir los resultados en un archivo. El usuario puede elegir la secunecia, el directorio, el formato de los archivos y el nombre y formato del archivo en el que se almacenan los resultados.
echo "Introduzca la ruta que conduce al directorio en el que quiere trabajar" #Gracias a echo aparecerá por pantalla la oración introducida entre comillas. El usuario deberá indicar el directorio en el que desea trabajar. 
read directorio #El directorio que haya indicado el usuario se guardará en la variable "directorio". 

echo "Introduzca la secuencia que quiere buscar" #Al igual que en el primer echo utilizado, la oración introducida entre comillas aparecerá en la terminal. En este caso, en vez de escribir un directorio, el usuario deberá introducir la secuencia que quiere buscar en las muestras de los archivos. 
read secuencia #Lo que el usuario introduzca se guardará en la variable "secuencia"

echo "Introduzca el formato de los archivos que contiene el directorio indicado anteriormente y en los que desea buscar la secuencia también indicada"
read formato_archivos #El formato que el usuario haya introducido se guarda como variable. 

echo "Introduzca el nombre del archivo donde desea guardar los resultados del script" #Aquí tenemos otro echo. En este caso el usuario escribirá el nombre del archivo en el que se guardará la lista de los pacientes en los que se encuentre la secuencia que se busca. 
read nombre_archivo_resultados #De nuevo, se guardará en esta variable el nombre que haya introducido el usuario.

salida="$PWD/$nombre_archivo_resultados" #Estamos definiendo la variable salida. En este caso buscamos un archivo cuyo nombre hemos indicado anteriormente que se encuentre en el directorio en que el usuario se encuentra, es por eso que se usa $PWD. 

if [ -d "$directorio" ]; then #Gracias a este if se comprueba que efectivamente existe el directorio que el usuario ha indicado. Si existe, se realizará lo que se indique tras el then. 
	
	rm -f "$salida" #Eliminamos el archivo salida antes de buscar la secuencia para que, una vez termine de realizarse y se cree este, no se mezclen con los de una ejecución anterior. Si no lo hiciéramos, los resultados se irían acumulando. En el caso de que el archivo no existiera, los archivos se guardarían con normalidad. Sin embargo, si este archivo ya existiera debido a que el script ya se ha ejecutado anteriormente, los segundos resultados se añadirían a los primeros, quedando así más resultados de los que esperamos y buscamos. Es por esto que realizamos rm -f, así nos aseguramos de que los datos que contiene el archivo que se crea tiene exactamente los resultados y datos que queremos. 
	
	for archivo in "$directorio"/*."$formato_archivos"; do #Se hará lo que se pida en todos los archivos del tipo indicado en el directorio que el usuario ha determinado anteriormente. 
	
	if [ -f "$archivo" ]; then #Se comprueba que existan archivos con el formato indicado anteriormente. Si existe, se realizarán lo que se indique tras el then. 
		
		grep -i -B1 --no-group-separator "$secuencia" "$archivo" >> "$salida" #Grep se encarga de buscar la secuencia. Lo hace en el tipo de archivos que hemos indicado. El resultado lo añade al archivo salida. Poner -i nos permite no hacer distinción entre mayúsculas y minúsculas. -B1 lo que hace es mostrar la línea anterior para que así en el archivo salida se muestren tanto la cabecera como la secuencia. --no-group-separator elimina las -- que salen por defecto al usar grep y pasar el resultado a un archivo. 
	fi #finaliza el segundo condicional.
	done #finaliza el bucle for.
	echo "Se ha encontrado la secuencia en los archivos a analizar. Los resultados se encuentran en $salida" #Aparece por pantalla la oración entrecomillada. 
else  #si el archivo no existe...
	echo "El directorio no existe. Vuelva a ejecutar el script de nuevo." #Aparece en la terminal la oración escrita. 
fi #finaliza el primer condicional y con ello el script.
