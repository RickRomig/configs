# aliases
alias bconf='micro ~/.bashrc; source ~/.bashrc'
alias checkcommand="type -t"
alias check-nala='if command -v nala >/dev/null; then sudo nala update && nala list --upgradeable;else echo "Nala not installed";fi'
alias cleancat="grep -Ev '^(#|$)'"
alias cls='history -w && history -c && clear'
alias cp='cp -iv'
alias cpu5="ps auxf | sort -nr -k 3 | head -5"
alias dc="date +'%A %d %B %Y %R' && cal -3"
alias df='df -h -x tmpfs -x fuse.portal'
alias dirs="dirs -v"
alias dsh-all='dsh -aM -c'
alias findwifi="nmcli -f SSID,SECURITY,SIGNAL,BARS dev wifi | sed '/SSID/d;/^--/d'"
alias fixjpeg="find ~/Pictures -type f -name "*.jpeg" -exec rename -v 's/.jpeg$/.jpg/i' {} \;"
alias freshclam='sudo freshclam'
alias free='free -m'
alias glow='glow -p'
# alias grep='grep --color=auto'
# alias fgrep='fgrep --color=auto'
# alias egrep='egrep --color=auto'
alias histg="history | grep " # search bash history
alias install="sudo apt install"
alias inrepo="apt-cache show"
alias ip='ip -color'
alias jdate="date +'%y%j'"
alias lsmount="mount | column -t"
alias m='micro'
alias mcalias='micro ~/.bash_aliases; source ~/.bash_aliases'
alias mem5="ps auxf | sort -nr -k 4 | head -5"
alias modalias='nano ~/.bash_aliases; rm ~/.bash_aliases~; source ~/.bash_aliases'
alias motd="echo $(shuf -n 1 ~/.local/share/doc/leave.txt)"
alias mv='mv -iv'
alias neofetch='neofetch --source ~/.local/share/doc/neo-atheist.txt'
alias path='echo $PATH | sed "s,:,\n,g"'
alias rbt='sudo reboot'
alias sba='source ~/.bash_aliases'
alias sbrc='source ~/.bashrc'
alias sc='shellcheck -x'
alias shellcheck='shellcheck -x'
alias sdn='sudo shutdown now'
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"
alias tb='nc termbin.com 9999'
alias todo10="scp $HOME/.local/share/doc/todo.lst rick@192.168.0.10:.local/share/doc/"
alias term_size='echo "Rows=$(tput lines) Cols=$(tput cols)"'
alias tsl="sudo timeshift --list | awk 'NR!=1 && NR!=3'"
alias txt2pdf='libreoffice --convert-to pdf'
alias upgrade="sudo apt update && sudo apt dist-upgrade"
alias wifipass="sudo grep -r '^psk=' /etc/NetworkManager/system-connections/ | cut -d'/' -f5 | sed 's/.nmconnection:psk=/ = /'"
alias yt='yt-dlp --add-metadata -ic'
alias yta='yt-dlp --add-metadata -xic'

# alias chmod commands
alias mx='chmod a+x'
alias 000='chmod -R 000'	# no permissions
alias 644='chmod -R 644'	# rw-r--r--
alias 666='chmod -R 666'	# rw-rw-rw-
alias 755='chmod -R 755'	# rwxr-xr-x
alias 777='chmod -R 777'	# rwxrwxrwx

# file aliases
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
# alias l='ls -CF'	# columns and append */=>@|
# alias la='la -AF'	# all but without implied . and ..
# alias ll='ls -alF'	# all, long listing, append */=>@|
# alias ls='ls --color=auto --group-directories-first'
alias lsl='ls -lhF --time-style=long-iso'	# long listing, human readable
alias lsal='ls -AlhF --time-style=long-iso'	#all, long listing, human readable
alias lsr='ls -RF'	# list recursively
alias lst='ls -trF'	# list by time, oldest first
alias lslt='ls -lhtrF --time-style=long-iso'	# list by time, oldest first
alias lf="ls -l | egrep -v '^d'"  # files only (not hidden)
alias ldir="ls -l | egrep '^d'"   # directories only (not hidden)
alias mkdir="mkdir -p"
alias mkd='mkdir -pv'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'

