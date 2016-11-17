export PATH=$PATH:/usr/local/sbin:~/bin:~/local/bin:~/.yarn/bin

# Set Flex SDK Home
export FLEX_SDK_HOME=~/bin/flex_sdk_4.6

# Set Git Home
export GIT_HOME=/usr/local/git

# Set EC2 Home
export EC2_HOME=/usr/local/ec2/ec2-api-tools-1.7.5.1

# Add to PATH
export PATH=$PATH:$FLEX_SDK_HOME/bin:$GIT_HOME/bin:$EC2_HOME/bin

# Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1

# Set colors to match iTerm2 Terminal Colors
export TERM=screen-256color-bce

# Default editor
export EDITOR=emacs

# Git branch in prompt.
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

GREEN='\[\033[0;32m\]'

export PS1="\u \W:$GREEN\$(parse_git_branch)\[\033[00m\] $ "

source ~/.aliases
source ~/Dropbox/dotfiles/.servers
source ~/Dropbox/dotfiles/.environment_variables

# Sourcing NVM
source ~/.nvm/nvm.sh
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Sourcing JAVA ENV
eval "$(jenv init -)"

# Set Java Home
export JAVA_HOME=$(/usr/libexec/java_home)

export ANDROID_HOME=/usr/local/opt/android-sdk

# Set Kubernetes provider
export KUBERNETES_PROVIDER=aws;

# Set AWS profile for Kubernetes
export AWS_DEFAULT_PROFILE=mattoconnell

# git auto complete
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# start docker
# eval $(docker-machine env default)
