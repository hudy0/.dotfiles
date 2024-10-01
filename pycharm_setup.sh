#!/bin/bsh

#!/bin/bash

# Install PyCharm Professional using Homebrew (already in Brewfile)
echo "Installing PyCharm Professional..."

# Create a symbolic link to use 'charm' command in terminal
echo "Creating a symbolic link for PyCharm..."
sudo ln -s /usr/local/bin/pycharm /usr/local/bin/charm

# Test the charm command
echo "Testing 'charm' command..."
charm .  # Opens the current directory in PyCharm
