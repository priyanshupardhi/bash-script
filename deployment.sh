#!/usr/bin/env bash

deploy_name="<branch-name>"
git_branch_name="<branch-name>"
service_name="<service-name>"
env_path="<absolute-path-to-env-folder"


echo -e "Runing ${deploy_name}-deploy..."

echo -e "Fetching latest code from ${git_branch_name} branch..."
if ! (eval "git pull origin ${git_branch_name}") then
    echo -e "Failed to fetch."
    exit 1
fi

echo -e "Installing requirements..."
if ! (eval "${env_path}/bin/pip install -r requirements.txt") then
    echo -e "Failed to install requirements."
    exit 1
fi

echo -e " Running migration..."
if ! (eval "${env_path}/bin/python manage.py migrate") then
    echo -e "Failed to migrate."
    exit 1
fi

echo -e "Restarting service..."
if ! (eval "sudo systemctl restart ${service_name}.service") then
    echo -e "Failed to restart service."
    exit 1
fi

echo -e "Finished ${deploy_name}-deploy."
