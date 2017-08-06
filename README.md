# tmux-plugin-spotify
tmux plugin displaying currently played song on Spotify

**Note**: currently it works only on Linux!

Requirements
------------

In order to use this plugin, you need to install [spotify-cli-linux](https://github.com/pwittchen/spotify-cli-linux) program.

You can to it with the following command:

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/pwittchen/spotify-cli-linux/master/install.sh)"
```

Installation
------------
### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

```
set -g @plugin 'pwittchen/tmux-plugin-spotify'
```

Hit `prefix + I` to fetch the plugin and source it.

If format strings are added to `status-right`, they should now be visible.

Usage
-----

In order to see currently played Spotify song via this tmux plugin, add the following command to your `.tmux.conf` file:

```
#{spotify_song}
```

References
----------
- https://github.com/tmux-plugins
- https://github.com/tmux-plugins/tmux-example-plugin
- https://github.com/tmux-plugins/tmux-battery
- https://github.com/pwittchen/dotfiles
- https://github.com/pwittchen/spotify-cli-linux
