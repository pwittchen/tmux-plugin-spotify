#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/scripts/helpers.sh"

spotify_status="#($CURRENT_DIR/scripts/spotify_status.sh)"
spotify_status_interpolation="\#{spotify_status}"

spotify_status_full="#($CURRENT_DIR/scripts/spotify_status_full.sh)"
spotify_status_full_interpolation="\#{spotify_status_full}"

spotify_song="#($CURRENT_DIR/scripts/spotify_song.sh)"
spotify_song_interpolation="\#{spotify_song}"

spotify_artist="#($CURRENT_DIR/scripts/spotify_artist.sh)"
spotify_artist_interpolation="\#{spotify_artist}"

spotify_album="#($CURRENT_DIR/scripts/spotify_album.sh)"
spotify_album_interpolation="\#{spotify_album}"

spotify_playback="#($CURRENT_DIR/scripts/spotify_playback.sh)"
spotify_playback_interpolation="\#{spotify_playback}"

set_tmux_option() {
  local option="$1"
  local value="$2"
  tmux set-option -gq "$option" "$value"
}

do_interpolation() {
  local string=$1
  local string=${string/$spotify_status_interpolation/$spotify_status}
  local string=${string/$spotify_status_full_interpolation/$spotify_status_full}
  local string=${string/$spotify_song_interpolation/$spotify_song}
  local string=${string/$spotify_artist_interpolation/$spotify_artist}
  local string=${string/$spotify_album_interpolation/$spotify_album}
  local string=${string/$spotify_playback_interpolation/$spotify_playback}
  echo "$string"
}

update_tmux_option() {
  local option="$1"
  local option_value="$(get_tmux_option "$option")"
  local new_option_value="$(do_interpolation "$option_value")"
  set_tmux_option "$option" "$new_option_value"
}

main() {
  update_tmux_option "status-right"
  update_tmux_option "status-left"
}

main