# git aliases
alias glog='git log --graph --abbrev-commit --decorate --date=relative --all'
alias gpush='git push'
alias grestore='git restore'
alias gunstage='git restore --staged'

# ping aliases
alias ping='ping -c 10'
alias p8='ping -4 -c 8 8.8.8.8'
alias pho='ping -4 -c 8 127.0.0.1'
alias pig='ping -4 -c 8 google.com'
alias pro='ping -4 -c 8 192.168.0.1'

# sudo aliases
alias fuck='sudo'
alias please='sudo'
alias shit='sudo'

# trash aliases
alias trash='gio trash'
# alias list-trash='gio trash --list'
alias list-trash='gio list trash://'
alias empty-trash='gio trash --empty'
restore-trash() { gio trash --restore trash:///$1; }

# Alias Functions
exist() {
  command -v "$1" > /dev/null && echo "$1 installed" || echo "$1 not installed"
}

future() {
  echo "$1 days from now will be $(date -d "$(date +%y-%m-%d) + $1 days" +"%d %b %Y")"
}

killjobs() {
  kill -9 $(jobs -ps)
}

rm~() {
  find ./ -maxdepth 1 -type f -regex '\./.*~$' -print -exec rm {} \;
}

cdls() {
  local dir="${1:-$HOME}"
  if [[ -d "$dir" ]]; then
     cd "$dir" >/dev/null; ls -CF --group-directories-first --color=auto
  else
     echo "bash: cdls: $dir: Directory not found"
  fi
}

cpp() {
	set -e
	strace -q -ewrite cp -- "${1}" "${2}" 2>&1 |
		awk '{
	count += $NF
	if (count % 10 == 0) {
		percent = count / total_size * 100
		printf "%3d%% [", percent
		for (i=0;i<=percent;i++)
			printf "="
			printf ">"
			for (i=percent;i<100;i++)
				printf " "
				printf "]\r"
			}
		}
	END { print "" }' total_size="$(stat -c '%s' "${1}")" count=0
}

cpcd() {
  if [ -d "$2" ]; then
    cp $1 $2 && cd $2
  else
    cp $1 $2
  fi
}

mvcd() {
  if [ -d "$2" ]; then
    mv $1 $2 && cd $2
  else
    mv $1 $2
  fi
}

mkcd() {
  mkdir -p "$1"
  cd "$1"
}

dcp() {
	cat "$1" | dsh -g "$2" -i -c "tee $3/$(basename "$1")"
}

dsh-grp() {
	dsh -M -g $1 -c $2
}

decryptpdf() {
	qpdf --password="$1" --decrypt "$2".pdf --replace-input
}

gcommit() {
	git status
	git add $1
	git commit -m "$1 - $2"
}

gcommitall() {
	git status
	git add -A
	git commit -m "$1"
}

ncommit() {
	git status
	git add $1
	git commit -m "$1 - $2" --no-verify
}

ncommitall() {
	git status
	git add -A
	git commit -m "$1" --no-verify
}

ex() {
  if [ -f $1 ]; then
    case $1 in
      *.tar.bz )    tar xjf $1  ;;
      *.tar.gz )    tar xzf $1  ;;
      *.bz2 )       bunzip2 $1  ;;
      *.rar )       unrar  $1   ;;
      *.gz )        gunzip $1   ;;
      *.tar )       tar xf $1   ;;
      *.tbz2 )      tar xjf $1  ;;
      *.tgz )       tar xzf $1  ;;
      *.zip )       unzip $1    ;;
      *.Z )         uncompress $1 ;;
      *.7z )        7z x $1     ;;
      *.deb )       ar x $1     ;;
      *.tar.xz )    tar xf $1   ;;
      *.tar.zst )   unzstd $1   ;;
      * )           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file."
  fi
}

# bat help wrapper (requires bat)
alias bathelp='bat --plain --language=help'
help() {
	"$@" --help 2>&1 | bathelp
}
