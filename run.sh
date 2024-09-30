#!/bin/zsh

echo "Starting setup..."

# Install Homebrew and all software using the Brewfile
echo "Installing Homebrew packages..."
brew bundle --file=~/.dotfiles/Brewfile

# Install Python 3.12
echo "Installing Python 3.12..."
./python_install.sh

# Configure GitHub SSH keys
echo "Setting up GitHub SSH keys..."
./setup_github_ssh.sh

# Install Oh My Zsh and plugins
echo "Installing Oh My Zsh and plugins..."
./zsh_plugin.sh

# Apply VSCode settings
echo "Configuring VSCode..."
cp ~/.dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

echo "All tasks completed!"
