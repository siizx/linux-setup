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
HISTCONTROL=ignoreboth

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
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) 
        color_prompt=yes
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes 

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alh --color=auto'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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

############ My aliases and stuff #############
#(cat ~/.cache/wal/sequences &)
# Volume Controls
alias increase-volume='pactl set-sink-volume 0 +10%'
alias decrease-volume='pactl set-sink-volume 0 -10%'

# General Section
alias clear="clear && printf '\e[3J'"
alias Poff_poweroff_alias='poweroff'
alias aggiorna='sudo apt update && sudo apt upgrade -y'
alias fzfvim='vim $(fzf)'
alias copy-homeBashrc-INTO-gitBashrc='read -p "Are you sure you want to overwrite ~/git/linux-desktop/.bashrc with ~/.bashrc? (y/n): " confirm && [ "$confirm" = "y" ] && cp ~/.bashrc ~/git/linux-desktop/dotFilesHome/.bashrc'
alias copy-gitBashrc-INTO-homeBashrc='read -p "Are you sure you want to overwrite ~/.bashrc with with ~/git/linux-desktop/dotFilesHome/.bashrc? (y/n): " confirm && [ "$confirm" = "y" ] && cp ~/git/linux-desktop/dotFilesHome/.bashrc ~/.bashrc ; source ~/.bashrc'
alias brightness-py-cli='python3 ~/Documents/linux-screen-brightness-dimmer/dimmer.py'
alias brightness-py-gui='python3 ~/Documents/linux-screen-brightness-dimmer/gui-dimmer.py'
alias auto-rm-auto-cl='sudo apt autoremove && sudo apt autoclean'
alias logout-qtile='qtile cmd-obj -o cmd -f shutdown'

# Aliases for git commands

alias general-commit-push='git add . && git commit -m "general update" && git push origin master'
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gpsh='git push'
alias gpll='git pull'

export VISUAL=vim;
export EDITOR=vim;
export TERM=kitty

# Exporting paths to programs
export PATH=$PATH:/home/andrea/.local/share/JetBrains/Toolbox/apps/intellij-idea-ultimate/bin
export PATH=$PATH:/home/andrea/.local/share/JetBrains/Toolbox/apps/clion/bin
export PATH=$PATH:/home/andrea/.local/share/JetBrains/Toolbox/apps/pycharm-professional/bin
export PATH=$PATH:/home/andrea/.local/share/JetBrains/Toolbox/apps/datagrip/bin
# Enable colors in man pages
export LESS_TERMCAP_mb=$(printf '\e[1;31m')  # Begin bold (red)
export LESS_TERMCAP_md=$(printf '\e[1;35m')  # Begin blink (magenta)
export LESS_TERMCAP_me=$(printf '\e[0m')     # End bold/blink
export LESS_TERMCAP_se=$(printf '\e[0m')     # End standout-mode
export LESS_TERMCAP_so=$(printf '\e[1;33m')  # Begin standout-mode (yellow)
export LESS_TERMCAP_ue=$(printf '\e[0m')     # End underline
export LESS_TERMCAP_us=$(printf '\e[1;32m')  # Begin underline (green)
# Remove duplicates from PATH
export PATH=$(echo "$PATH" | awk -v RS=':' '!a[$1]++' | paste -sd:)
export PATH="$PATH:/sbin"

