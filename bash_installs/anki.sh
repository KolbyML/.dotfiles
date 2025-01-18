#!/bin/bash

# GitHub repository URL
REPO="ankitects/anki"

# Fetch the list of releases JSON data from GitHub API
response=$(curl -s "https://api.github.com/repos/$REPO/releases")

# Extract the URL of the latest Linux Qt6 tar.zst file for a pre-release
download_url=$(echo "$response" | jq -r '.[] | select(.prerelease == true) | .assets[] | select(.name | test("anki-.*-linux-qt6\\.tar\\.zst")) | .browser_download_url' | head -n 1)

# Check if a URL was found
if [[ -z "$download_url" ]]; then
    echo "Error: Could not find a beta (pre-release) Linux Qt6 release for Anki."
    exit 1
fi

# Download the file using wget
echo "Downloading Anki beta package..."
wget -O anki-linux-qt6.tar.zst "$download_url"

# Create a temporary directory and extract the file
echo "Extracting the package..."
mkdir -p anki_temp
tar --zstd -xf anki-linux-qt6.tar.zst -C anki_temp --strip-components=1

# Change to the extracted directory and run the install script
cd anki_temp || exit 1
if [[ -f install.sh ]]; then
    echo "Running the installer..."
    sudo ./install.sh
else
    echo "Error: install.sh not found."
    cd ..
    rm -rf anki_temp anki-linux-qt6.tar.zst
    exit 1
fi

# Go back to the original directory and clean up
cd ..
echo "Cleaning up..."
rm -rf anki_temp anki-linux-qt6.tar.zst

echo "Beta installation complete."
