# Homebrew bin & sbin
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"

# Homebrew Python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# If pyenv is installed, have it control Python settings
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Homebrew Java
export JAVA_HOME=$(/usr/libexec/java_home -v17)
export PATH="${JAVA_HOME}/bin:$PATH"

# Homebrew - prefer GNU utils over Apple's
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# nvm stuff
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# Vice for retro development
export PATH="/Applications/Vice/bin:$PATH"

# Any other crap I might accumulate
export PATH="/Users/jcook/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/Users/jcook/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="cobalt2"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  docker
  docker-compose
  zsh-dircolors-solarized
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Aliases
alias ll="ls -Alshp --group-directories-first --color"

# Show a nice archey screen - use "--offline" if you're stuck with some OpenDNS BS
archey --offline
