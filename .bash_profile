# Homebrew bin & sbin
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"

# Homebrew Python bullshit
export PATH="$(brew --prefix)/opt/python/libexec/bin:$PATH"
export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
. /usr/local/bin/virtualenvwrapper.sh

# Java version bullshit
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Prefer GNU utils over Apple's
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"

# MySQL client bullshit
export PATH="$(brew --prefix mysql-client)/bin:$PATH"

# Homebrew bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

# Git Bash prompt
GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_THEME=Solarized
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

if [ -f /usr/local/share/gitprompt.sh ]; then
  GIT_PROMPT_THEME=Default
  GIT_PROMPT_FETCH_REMOTE_STATUS=0
  GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0
  . /usr/local/share/gitprompt.sh
fi

# Color ls
# https://github.com/seebi/dircolors-solarized
eval `dircolors ~/.dir_colors`
export TERM=xterm-256color
alias ls="ls --color"

# Useful aliases that I like
alias ll="ls -alsh --group-directories-first"

# VICE and KickAssembler because that's how I roll
export PATH=/Applications/VICE/tools:$PATH
export CLASSPATH=/Applications/KickAssembler/KickAss.jar
