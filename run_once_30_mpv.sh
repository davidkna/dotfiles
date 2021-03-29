#!/usr/bin/env bash

set -eux

MPV_DIR=~/.config/mpv

# Shaders
mkdir -p "$MPV_DIR/shaders"
curl -fL 'https://github.com/igv/FSRCNN-TensorFlow/releases/download/0.5/FSRCNN_x2_r2_16-0-2.glsl'  \
    -o "$MPV_DIR/shaders/FSRCNNX_x2_16-0-4-1.glsl"
curl -fL 'https://gist.github.com/igv/a015fc885d5c22e6891820ad89555637/raw/609236460ed7358cb30679ef7712653c2d9fdfc0/KrigBilateral.glsl' \
    -o "$MPV_DIR/shaders/KrigBilateral.glsl"
curl -fL 'https://raw.githubusercontent.com/bjin/mpv-prescalers/master/vulkan/compute/ravu-r4.hook' \
    -o "$MPV_DIR/shaders/ravu-r4.hook"
curl -fL 'https://gist.github.com/igv/36508af3ffc84410fe39761d6969be10/raw/ac09db2c0664150863e85d5a4f9f0106b6443a12/SSimDownscaler.glsl' \
    -o "$MPV_DIR/shaders/SSimDownscaler.glsl"

# Plugins
mkdir -p "$MPV_DIR/scripts"
curl -fL 'https://github.com/mpv-player/mpv/raw/master/TOOLS/lua/autoload.lua' \
    -o  "$MPV_DIR/scripts/autoload.lua"
curl -fL 'https://github.com/mfcc64/mpv-scripts/raw/master/visualizer.lua' \
    -o  "$MPV_DIR/scripts/visualizer.lua"
curl -fL 'https://github.com/jonniek/mpv-playlistmanager/raw/master/playlistmanager.lua' \
    -o  "$MPV_DIR/scripts/playlistmanager.lua"
