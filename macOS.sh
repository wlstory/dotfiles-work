#!/usr/bin/env zsh
# CONTEXT: WORK


xcode-select --install

echo "Complete the installation of Xcode Command Line Tools before proceeding."
echo "Press enter to continue..."
read

# Set scroll as natural vs traditional - check if commenting reverts
# defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true && killall Finder

# Get the absolute path to the image
# *** REPLACE WITH MY IDEAL DESKTOP IMAGE ***
#IMAGE_PATH="${HOME}/dotfiles/settings/Desktop.png"

# AppleScript command to set the desktop background
#osascript <<EOF
#tell application "System Events"
#    set desktopCount to count of desktops
#    repeat with desktopNumber from 1 to desktopCount
#        tell desktop desktopNumber
#            set picture to "$IMAGE_PATH"
#        end tell
#    end repeat
#end tell

defaults write com.apple.finder QLInlinePreviewMinimumSupportedSize -int 512 # Disable in-icon previews

# Configure Finder
echo "Configuring Finder ----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder AppleShowAllExtensions -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool true
defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool true
defaults write com.apple.finder FXInfoPanesExpanded -dict General -bool true OpenWith -bool true Privileges -bool true
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool false
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool false
defaults write com.apple.finder OpenWindowForNewRemovableDisk    -bool false

# Restart Finder
killall Finder
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>---- Finder Configuration Complete"

# Configure Safari
echo "Configuring Safari ----<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
# Safari opens with: last session
defaults write com.apple.Safari AlwaysRestoreSessionAtLaunch -bool true
# disable safari auto open files
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
# Disable saving passwords - avoid issues with external password managers)
defaults write com.apple.Safari AutoFillPasswords -bool false            
# Disable auto filling Credit Cards
defaults write com.apple.Safari AutoFillCreditCardData -bool false 
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true      
killall Safari
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>---- Safari Configuration Complete"

# Configure Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock tilesize -int 36

# Adding items to the doc and setting hot corners requires a Dock restart
killall Dock
killall Finder

#EOF
