# aliases
alias dc="date +'%A %d %B %Y %R' && cal -3"
alias df='df -h -x tmpfs -x fuse.portal'
alias free='free -m'
alias cls='history -w && history -c && clear'
alias cpu5="ps auxf | sort -nr -k 3 | head -5"
alias fixjpeg="find ~/Pictures -type f -name "*.jpeg" -exec rename -v 's/.jpeg$/.jpg/i' {} \;"
alias glow='glow -p'
alias install="sudo apt install"
alias lsmount="mount | column -t"
alias mem5="ps auxf | sort -nr -k 4 | head -5"
alias mcalias='micro ~/.bash_aliases'
alias modalias='nano ~/.bash_aliases; rm ~/.bash_aliases~'
alias path='echo $PATH | sed "s,:,\n,g"'
alias rbt='sudo reboot'
alias sba='source ~/.bash_aliases'
alias sbrc='source ~/.bashrc'
alias sc='shellcheck -x --exclude=SC1001,SC2001'
alias shellcheck='shellcheck -x --exclude=SC1001,SC2001'
alias sdn='sudo shutdown now'
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"
alias tb='nc termbin.com 9999'
alias tsl="sudo timeshift --list | awk 'NR!=1 && NR!=3'"
alias txt2pdf='libreoffice --convert-to pdf'
alias upgrade="sudo apt update && sudo apt dist-upgrade"
alias yt='youtube-dl --add-metadata -ic'
alias yta='youtube-dl --add-metadata -xic'

# file aliases
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias copy='cp -vi'
# alias grep='grep --color=auto'
# alias fgrep='fgrep --color=auto'
# alias egrep='egrep --color=auto'
alias lsf='ls -F'
alias lsl='ls -lhF'
alias lsal='ls -AlhF'
alias lsa='ls -AF'
alias lsd='ls -d .*/ */'
alias lsr='ls -RF'
alias lst='ls -trF'
alias lslt='ls -lhtrF'
# alias ls='ls --color=auto --group-directories-first'
# alias ll='ls -alF'
# alias la='ls -A'
# alias l='ls -CF'
alias mkd='mkdir -pv'
alias move='mv -vi'

# git aliases
alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
alias gcm="git commit -m"
alias gcam="git commit -a -m"
alias gs="git status"
alias gr="git rm"
alias gl="git log"
alias gm="git mv"
alias gpbm="git push bashscripts master"
alias gpfm="git push FnLoC master"
alias gpom="git push origin master"
alias graph="git log --all --decorate --oneline --graph"

# ping aliases
alias p8='ping -4 -c 8 8.8.8.8'
alias pho='ping -4 -c 8 127.0.0.1'
alias pig='ping -4 -c 8 google.com'
alias pro='ping -4 -c 8 192.168.0.1'

# sudo aliases
alias fuck='sudo'
alias please='sudo'
alias shit='sudo'

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
  local dir="$1"
  local dir="${dir:=$HOME}"
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

ex ()
{
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

cdup() {
	local d=""
	local limit="$1"
	# Default to limit of 1
	if [[ -z "$limit" || "$limit" -le 0 ]]; then
		limit=1
	fi

	for (( i=1;i<=limit;i++ )); do
		d="../$d"
	done

	# Perform cd. Show error if cd fails.
	if ! cd "$d"; then
		echo "Couldn't go up $limit directories."
	fi
}

overview() {
    du -h --max-depth=1 | sed -r '
    $d; s/^([.0-9]+[KMGPTEZ]\t)\.\//\1/
    ' | sort -hr | column
}
