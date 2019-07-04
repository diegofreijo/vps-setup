# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export ZSH_TMUX_AUTOSTART='true'

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="alanpeabody"

# AutoJump
. /usr/share/autojump/autojump.sh

# Go
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

# Snap
export PATH=$PATH:/snap/bin

# dotnet
# export PATH=$PATH:$HOME/.dotnet/tools
# export PATH=$PATH:$HOME/Projects/scripts

# alias recon.sh=~/Tools/recon.sh/recon.sh

# Ruby
# export PATH="/usr/local/opt/ruby/bin:$PATH"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git tmux)

# User configuration

#export PATH=$PATH:"/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


# Aliases
alias l='ls -lh'
alias ll='ls -lha'
alias ..='cd ..'

alias g='git add . && git commit'
alias gs='git status'
alias gp='git add . && git commit && git push --all'

export EDITOR='vi'
