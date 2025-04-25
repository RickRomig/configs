# aliases
alias chkcmd="type -t"	# Check if a command is alias, builtin, or file
alias check-nala='if command -v nala >/dev/null; then sudo nala update && nala list --upgradeable;else echo "Nala not installed";fi'	# check for updates with Nala
alias cleancat="grep -Ev '^(#|$)'"	# display a file, ignoring commented and blank lines
alias cls='history -w && history -c && clear'	# Clear bash history and clear screen
alias cp='cp -iv'	# interactive & verbose copy
alias cpu5="ps auxf | sort -nr -k 3 | head -5"	# top 5 CPU processes
alias dc="date +'%A %d %B %Y %R' && cal -3"	# date with 3-month calendar
alias df='df -h -x tmpfs -x fuse.portal' # ignot tmps and fuse.portal
alias dirs="dirs -v"
alias dsh-all='dsh -aM -c'	# send command to all systems using DSH
alias ff='clear;fastfetch'
alias findwifi="nmcli -f SSID,SECURITY,SIGNAL,BARS dev wifi | sed '/SSID/d;/^--/d'"	# Dectect Wi-Fi networks
alias fixjpeg="find ~/Pictures -type f -name "*.jpeg" -exec rename -v 's/.jpeg$/.jpg/i' {} \;"	# change .jpeg to .jpt in Pictures directory
alias freshclam='sudo freshclam'
alias free='free -m'	# Memory status
alias fu='~/bin/iru-fastfetch -u'	# update Fastfetch
alias getclip="xclip -selection clipboard -o"	# past clipboard to terminal
alias glow='glow -p'
# alias grep='grep --color=auto'
# alias fgrep='fgrep --color=auto'
# alias egrep='egrep --color=auto'
alias histg="history | grep " # search bash history
alias install="sudo apt install"	# install package
alias icat="kitten icat"	# display an image in the terminal
alias ip='ip -color'	# show color in ip results
alias jdate="date +'%A, %d %b %Y (%y%j)'"	# show current and Juiian date
alias kernels="dpkg -l | grep -E 'linux-headers|linux-image' | cut -d' ' -f1,3"	# list currently installed kernels
alias list-tar="tar tvf"	# list contents of a tar archive
alias list-zip="unzip -l"	# list contents of a zip archive
alias lsmount="mount | column -t"	# show mounted file systems in column format
alias mcalias="micro ~/.bash_aliases && source ~/.bash_aliases"	# Edit .bash_aliases with micro and source on exit
alias mcbash="micro ~/.bashrc && source ~/.bashrc"	# Edit .bashrc and source on exit
alias mem5="ps auxf | sort -nr -k 4 | head -5"	# top 5 processes in memory
alias motd="echo $(shuf -n 1 ~/.local/share/doc/leave.txt)"	# display a random line from leave.txt file
alias mv='mv -iv'	# interactive, verbose move
alias nanoalias="nano ~/.bash_aliases && source ~/.bash_aliases"	# Edit .bash_aliases with nano and source on exit
alias neofetch='clear;neofetch --source ~/.local/share/doc/neo-atheist.txt'	# Run Neofetch with a custom configuration and logo
alias path='echo $PATH | sed "s,:,\n,g"'	# show current exectuble paths
alias rbt='sudo reboot'
alias sba='source ~/.bash_aliases'
alias sbrc='source ~/.bashrc'
alias sc='shellcheck -x'	# Run Shellcheck ignoring SC1091 error when sourcing functionlib
alias shellcheck='shellcheck -x'	# Run Shellcheck ignoring SC1091 error when sourcing functionlib
alias sdn='sudo shutdown now'
alias setclip="xclip -o -selection clipboard"	# Copy to clipboard
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"
alias sshi='~/bin/sshin'	# call script to connect SSH via IP address
alias sshl='~/bin/sshlocal'	# call script to connect SSH via .local hostname
alias tb='nc termbin.com 9999'	# Share a file on Termbin
alias todo10="scp $HOME/.local/share/doc/todo.lst rick@192.168.0.10:.local/share/doc/"	# Send todo list to main system
alias term_size='echo "Rows=$(tput lines) Cols=$(tput cols)"'	# show size of terminal
alias txt2pdf='libreoffice --convert-to pdf'	# convert a LibreOffice .odt file to PDF
alias upgrade="sudo apt update && sudo apt dist-upgrade"	# update apt cache and install updates
alias wifipass="sudo grep -r '^psk=' /etc/NetworkManager/system-connections/ | cut -d'/' -f5 | sed 's/.nmconnection:psk=/ = /'"	# show WiFi passwords
alias yt='yt-dlp --add-metadata -ic'		# download video
alias yta='yt-dlp --add-metadata -xic'	# download audio

# alias chmod commands
alias mx='chmod a+x'
alias 000='chmod -R 000'	# no permissions
alias 440='chmod -R 440'	# r--r-----	/etc/sudoers.d/
alias 600='chmod -R 600'	# rw------- ~/.ssh/
alias 644='chmod -R 644'	# rw-r--r--
alias 664='chmod -R 664'	# rw-rw-r--
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
alias treed='tree -CAFd'	# directory tree

