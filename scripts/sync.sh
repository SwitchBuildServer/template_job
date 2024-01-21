#!/bin/bash -l

source ./scripts/env.sh


echo "Syncing rom sources..."
rom_name=$ROM_LAUNCH_PREFIX
current_directory="$(pwd)"
rom_dir="$current_directory/$rom_name"
mkdir -p $rom_dir
cd $rom_dir
echo "Working directory:"
pwd

function repo_init() {
    echo "Init repository..."
    repo init -u "$REPO_URL" -b "$REPO_BRANCH"
}

function repo_sync() {
    repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all)
}

function cloning_local_manifest() {
    #todo check existes of directory
    mkdir -p $rom_dir/.repo/local_manifests
    cp -rf ../local_manifests/* $rom_dir/.repo/local_manifests/
}


if [ -d ".repo" ]; then
    echo "Repo already exists..."
    echo "Try to re sync now..."
    cloning_local_manifest
    repo_sync
    if [ $? -eq 0 ]; then
            echo "Repo re-sync successfully."
            exit 0
    else
            echo "Error: Unable to sync repo..."
            exit 1
    fi
else
    repo_init
    cloning_local_manifest
    repo_sync
    if [ $? -eq 0 ]; then
            echo "Repo sync successfully."
            exit 0
    else
            echo "Error: Unable to sync repo..."
            exit 1
    fi
fi
