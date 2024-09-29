#!/bin/bash

# GitHub SSH Keys Setup Script

# Variables
EMAIL="youremail@email.com"  # Change this to your email

# Step 1: Generate SSH Key
echo "Generating SSH key..."
ssh-keygen -t ed25519 -C "$EMAIL" -f ~/.ssh/id_ed25519 -N ""

# Step 2: Start the SSH Agent
echo "Starting the SSH agent..."
eval "$(ssh-agent -s)"

# Step 3: Create SSH Config File if it doesn't exist
SSH_CONFIG="$HOME/.ssh/config"
if [ ! -f "$SSH_CONFIG" ]; then
    echo "Creating SSH config file..."
    touch "$SSH_CONFIG"
fi

# Step 4: Configure SSH
echo "Configuring SSH..."
{
    echo "Host *"
    echo "  AddKeysToAgent yes"
    echo "  IdentityFile ~/.ssh/id_ed25519"
    # echo "  UseKeychain yes"  # Uncomment this line if using macOS
} >> "$SSH_CONFIG"

# Step 5: Add SSH Key to the Agent
echo "Adding SSH key to the agent..."
ssh-add ~/.ssh/id_ed25519

# Step 6: Display the public key
echo "Your public SSH key (copy this to GitHub):"
cat ~/.ssh/id_ed25519.pub

# Instructions for the user
echo ""
echo "Please log into GitHub, go to Settings > SSH and GPG Keys, and add your SSH key."
echo "1. Title Your Key: Enter a name for the key."
echo "2. Paste the Key: Copy the contents from above and paste them into the key field on GitHub."
echo "3. Click Add SSH Key and enter your password when prompted."

# Test the SSH connection
echo ""
echo "Testing your SSH key..."
ssh -T git@github.com

echo "SSH key setup is complete!"
