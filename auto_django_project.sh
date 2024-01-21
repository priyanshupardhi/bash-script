#! /bin/bash

echo "Create django project"

read -p "Enter folder where you want to create project :"  folder_name

mkdir $folder_name

cd $folder_name

echo "creating a vitrual environment"

python3 -m venv env

# Activate the virtual environment using either 'source' or '.'
# If 'source' doesn't work, replace it with '.'

. env/bin/activate


echo "installing django"

pip install django django-restframework

echo "Creating django project"

read -p "Enter project name: " project_name
django-admin startproject $project_name

cd $project_name

echo "Run the project"

echo "running makemigrations"
python3 manage.py makemigrations

echo "running migrate"
python3 manage.py migrate

echo "running the server"
python3 manage.py runserver

