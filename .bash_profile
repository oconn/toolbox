export PATH=$PATH:/usr/local/sbin:~/bin:~/local/bin
export PATH="/usr/local/git/bin:$PATH"

# Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-256color

# Default editor
export EDITOR='vim'

# Git branch in prompt.
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

GREEN='\[\033[0;32m\]'

export PS1="\u \W:$GREEN\$(parse_git_branch)\[\033[00m\] $ "

source ~/.aliases
source ~/.servers
source ~/.environment_variables

# Sourcing NVM & RVM
source ~/.nvm/nvm.sh
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
