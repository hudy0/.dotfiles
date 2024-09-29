#!/bin/bash

# Install Homebrew if not already installed
if ! command -v brew &> /dev/null
then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install all dependencies and fonts from Brewfile
brew bundle --file=~/.dotfiles/Brewfile

# Install Oh My Zsh if not installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install Zsh plugins
bash ~/.dotfiles/zsh_plugins.sh

# Symlink .zshrc to the home directory
ln -sf ~/.dotfiles/.zshrc ~/.zshrc

# Reload Zsh configuration
source ~/.zshrc

# Copy VSCode settings
mkdir -p "$HOME/Library/Application Support/Code/User"
cp ~/.dotfiles/.vscode/settings.json "$HOME/Library/Application Support/Code/User/settings.json"
