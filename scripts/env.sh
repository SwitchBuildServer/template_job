#!/bin/bash


# Template git repository  
# if you provide changes you need to change this value
TEMPLATE_URL=https://github.com/SwitchBuildServer/template_job
TEMPLATE_BRANCH=dev

REPO_URL=https://github.com/ProjectMatrixx/android.git
REPO_BRANCH=14.0
REPO_PARAMS=--git-lfs

LOCAL_MANIFEST_URL=https://github.com/SwitchBuildServer/local_manifests_matrix
LOCAL_MANIFEST_BRANCH=matrix-14.0

DEVICE_NAME=raphael
ROM_LAUNCH_PREFIX=lineage
BUILD_TYPE=user

# config git becouse is needed
git config --global user.name "customrom"
git config --global user.email "customrom@customrom.com"

