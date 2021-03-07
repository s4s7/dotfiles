#!/bin/bash

set -evx

# install brew
if [ ! -f /usr/local/bin/brew ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# install dotfiles from my github account
if [ ! -d ~/dotfiles ]; then
    cd ~
    git clone git@github.com:s4s7/dotfiles.git
fi

# refer to Brewfile
brew bundle -v --file=~/dotfiles/Brewfile

# symlink(symbolic link) farm manager
stow -v -d ~/dotfiles/packages -t ~ zsh vim

