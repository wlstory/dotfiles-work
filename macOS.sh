#!/usr/bin/env zsh
# CONTEXT: WORK


xcode-select --install

echo "Complete the installation of Xcode Command Line Tools before proceeding."
echo "Press enter to continue..."
read

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

# Hot Corners - https://dev.to/darrinndeal/setting-mac-hot-corners-in-the-terminal-3de
#================================================
# *                 HOT CORNERS
#================================================
# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
echo "♨️  Setting Hot Corners"
defaults write com.apple.dock wvous-tl-corner -int 3 # Top Right    - Show Application Windows
defaults write com.apple.dock wvous-tr-corner -int 2 # Top Right    - Mission Control
defaults write com.apple.dock wvous-bl-corner -int 4 # Bottom Left  - Desktop
defaults write com.apple.dock wvous-br-corner -int 5 # Bottom Right - Start Screen Saver

# Adding items to the doc and setting hot corners requires a Dock restart
killall Dock
killall Finder

#EOF