# git aliases
alias batdiff='bat --diff'
alias gdiff='git diff'
alias gs='git status'
alias glog='git log --graph --abbrev-commit --decorate --date=relative --all'
alias glog1='git log --oneline'
alias gpush='git push'
alias grestore='git restore'
alias gunstage='git restore --staged'

# ping aliases
alias ping='ping -c 10'								# standard ping
alias p8='ping -4 -c 8 8.8.8.8'				# ping Google DNS server
alias pho='ping -4 -c 8 127.0.0.1'		# ping home
alias pig='ping -4 -c 8 google.com'		# ping Google DNS server
alias pro='ping -4 -c 8 192.168.0.1'	# ping local gateway

# sudo aliases
alias fuck='sudo'
alias please='sudo'
alias shit='sudo'

# trash aliases (requires trash-cli)
alias trash='/usr/bin/trash-put'
alias list-trash='/usr/bin/trash-list'
alias empty-trash='/usr/bin/trash-empty'
alias rm-trash='/usr/bin/trash-rm'
restore-trash() { /usr/bin/trash-restore $1; }

# Alias Functions

# Check if a package exists
exist() {
  command -v "$1" > /dev/null && echo "$1 installed" || echo "$1 not installed"
}

inrepos() {
	pkg=$(apt-cache show "$1" 2>/dev/null | awk '/Package:/ {print $NF}')
	[[ "$pkg" ]] && echo "$1 found in repos" || echo "$1 not found in repos"
}

# return N days in the future
future() {
  echo "$1 days from now will be $(date -d "$(date +%y-%m-%d) + $1 days" +"%d %b %Y")"
}

# Kill background jobs
killjobs() {
  kill -9 $(jobs -ps)
}

# Remove backup files ending with ~ (tilde)
rm~() {
  find ./ -maxdepth 1 -type f -regex '\./.*~$' -print -exec rm {} \;
}

# cd to a directory and list contents
cdls() {
  local dir="${1:-$HOME}"
  if [[ -d "$dir" ]]; then
    cd "$dir" >/dev/null; ls -CF --group-directories-first --color=auto
  else
    echo "bash: cdls: $dir: Directory not found"
  fi
}

# Goes up a specified number of directories  (i.e. up 4)
up() {
	local d=""
	limit=$1
	for ((i = 1; i <= limit; i++)); do
		d=$d/..
	done
	d=$(echo $d | sed 's/^\///')
	if [ -z "$d" ]; then
		d=..
	fi
	cd $d
}

# copy with a progress bar
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

# Copy a file to a directory and cd to that directory
cpcd() {
  if [ -d "$2" ]; then
    cp $1 $2 && cd $2
  else
    cp $1 $2
  fi
}

# Move a file to a directory and cd to that directory
mvcd() {
  if [ -d "$2" ]; then
    mv $1 $2 && cd $2
  else
    mv $1 $2
  fi
}

# Create a directory and cd to it
mkcd() {
  mkdir -p "$1"
  cd "$1"
}

# Copy a text file to remote hosts using DSH
# $1 = filename $2 = dsh group $3 = target directory on remote host
dcp() {
	cat "$1" | dsh -g "$2" -i -c "tee $3/$(basename "$1")"
}

# Execute a command to remote hosts using DSH
# $1 = dsh group name, $2 = command (in quotes)
dsh-grp() {
	dsh -M -g $1 -c $2
}

# Execute a command to a remote server via SSH
# $1 = last octet of IP, $2= 'command' (scripts should be prefessed by bin/)
ssh-cmd() {
	ssh 192.168.0."$1" "$2"
}

# Decrypt an encrypted PDF file
decryptpdf() {
	qpdf --password="$1" --decrypt "$2".pdf --replace-input
}

# Stage a file and commit, using pre-commit hook
gcommit() {
	git status
	git add $1
	git commit -m "$1: $2" # && git push
}

# Stage all modified files, and commit using pre-commit hook
gcommitall() {
	git status
	git add -A
	git commit -m "$1" # && git push
}

# Stage a file and commit, without using pre-commit hook
ncommit() {
	git status
	git add $1
	git commit -m "$1: $2" --no-verify # && git push
}

# Stage all modified files, and commit without using pre-commit hook
ncommitall() {
	git status
	git add -A
	git commit -m "$1" --no-verify # && git push
}

# Pipe git diff into bat
# batdiff() {
#     git diff --name-only --relative --diff-filter=d | xargs bat --diff
# }

# Extract compressed files
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

cheat() {
	curl -s cheat.sh/$1 | bat
}

tsl() {
	if dpkg -l timeshift >/dev/null 2>&1; then sudo timeshift --list | awk 'NR!=1 && NR!=3'; else echo "Timeshift not installed."; fi
}

preview-file() {
	file=$(find . -type f | sort -d | fzf --reverse --preview="bat --style=full --color=always --line-range=:500 {}" --bind shift-up:preview-page-up,shift-down:preview-page-down --border=rounded)
	[[ "$file" ]] && micro "$file"
}

field() {
	awk -F "${2:- }" "{print \$${1:-1} }"
}
