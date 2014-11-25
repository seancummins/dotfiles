# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="agnoster"
ZSH_THEME="sporty_256"
#ZSH_THEME="re5et"
if [[ "$CONQUE" == 1 ]]; then
    ZSH_THEME="ys"
fi

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-monokai.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

###### Sean's personal settings

# Zsh stuff
set -o vi
setopt interactivecomments
export PIP_REQUIRE_VIRTUALENV=true

if [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac stuff
	alias ls='gls -Fc --color=tty'
	eval `gdircolors -b ~/git/solarized/dircolors-solarized/dircolors.256dark`
	export DOCKER_TLS_VERIFY=1
	export DOCKER_HOST=tcp://192.168.0.10:2376
	export DOCKER_CERT_PATH=/Users/cummis/.boot2docker/certs/boot2docker-vm
	
	alias se8='docker start se8 && docker attach se8'
	alias se76='docker start se76 && docker attach se76'
	alias se74='docker start se74 && docker attach se74'
    alias symcli='cd ~/Projects/docker/symcli && vagrant ssh'

	alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
    alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
    alias vi='vim'

    . `brew --prefix`/etc/profile.d/z.sh
else
    # Linux stuff
	alias ls='ls -Fc --color=tty'
	eval `dircolors -b ~/git/solarized/dircolors-solarized/dircolors.256dark`
fi
alias h='history'
export PATH=$PATH:/opt/emc/SYMCLI/bin
bindkey '^R' history-incremental-search-backward
source ~/.oh-my-zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
