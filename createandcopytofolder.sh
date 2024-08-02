#!/bin/bash 

# Verifica si el directorio artifacts existe y elimínalo si es así
if [ -d "artifacts" ]; then
  rm -r artifacts
fi

# Crea un nuevo directorio artifacts
mkdir artifacts

# Copia el contenido del directorio build/web al directorio artifacts
cp -R build/web artifacts

