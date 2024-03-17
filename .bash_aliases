# aliases
alias bconf='micro ~/.bashrc'
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
alias free='free -m'
alias glog='git log --graph --abbrev-commit --decorate --date=relative --all'
alias gpush='git push'
alias grestore='git restore'
alias gunstage='git restore --staged'
alias glow='glow -p'
alias histg="history | grep"
alias install="sudo apt install"
alias inrepo="apt-cache show"
alias ip='ip -color'
alias lsmount="mount | column -t"
alias m='micro'
alias mcalias='micro ~/.bash_aliases; source ~/.bash_aliases'
alias mem5="ps auxf | sort -nr -k 4 | head -5"
alias mkdir='mkdir-ip'
alias modalias='nano ~/.bash_aliases; rm ~/.bash_aliases~; source ~/.bash_aliases'
alias motd='echo "$(shuf -n 1 ~/.local/share/doc/leave.txt)"'
alias mv='mv -iv'
alias neofetch='neofetch --source ~/.local/share/doc/neo-atheist.txt'
alias path='echo $PATH | sed "s,:,\n,g"'
alias rbt='sudo reboot'
alias sba='source ~/.bash_aliases'
alias sbrc='source ~/.bashrc'
alias sc='shellcheck -x --exclude=SC1001,SC2001'
alias shellcheck='shellcheck -x --exclude=SC1001,SC2001'
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

# file aliases
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias copy='cp -vi'
# alias grep='grep --color=auto'
# alias fgrep='fgrep --color=auto'
# alias egrep='egrep --color=auto'
alias lsl='ls -lhF --time-style=long-iso'
alias lsal='ls -AlhF --time-style=long-iso'
alias lsd='ls -d .*/ */'
alias lsr='ls -RF'
alias lst='ls -trF'
alias lslt='ls -lhtrF --time-style=long-iso'
# alias ls='ls --color=auto --group-directories-first'
# alias ll='ls -alF'
# alias la='ls -A'
# alias l='ls -CF'
alias mkdir="mkdir -p"
alias mkd='mkdir -pv'
alias move='mv -vi'

# ping aliases
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
  mkdir -p -- "$1" && cd -P -- "$1"
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
