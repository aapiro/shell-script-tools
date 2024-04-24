#This shell script help you to looking for and clean al sub-directories with maven projects to clean folders
#bash maven-projects-masive-cleaner.sh
#!/bin/bash

# Guardar el directorio inicial
initial_dir=$(pwd)

# Contador de archivos 'pom.xml'
counter=0

# Buscar todos los directorios que contienen un archivo 'pom.xml' y almacenar en un array
pom_dirs=()
find . -name "pom.xml" -print0 | while IFS= read -r -d $'\0' pom_dir; do
    pom_dirs+=("$pom_dir")
    ((counter++))
    echo "Archivo pom.xml encontrado: $counter"
done

# Total de archivos 'pom.xml' encontrados
total_poms=${#pom_dirs[@]}
echo "Total de archivos pom.xml encontrados: $total_poms."

# Restablecer contador para operaciones de limpieza
counter=1

# Iterar sobre cada directorio que contiene 'pom.xml'
for pom_dir in "${pom_dirs[@]}"; do
    echo "Procesando archivo $counter de $total_poms: ${pom_dir}"
    
    # Navegar al directorio donde se encuentra 'pom.xml'
    cd "$(dirname "$pom_dir")"
    
    # Ejecutar Maven clean
    mvn clean
    
    # Regresar al directorio inicial
    cd "$initial_dir"
    
    # Incrementar el contador
    ((counter++))
done

echo "Limpieza completada para todos los proyectos Maven encontrados."
