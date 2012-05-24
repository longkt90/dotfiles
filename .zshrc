# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rails3 ruby bundler heroku vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin/:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/java/jdk1.6.0_20/bin:/usr/local/ant/bin:/opt/java/jre/bin:/usr/lib/perl5/vendor_perl/bin:/usr/lib/perl5/core_perl/bin:/opt/qt/bin:/home/ti/.rvm/bin:/home/ti/elasticsearch-0.19.4/bin:/usr/bin/vendor_perl/
export TERM=xterm-256color

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
cdpath=(. $HOME/code $HOME/fun )
gvim()
{
  (unset GEM_PATH GEM_HOME; command gvim "$@")
}
