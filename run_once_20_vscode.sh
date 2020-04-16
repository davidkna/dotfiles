#!/usr/bin/env bash

set -eux

if  [[ ! -x "$(command -v code)" ]]; then
    exit 0
fi

code --install-extension eamodio.gitlens
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension James-Yu.latex-workshop
code --install-extension ms-azuretools.vscode-docker
code --install-extension MS-CEINTL.vscode-language-pack-de
code --install-extension ms-python.python
code --install-extension ms-vscode.cpptools
code --install-extension ms-vscode.Go
code --install-extension redhat.vscode-yaml
code --install-extension redhat.vscode-xml
code --install-extension rust-lang.rust
code --install-extension VisualStudioExptTeam.vscodeintellicode