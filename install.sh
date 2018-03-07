#!/bin/bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


#
# Symlinks a list of files from the dotfiles directory to ~
#
writeSymlinks() {
	for filename in "$@"; do
		echo -n "  "
		ln -sfv "${DOTFILES_DIR}/${filename}" ~
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
# Symlinks from home to here
#
echo "Writing symlinks"
writeSymlinks .bash_profile .dir_colors .gitconfig .jenv .vice .vimrc Brewfile


#
# Some preferences
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

echo -e "\nDone."
