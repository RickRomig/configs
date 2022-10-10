# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

PATH="/usr/games:$PATH"
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# Set default editor
if [ -x /usr/bin/micro ]; then
  export EDITOR="/usr/bin/micro"
  export VISUAL="/usr/bin/micro"
  export SUDO_EDITOR="/usr/bin/micro"
else
  export EDITOR="/usr/bin/nano"
  export VISUAL="/usr/bin/nano"
  export SUDO_EDITOR="/usr/bin/nano"
fi

 # Set XDG Environment variables
 export XDG_DATA_HOME="$HOME/.local/share"
 export XDG_CONFIG_HOME="$HOME/.config"
 export XDG_STATE_HOME="$HOME/.local/state"
 export XDG_CACHE_HOME="$HOME/.cache"

# Set application specific environmental variables
export ATOM_HOME="$XDG_DATA_HOME/atom"
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
