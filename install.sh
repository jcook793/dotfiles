#!/bin/bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


#
# Symlink utility function
#
symlink() {
    echo -n "  "
    ln -sfv "${DOTFILES_DIR}/${1}" "${2}"
}


#
# Simple symlinks
#
echo "Writing symlinks"
symlink .zshrc "${HOME}"
symlink .zsh-dircolors.config "${HOME}"
symlink .gitignore_global "${HOME}"
symlink .vimrc "${HOME}"
symlink Brewfile "${HOME}"

#
# Sublime Text configs
#
SUBLIME_TEXT_PACKAGES_FOLDER="${HOME}/Library/Application Support/Sublime Text 3/Packages"
SUBLIME_TEXT_USER_PACKAGES_FOLDER="${SUBLIME_TEXT_PACKAGES_FOLDER}/User"
if [ -d "${SUBLIME_TEXT_PACKAGES_FOLDER}/User" ]; then
    NOW=`date "+%Y%m%d-%H%M%S"`
    ARCHIVE_FOLDER="${SUBLIME_TEXT_USER_PACKAGES_FOLDER}-${NOW}"
    echo "  Found existing Sublime Text 3 user folder in ${SUBLIME_TEXT_USER_PACKAGES_FOLDER}, archiving it as ${ARCHIVE_FOLDER}"
    mv "${SUBLIME_TEXT_USER_PACKAGES_FOLDER}" "${ARCHIVE_FOLDER}"
fi
mkdir -p "${SUBLIME_TEXT_PACKAGES_FOLDER}"
symlink sublime "${HOME}/Library/Application Support/Sublime Text 3/Packages/User"

#
# Oh My Zsh theme (cobalt2)
#
OH_MY_ZSH_THEMES_FOLDER="${HOME}/.oh-my-zsh/themes"
if [ -d "${OH_MY_ZSH_THEMES_FOLDER}" ]; then
    symlink oh-my-zsh/themes/cobalt2.zsh-theme "${OH_MY_ZSH_THEMES_FOLDER}"
else
    echo "  Could not find ${OH_MY_ZSH_THEMES_FOLDER} - is Oh My Zsh installed?"
    echo "    ^-- this might be a problem, you probably want to install Oh My Zsh and run this script again"
fi

#
# Global .gitignore
#
echo -e "\nUpdating git config for global .gitignore"
git config --global core.excludesfile "${HOME}/.gitignore_global"

#
# Homebrew
#
echo -e "\nChecking for Homebrew"
if which -s brew; then
  echo "Homebrew installed, installing packages from Brewfile"
  brew bundle
else
  echo "Homebrew not installed yet! Go install Homebrew and run this script again."
fi

echo -e "\nDone."
