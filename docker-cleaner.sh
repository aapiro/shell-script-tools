#!/bin/bash

# Limpiar Docker en macOS

echo "Iniciando limpieza de Docker..."

# Eliminar contenedores detenidos
echo "Eliminando contenedores detenidos..."
docker container prune -f

# Eliminar redes no utilizadas
echo "Eliminando redes no utilizadas..."
docker network prune -f

# Eliminar imágenes colgantes
echo "Eliminando imágenes colgantes (dangling images)..."
docker image prune -a -f

# Eliminar cachés de compilación
echo "Eliminando cachés de compilación..."
docker builder prune -f

# Opcional: Eliminar todas las imágenes no utilizadas
read -p "¿Deseas eliminar todas las imágenes no utilizadas? (y/n) " answer_images
if [[ $answer_images = [Yy]* ]]; then
    echo "Eliminando todas las imágenes no utilizadas..."
    docker image prune -a -f
fi

# Opcional: Eliminar todos los volúmenes no utilizados
read -p "¿Deseas eliminar todos los volúmenes no utilizados? (y/n) " answer_volumes
if [[ $answer_volumes = [Yy]* ]]; then
    echo "Eliminando todos los volúmenes no utilizados..."
    docker volume prune -f
fi

echo "Limpieza de Docker completada."
