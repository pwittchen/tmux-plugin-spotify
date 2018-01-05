#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"

print_spotify_song() {
  if is_linux; then
    spotify-cli --status-short
  else
    echo "tmux-plugin-spotify works only on Linux"
  fi
}

main() {
  print_spotify_song
}

main
