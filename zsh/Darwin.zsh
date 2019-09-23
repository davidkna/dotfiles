#!/usr/bin/env zsh

export PATH="$PATH:/usr/local/sbin"

if brew command command-not-found-init > /dev/null 2>&1; then eval "$(brew command-not-found-init)"; fi
