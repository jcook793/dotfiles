#!/bin/bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


#
# Symlinks a list of files from the dotfiles directory to $HOME
#
writeSymlinks() {
	for filename in "$@"; do
		echo -n "  "
		ln -sfv "${DOTFILES_DIR}/${filename}" "${HOME}"
	done
}

#
# Sets an NSGlobalDomain value with some feedback
#   $1 = the key you are setting
#   $2 = the type (int, bool, etc.)
#   $3 = the value (you can provide more values for arrays)
#
setGlobalDefault() {
	key=${1}
	keyType=${2}
	value=${@:3}

	if [ "${keyType}" == "array" ]; then  # I am punting on arrays
		echo "  Setting ${key} to ${value}"
		defaults write NSGlobalDomain ${key} -${keyType} ${value}
	else
		currvalue=$(defaults read NSGlobalDomain ${1})

		if [ "${currvalue}" == "${value}" ]; then
			echo "  ${key} is already ${currvalue}, not changing"
		else
			echo "  Changing ${key} from ${currvalue} to ${value}"
			defaults write NSGlobalDomain ${key} -${keyType} ${value}
		fi
	fi
}


#
# Symlinks
#
echo "Writing symlinks"
writeSymlinks .bash_profile .dir_colors .gitignore_global .vice .vimrc Brewfile

if [ -d "${HOME}/Library/Application Support/Sublime Text 3/Packages/User" ]; then
    echo "Found Sublime Text 3 user folder, not overwriting"
else
    mkdir -p "${HOME}/Library/Application Support/Sublime Text 3/Packages"
    ln -sfv "$(pwd)/sublime/" "${HOME}/Library/Application Support/Sublime Text 3/Packages/User"
fi


#
# Some OS preferences
#
echo -e "\nSetting macOS NSGlobalDomain values"
setGlobalDefault AppleEnableSwipeNavigateWithScrolls int 0
setGlobalDefault AppleInterfaceStyle string Dark
setGlobalDefault InitialKeyRepeat int 25
setGlobalDefault KeyRepeat int 2
setGlobalDefault NSAutomaticCapitalizationEnabled int 0
setGlobalDefault NSAutomaticDashSubstitutionEnabled int 0
setGlobalDefault NSAutomaticPeriodSubstitutionEnabled int 0
setGlobalDefault NSAutomaticQuoteSubstitutionEnabled int 0
setGlobalDefault NSAutomaticSpellingCorrectionEnabled int 0
setGlobalDefault NSAutomaticTextCompletionEnabled int 0
setGlobalDefault WebAutomaticSpellingCorrectionEnabled int 0
setGlobalDefault NSUserQuotesArray array '"\""' '"\""' '"'\''"' '"'\''"'
setGlobalDefault com.apple.mouse.scaling float 1.5
setGlobalDefault com.apple.trackpad.forceClick int 0

#
# Power management stuff
#
# Don't sleep when hooked to a charger
sudo pmset -c sleep 0

#
# ssh
#
mkdir -p "${HOME}/.ssh"
chmod 700 "${HOME}/.ssh"

#
# Global .gitignore
#
echo -e "\nCreating global .gitignore"
git config --global core.excludesfile "${HOME}/.gitignore_global"

#
# Homebrew
#
echo -e "\nChecking for Homebrew"
if which -s brew; then
  echo "Homebrew already installed"
else
  echo "Installing Homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  source "${HOME}/.bash_profile"
  echo -e "\nInstalling packages from Brewfile"
  brew bundle
fi

#
# Java versions
#
echo -e "\nAdding JDKs to jenv"
for jdk in /Library/Java/JavaVirtualMachines/*; do
  yes n | jenv add "${jdk}/Contents/Home"
done

echo -e "\nDone."
