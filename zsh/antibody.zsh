#!/usr/bin/env zsh

antibody() {
  case "$1" in
  bundle|update)
    while read bundle; do
      source "$bundle" 2&> /tmp/antibody-log
  done < <( ~/go/bin/antibody $@ )
    ;;
  *)
    ~/go/bin/antibody $@
    ;;
  esac
}

_antibody() {
  IFS=' ' read -A reply <<< "$(echo "bundle update list help")"
}
compctl -K _antibody antibody
