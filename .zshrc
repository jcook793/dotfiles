# Homebrew bin & sbin
export PATH="/opt/homebrew/sbin:/usr/local/bin:$PATH"

# Homebrew Python
export PATH="/opt/homebrew/opt/python/libexec/bin:$PATH"

# Homebrew - prefer GNU utils over Apple's
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
export MANPATH="/opt/homebrew/opt/coreutils/libexec/gnuman:$MANPATH"

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
plugins=(git docker docker-compose zsh-dircolors-solarized zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Aliases
alias ll="ls -Alshp --group-directories-first --color"

# Show a nice archey screen - use "--ofline" if you're stuck with some OpenDNS BS
archey
