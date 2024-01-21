#! /bin/bash

echo "My first bash script :)"

GREET="Hello Team"
echo $GREET

echo "NAME:$1";
echo "AGE:$2";


while true; do
    read -p "Hello $NAME, do you wish to have a drink? (yes/no): " yn
    case $yn in
        [Yy]* ) echo "Cheers!"; break;;
        [Nn]* ) echo "Maybe next time. Goodbye!"; exit;;
        * ) echo "Please answer yes or no."
    esac
done
