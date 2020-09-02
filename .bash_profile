# Homebrew bin & sbin
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"

# Homebrew Python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Homebrew - prefer GNU utils over Apple's
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Homebrew bash completion
source /usr/local/etc/bash_completion

# Git Bash prompt
# https://github.com/magicmonty/bash-git-prompt
__GIT_PROMPT_DIR=/usr/local/opt/bash-git-prompt/share
GIT_PROMPT_THEME=Solarized
GIT_PROMPT_ONLY_IN_REPO=1
GIT_PROMPT_FETCH_REMOTE_STATUS=0
GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0
source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"

# Color ls
# https://github.com/seebi/dircolors-solarized
eval `dircolors ~/.dir_colors`
export TERM=xterm-256color
alias ls="ls --color"

# Useful aliases that I like
alias ll="ls -alsh --group-directories-first"
alias venv="python3 -m venv"

# Apple, sometimes... <shakes head>, *sigh*... nevermind
export BASH_SILENCE_DEPRECATION_WARNING=1

# OktaAWSCLI
if [ -f "/Users/jcook/.okta/bash_functions" ]; then
    . "/Users/jcook/.okta/bash_functions"
fi

