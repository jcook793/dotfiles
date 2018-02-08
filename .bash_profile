# Homebrew sbin
export PATH="/usr/local/sbin:$PATH"

# Homebrew Python bullshit
export PATH="$(brew --prefix)/opt/python/libexec/bin:$PATH"

# Prefer GNU utils over Apple's
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Chromium depot tools, used for Pdfium hack week project
export PATH=/Users/jcook/dotloop/hack-week-2017-03/depot_tools:"$PATH"

# Curl
export PATH="/usr/local/opt/curl/bin:$PATH"

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
  . /usr/local/share/gitprompt.sh
fi

# Color ls
# https://github.com/seebi/dircolors-solarized
eval `dircolors ~/.dir_colors`
export TERM=xterm-256color
alias ls="ls --color"

# Ansible using cowsay is cute but quickly gets annoying
export ANSIBLE_NOCOWS=1

# Useful aliases that I like
alias ll="ls -alsh --group-directories-first"

# VICE C64 emulator because that's how I roll
export PATH=/Applications/VICE/tools:$PATH

# KickAssembler because 6510 all day erry day
export CLASSPATH=/Users/jcook/kickassembler/KickAss.jar

# The best way to start any terminal session
# cowsay $(fortune -a) | lolcat

