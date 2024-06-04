#!/bin/bash

# Запрос исходной и целевой директории у пользователя
read -p "Введите исходную директорию: " source_directory
read -p "Введите целевую директорию: " target_directory

# Запрос расширения файлов, которые нужно скопировать
read -p "Введите расширение файлов для копирования (без точки): " file_extension
# Запросить новое расширение для файлов.
read -p "Введите новое расширение файлов (без точки): " new_file_extension
# Проверка существования исходной директории
if [ ! -d "$source_directory" ]; then
    echo "Директория '$source_directory' не существует или недоступна."
    exit 1
fi
# Проверка существования целевой директории
if [ ! -d "$target_directory" ]; then
    echo "Директория '$target_directory' не существует или недоступна."
    exit 1
fi
# Проверка, есть ли файлы с указанным расширением в исходной директории
matching_files=$(find "$source_directory" -maxdepth 1 -type f -name "*.$file_extension")

if [ -z "$matching_files" ]; then
    echo "В директории '$source_directory' нет файлов с расширением '.$file_extension'."
    exit 1
fi

# Копирование файлов с указанным расширением в целевую директорию
for new in $matching_files
do
file=`basename $new`
new_name=`echo $file | sed "s/\.${file_extension}/.${new_file_extension}/"`
echo "$target_directory/$new_name"
cp $new  $target_directory/$new_name
done

