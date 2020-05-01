#!/usr/bin/env bash

set -eux

MPV_DIR=~/.config/mpv

# Shaders
curl -fL 'https://github.com/igv/FSRCNN-TensorFlow/releases/download/1.1/FSRCNNX_x2_16-0-4-1.glsl'  \
    -o "$MPV_DIR/shaders/FSRCNNX_x2_16-0-4-1.glsl"
curl -fL 'https://gist.githubusercontent.com/igv/a015fc885d5c22e6891820ad89555637/raw/c471ef6dcbd3c4a977e1c95dc40944ee38fad08a/KrigBilateral.glsl' \
    -o "$MPV_DIR/shaders/KrigBilateral.glsl"
curl -fL 'https://github.com/bjin/mpv-prescalers/raw/b37d0f12223720f5ce48e149678162ae0a984176/vulkan/ravu-r4.hook' \
    -o "$MPV_DIR/shaders/ravu-r4.hook"
curl -fL 'https://gist.github.com/igv/36508af3ffc84410fe39761d6969be10/raw/a9e593088fb1609b0bf93d9b276d8da299b41673/SSimDownscaler.glsl' \
    -o "$MPV_DIR/shaders/SSimDownscaler.glsl"

# Plugins
curl -fL 'https://github.com/mpv-player/mpv/raw/master/TOOLS/lua/autoload.lua' \
    -o  "$MPV_DIR/scripts/autoload.lua"
curl -fL 'https://github.com/wiiaboo/mpv-scripts/raw/master/auto-profiles.lua' \
    -o  "$MPV_DIR/scripts/auto-profiles.lua"
curl -fL 'https://github.com/aidanholm/mpv-easycrop/raw/master/easycrop.lua' \
    -o  "$MPV_DIR/scripts/easycrop.lua"
curl -fL 'https://github.com/mfcc64/mpv-scripts/raw/master/visualizer.lua' \
    -o  "$MPV_DIR/scripts/visualizer.lua"
curl -fL 'https://github.com/jonniek/mpv-playlistmanager/blob/master/playlistmanager.lua' \
    -o  "$MPV_DIR/scripts/playlistmanager.lua"
