#!/bin/bash

source ../scripts/env.sh

# this is a place for your adictional steps
echo "Working directory..."
pwd
echo "Change directory to rom directory $ROM_LAUNCH_PREFIX"
cd $ROM_LAUNCH_PREFIX
echo "Now working directory is ... "
pwd
echo "Other stuff running"

# example command to change clang
rm -rf prebuilts/clang/host/linux-x86
git lfs clone https://gitlab.com/yaosp/prebuilts_clang_host_linux-x86 prebuilts/clang/host/linux-x86
