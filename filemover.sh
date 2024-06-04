#!/bin/bash

# Запрос исходной и целевой директории у пользователя
read -p "Введите исходную директорию: " source_directory
read -p "Введите целевую директорию: " target_directory

# Запрос расширения файлов, которые нужно скопировать
read -p "Введите исходное расширение: " file_extension
# Запросить новое расширение для файлов.
read -p "Введите новое расширение: " new_file_extension
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

information=`ls $source_directory/*.$file_extension`
	for i in $information 
	do
	newName=`echo $i | sed 's/\.${file_extension}/.${new_file_extension}/'`
	cp $source_directory/$i $target_directory/$newName
	done

