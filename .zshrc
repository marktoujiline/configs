# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/python@2/libexec/bin:$PATH"
export PATH=$PATH:$HOME/.npm/bin
export PATH=$PATH:/usr/local/lib/node_modules
export PATH="/usr/local/opt/python@2/libexec/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Env Vars
export NVM_DIR="$HOME/.nvm"
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export CLASSPATH=".:/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH"
export ZSH="/Users/mark.toujiline/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

# Core
alias c="clear"
alias v="nvim"
alias vim="nvim"
alias se="~/.ssh/config"
alias dirsize='du -smc -- * | sort -n'
alias ld="lazydocker"
alias rc="nvim ~/.zshrc"
alias src="source ~/.zshrc"
alias pidport="lsof -nP -i4TCP:$1 | grep LISTEN"
rename_ext() {
    # Rename all *.txt to *.text
    for f in *.$1; do
        mv -- "$f" "${f%.$1}.$2"
    done
}

# Git
alias g="git"
alias gblame="git log --pretty=format:"%an%x09" $1 | sort | uniq -c | sort -t ' ' -k 1 -r"
alias pr="git stash; git fetch origin pull/$1/head:pr$1; git checkout pr$1"
alias gPullAll="for i in */.git; do ( echo $i; cd $i/..; git pull; ); done"

# Python
alias venva='. venv/bin/activate'

# Scala
alias sbtd="sbt -jvm-debug 5005"
alias jad="~/Downloads/jd-cli-1.0.0.Final-dist/jd-cli"
alias decompile="scalac $1.scala && jad $1.class > $1.java"

# Antlr
grun () {
    java -Xmx500M -cp "/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH" org.antlr.v4.gui.TestRig $@
}
antlr4 () {
    java -Xmx500M -cp "/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH" org.antlr.v4.Tool $@
}


# Load Apps
ulimit -S -n 4096
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
