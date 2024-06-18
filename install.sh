#!/usr/bin/env zsh
############################
# CONTEXT: WORK
# 
# This script creates symlinks from the home directory to any desired dotfiles in $HOME/dotfiles
# - installs MacOS Software
# - installs Homebrew Packages and Casks (Apps)
# - sets up VS Code
############################

############################
# THINGS TO DO / NOT YET AUTOMATED:
# - Check for OS Updates FIRST before any installations
# - Learn and apply the Logitech Options Plus feature flags / mouse settings
# - Check on ability to set/install Chrome browser extensions
# - Establishing settings on Notifications



# dotfiles directory 
dotfiledir="${HOME}/dotfiles-work"

# list of files/folders to symlink in ${homedir}
files=(zshrc zprofile zprompt bashrc bash_profile bash_prompt aliases private)

# change to the dotfiles directory
echo "Changing to the ${dotfiledir} directory"
cd "${dotfiledir}" || exit

# create symlinks (will overwrite old dotfiles)
for file in "${files[@]}"; do
    echo "Creating symlink to $file in home directory."
    ln -sf "${dotfiledir}/.${file}" "${HOME}/.${file}"
done

# Run the MacOS Script
./macOS.sh

# Run the Homebrew Script
./brew.sh

# Run VS Code Script
./vscode.sh



echo "Sign in to Dashlane (in both Safari and Chrome). Press enter to continue..."
read

echo "Sign in to Logitech Options Plus. Press enter to continue..."
read

echo "Sign in to Google Chrome. Press enter to continue..."
read

#echo "Sign in to Box-Drive. Press enter to continue..."
#read

echo "Sign in to Spotify. Press enter to continue..."
read

echo "Sign in to Evernote. Press enter to continue..."
read

echo "Workstation Setup Complete!*****************************************************************************"
