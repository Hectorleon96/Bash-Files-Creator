#!/bin/bash

# Automatization for create multiple directories. # Parameters:
# $1 = name
# $2 = extention
# $3 = number
# $4 = route
# Use: ./files_Creator.sh file txt 2 folder/ 

error() { 
    echo $1
    exit 1
}

file_number=$3
extention=$2

createFiles() {
    
    for (( i = 1; i <= $file_number; i++ )); do
        name="$1$i.$extention"
        if [ $i -lt 10 ]; then
            name="$10$i.$extention"
        fi
        touch $name
    done
}

finish() {
    echo "Done!"
}

if [ $# -ne 4 ]; then # parameters
    error "Error: number of parameters, use: name, extention, number, route" 
fi

if [ $3 -lt 1 ]; then # file number
    error "Error: file number cannot be less than 1"
fi

if [[ -d $4 ]]; then
    cd ./$4 
    createFiles
    finish

    elif [[ ! -d $4 ]]; then # route  
    echo "Error: the directory doesn't exist"
    echo -n "create directory [S,N] ? "
    read createDic

        if [[ $createDic == "" ]]; then
            echo "Folder name is empty, was created as 'newFolder'"
            mkdir newFolder && cd newFolder
            createFiles
            finish
        elif [[ $createDic == [nN] ]]; then
            error "Error: the directory was not created"

        elif [[ $createDic == [sS] ]]; then
            mkdir $4 && cd ./$4
            createFiles
            finish
        else
            error "Caution: invalid option"
    fi
fi

