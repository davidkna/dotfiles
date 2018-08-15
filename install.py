#!/usr/bin/env python3
import json
import os
import subprocess
import sys

os.umask(0o077)

dotfile_home = os.path.dirname(os.path.realpath(sys.argv[0]))

file = open('dotfiles.conf.json', 'r')
config = json.load(file)
file.close()

def fix_path(path):
    path = os.path.expanduser(path)
    path = os.path.expandvars(path)
    path = os.path.join(dotfile_home, path)
    path = os.path.normpath(path)
    return path

for target, source in config["link"].items():
    print("Linking", source, "→", target)
    source, target = fix_path(source), fix_path(target)
    target_dirname = os.path.dirname(target)
    if os.path.islink(target) or os.path.isfile(target):
        os.remove(target)
    elif not os.path.isdir(target_dirname):
        os.makedirs(target_dirname)
    os.symlink(source, target)


for i in config["shell"]:
    command = i["command"]
    description = i["description"]
    print(description + ':', command)
    subprocess.call(command, shell=True)
