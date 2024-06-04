#!/bin/bash

# Запрос исходной и целевой директории у пользователя
read -p "Введите исходную директорию: " source_directory
read -p "Введите целевую директорию: " target_directory

# Запрос расширения файлов, которые нужно скопировать

# Запросить новое расширение для файлов.

# Проверка существования исходной директории

if [ ! -d "$source_directory" ]; then
   echo “Directory doesn’t exist”
   exit 1
fi

# Проверка существования целевой директории

if [ ! -d "$target_directory" ]; then
   echo “Directory doesn’t exist”
   exit 1
fi


# Проверка, есть ли файлы с указанным расширением в исходной директории
if ( find $source_directory -type f -name "*.$file_extension" );
then
    echo "File $file_extension found!"
else 
    echo "File $file_extension not found!"
    exit 1
fi
  

# Копирование файлов с указанным расширением в целевую директорию
