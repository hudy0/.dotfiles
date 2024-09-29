#!/bin/bash

ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

# Install Zsh Autosuggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

# Install Zsh Syntax Highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

# Install Zsh Fast Syntax Highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-fast-syntax-highlighting" ]; then
  git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-fast-syntax-highlighting"
fi

# Install Zsh Autocomplete
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autocomplete" ]; then
  git clone --depth 1 https://github.com/marlonrichert/zsh-autocomplete.git "$ZSH_CUSTOM/plugins/zsh-autocomplete"
fi
