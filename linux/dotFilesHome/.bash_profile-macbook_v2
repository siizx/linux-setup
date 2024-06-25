
eval "$(/opt/homebrew/bin/brew shellenv)"

# for Brew
export PATH="/usr/local/bin:$PATH"
# Hides the default login message
export BASH_SILENCE_DEPRECATION_WARNING=1
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac
# Enable colors in bash
export CLICOLOR=1
export LSCOLORS=GxBxCxDxexegedabagaced
 
# get current git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# find username@hostname:$ 
export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[0;32m\]\$(parse_git_branch)\[\033[00m\]\$ "

# for bash completion
export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d"
[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"




test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


############ My aliases and stuff #############


    alias ls='ls --color=auto'
	alias ll='ls -alh --color=auto'

# General Section
alias Poff_poweroff_alias='poweroff'
alias g++='/opt/homebrew/bin/g++-14'

# Aliases for git commands

alias general-commit-push='git add . && git commit -m "general update" && git push origin master'
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gpsh='git push'
alias gpll='git pull'

