#  __  __            __       _   _      _
# |  \/  | ___  ___ / _| __ _| \ | | ___| |_   Richard B. Romig
# | |\/| |/ _ \/ __| |_ / _` |  \| |/ _ \ __|  rick.romig@gmail.com
# | |  | | (_) \__ \  _| (_| | |\  |  __/ |_   rick.romig@mymetronet.net
# |_|  |_|\___/|___/_|  \__,_|_| \_|\___|\__|  https://ricktech.wordpress.com/

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
	*i*) ;;
	*) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
#HISTCONTROL=ignoreboth
HISTCONTROL=erasedups:ignorespace

# set format for time in bash history
HISTTIMEFORMAT="%Y-%m-%d %T "

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

# Set bat/batcat as manpager
if [[ -x /usr/bin/bat ]]; then
	export MANPAGER="sh -c 'col -bx | /usr/bin/bat -l man -p'"
	export MANROFFOPT="-c"
elif [[ -x /usr/bin/batcat ]]; then
	export MANPAGER="sh -c 'col -bx | /usr/bin/batcat -l man -p'"
	export MANROFFOPT="-c"
fi

# set variable identifying the chroot you work in (used in the prompt below)
if [[ -z "${debian_chroot:-}" ]] && [[ -r /etc/debian_chroot ]]; then
	debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	xterm|xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [[ -n "$force_color_prompt" ]]; then
	if [[ -x /usr/bin/tput ]] && tput setaf 1 >&/dev/null; then
		# We have color support; assume it's compliant with Ecma-48
		# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
		# a case would tend to support setf rather than setaf.)
		color_prompt=yes
	else
		color_prompt=
 	fi
fi

# parse git branch in prompt
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

if [[ "$color_prompt" = yes ]]; then
	if [[ ${EUID} == 0 ]] ; then
		PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[01;34m\] \w\n\$\[\033[00m\] '
	else
		# Custom prompt
		BRACKET_COLOR="\[\033[38;5;35m\]"
		CLOCK_COLOR="\[\033[38;5;35m\]"
		JOB_COLOR="\[\033[38;5;33m\]"
		PATH_COLOR="\[\033[38;5;33m\]"
		GIT_COLOR="\[\033[38;5;37m\]"
		LINE_BOTTOM="\342\224\200"
		LINE_BOTTOM_CORNER="\342\224\224"
		LINE_COLOR="\[\033[38;5;248m\]"
		LINE_STRAIGHT="\342\224\200"
		LINE_UPPER_CORNER="\342\224\214"
		END_CHARACTER="|"

		[[ "$SSH_CLIENT" ]] && ssh_msg=" (SSH)"
		tty -s && export PS1="$LINE_COLOR$LINE_UPPER_CORNER$LINE_STRAIGHT$LINE_STRAIGHT$BRACKET_COLOR[$CLOCK_COLOR\t$BRACKET_COLOR]$LINE_COLOR$LINE_STRAIGHT$BRACKET_COLOR[$JOB_COLOR\j$BRACKET_COLOR]$LINE_COLOR$LINE_STRAIGHT$BRACKET_COLOR[\H${ssh_msg}:\]$PATH_COLOR\w$GIT_COLOR\$(parse_git_branch)$BRACKET_COLOR]\n$LINE_COLOR$LINE_BOTTOM_CORNER$LINE_STRAIGHT$LINE_BOTTOM$END_CHARACTER\[$(tput sgr0)\] "
	fi
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h \w \$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
	xterm*|rxvt*)
		PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h \w\a\]$PS1"
		;;
	*)
		;;
esac

# enable color support of ls and also add handy aliases
if [[ -x /usr/bin/dircolors ]]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls -F --color=auto --group-directories-first'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alhF --time-style=long-iso'
alias la='ls -AF'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases

# Alias ssh if terminal is kitty
[[ "$TERM" == "xterm-kitty" ]] && alias ssh="kitty +kitten ssh"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Disable XON/XOFF flow control (that is, Ctrl-S/Ctrl-Q). May be negated.
stty -ixon

# XDG_STATE_HOME directory
[[ -d ~/.local/state ]] || mkdir -p ~/.local/state

# Run mint fortunes if installed
# if [ -x /usr/bin/mint-fortune ]; then
# 	/usr/bin/mint-fortune
# fi

# Fuzzy finder key-bindings
[[ -x /usr/bin/fzf ]] && source /usr/share/doc/fzf/examples/key-bindings.bash

# Fastfetch
if [[ -x /usr/bin/fastfetch ]]; then
	/usr/bin/fastfetch
elif [[ -f "$HOME/.local/share/doc/mosfanet.txt" ]]; then
	cat "$HOME/.local/share/doc/mosfanet.txt"
fi

[[ -f ~/.local/share/doc/leave.txt ]] && printf "\e[93mMOTD: \e[0m%s\n\n" "$(shuf -n 1 ~/.local/share/doc/leave.txt)"
