#!/bin/bash

# Define the version you want to install
PYTHON_VERSION="3.12.0"
PYTHON_PKG="python-${PYTHON_VERSION}-macos11.pkg"
PYTHON_URL="https://www.python.org/ftp/python/${PYTHON_VERSION}/${PYTHON_PKG}"

# Download the Python installer from Python.org
echo "Downloading Python ${PYTHON_VERSION} installer..."
curl -O ${PYTHON_URL}

# Verify that the file exists
if [ -f "${PYTHON_PKG}" ]; then
    echo "Python installer downloaded successfully."

    # Install the downloaded Python package
    echo "Installing Python ${PYTHON_VERSION}..."
    sudo installer -pkg ${PYTHON_PKG} -target /

    # Clean up the downloaded installer
    echo "Cleaning up..."
    rm ${PYTHON_PKG}

    # Verify the installation
    python3.12 --version
else
    echo "Failed to download the Python installer. Please check the URL."
fi

# Add Python 3.12 to the shell path if necessary (you might want to adjust this based on your setup)
echo "Configuring shell to use Python 3.12..."
echo 'export PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:$PATH"' >> ~/.zshrc

# Source .zshrc to reflect changes in the current session
source ~/.zshrc

echo "Python ${PYTHON_VERSION} has been installed successfully!"
