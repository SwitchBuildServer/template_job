#!/bin/bash

source ./scripts/env.sh

current_directory="$(pwd)"
repo_directory="$(pwd)"
repo_url=$TEMPLATE_URL
branch=$TEMPLATE_BRANCH

#check if git temp repo exists
check_git_repo() {
    if [ -d "$repo_directory/.git" ]; then
        echo "Git repository already exists in $repo_directory."
        echo "Try to fetch latest version"
        git pull 
    else
        echo "Cloning Git repository into $repo_directory..."
        git clone "$repo_url" "$repo_directory" -b "$branch"
        
        if [ $? -eq 0 ]; then
            echo "Git repository cloned successfully."
        else
            echo "Error: Unable to clone Git repository."
            exit 1
        fi
    fi
}



# Check if we have more than 500 GB free space 
function check_free_space() {
    current_directory="$(pwd)"
    limit_gb=100
    available_space_gb=$(df -BG "$current_directory" | awk 'NR==2 {print $4}' | sed 's/G//')
    if (( $(echo "$available_space_gb > $limit_gb" | bc -l) )); then
        echo "There is more than $limit_gb GB of available space ($available_space_gb GB)."
        exit 0  # Exit status 0 - success
    else
        echo "There is not more than $limit_gb GB of available space ($available_space_gb GB)."
        exit 1  # Exit status 1 - error
    fi
}


#run functions
check_git_repo

check_free_space

# config git becouse is needed
git config --local user.name "customrom"
git config --local user.email "customrom@customrom.com"
