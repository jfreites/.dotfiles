#!/bin/sh

# To execute: save and `chmod +x ./install.sh` then `./install.sh`

# Install homebrew
if test ! $(which brew); then
    echo "Installing brew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

echo "Installing brew cask..."
brew tap homebrew/cask

# Install packages

PACKAGES=(
    git
    antibody
    bat
    lsd
    httpie
    node
    nvm
    python3
    ripgrep
    fd
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Cleaning up..."
brew cleanup

echo "Installing cask..."
CASKS=(
    kitty
    dropbox
    flux
    google-chrome
    google-drive
    gpgtools
    skype
    slack
    rectangle 
    visual-studio-code
    ngrok
)

echo "Installing cask apps..."
brew install --cask ${CASKS[@]}

echo "Installing fonts..."
brew tap caskroom/fonts
FONTS=(
    font-inconsolidata
    font-roboto
    font-clear-sans
)
brew install --cask ${FONTS[@]}

# Installing ddev as local development enviroment
softwareupdate --install-rosetta
brew install --cask docker
brew tap drud/ddev && brew install ddev

# stow dotfiles
stow git
stow nvim
stow zsh
stow kitty

# TODO use brew zsh as default shell

# bundle zsh plugins
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# install neovim plugins
nvim --headless +PlugInstall +qall
