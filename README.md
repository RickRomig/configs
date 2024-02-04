# configs

## My configuration files

### Notes

**.inputrc**
```bash
# Prettyfi
set colored-stats On
set colored-completion-prefix On

# Completion settings
set show-all-if-ambiguous on
set completion-ignore-case on
set completion-display-width 0
set completion-query-items 1000

# ^C no longer shows on C-c keypress
set echo-control-characters off

# Command history search - partial search term up & down arrows
"\e[A": history-search-backward
"\e[B": history-search-forward

# Move forward/backward by word with arrow keys
"\e[1;5D": backward-word
"\e[1;5C": forward-word


# Bash Keybindings
# ctrl+f cd to ~/.config
"\C-f":"cd /home/rick/.config/"
# ctrl+b cd up one directory (with return)
"\C-b":"cd ..\n"
# ctrl+h cd to home directory
"\C-h":"cd ~\n"
# Prepend sudo using alt+s
"\es": "\C-asudo \C-e"
```
