#!/bin/bash

# Guardar el directorio inicial
initial_dir=$(pwd)

# Buscar todos los directorios que contienen 'node_modules'
node_dirs=()
echo "Buscando directorios 'node_modules'..."
find . -name "node_modules" -type d -prune | while IFS= read -r dir; do
    node_dirs+=("$dir")
    echo "Encontrado: $dir"
done

# Total de directorios 'node_modules' encontrados
total_nodes=${#node_dirs[@]}
echo "Total de directorios 'node_modules' encontrados: $total_nodes."

# Preguntar al usuario si desea proceder con la eliminación
read -p "¿Deseas eliminar todos los directorios 'node_modules' encontrados? (y/n) " answer
if [[ $answer = [Yy]* ]]; then
    # Contador de progreso
    counter=1

    # Iterar sobre cada directorio 'node_modules' encontrado
    for node_dir in "${node_dirs[@]}"; do
        echo "Eliminando $counter de $total_nodes: $node_dir"
        
        # Eliminar el directorio 'node_modules'
        rm -rf "$node_dir"
        
        # Incrementar el contador
        ((counter++))
    done

    echo "Eliminación completada."
else
    echo "Operación cancelada."
fi

# Regresar al directorio inicial
cd "$initial_dir"
