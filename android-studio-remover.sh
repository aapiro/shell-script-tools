#!/bin/bash

# Script para limpiar y purgar Android Studio en macOS

echo "Iniciando la limpieza de Android Studio..."

# Eliminar Android Studio
echo "Eliminando Android Studio..."
rm -rf /Applications/Android\ Studio.app

# Eliminar configuraciones de Android Studio
echo "Eliminando configuraciones de Android Studio..."
rm -rf ~/Library/Preferences/com.google.android.studio.plist
rm -rf ~/Library/Preferences/AndroidStudio*
rm -rf ~/Library/Application\ Support/AndroidStudio*
rm -rf ~/Library/Logs/AndroidStudio*
rm -rf ~/Library/Caches/AndroidStudio*

# Eliminar SDKs de Android
echo "Eliminando SDKs de Android..."
rm -rf ~/Library/Android/sdk

# Eliminar AVDs
echo "Eliminando Android Virtual Devices (AVDs)..."
rm -rf ~/.android/avd

# Eliminar Gradle caches y wrappers
echo "Eliminando caches y wrappers de Gradle..."
rm -rf ~/.gradle

echo "Limpieza completada. Android Studio y sus componentes asociados han sido eliminados."
