
# Change default shell to zsh on Mac
echo "Current shell is $SHELL"
if [ $SHELL != "/bin/zsh" ]; then
  chsh -s /bin/zsh
fi

# Disable Apple's (un)natural scrolling.
defaults write ~/Library/Preferences/.GlobalPreferences  com.apple.swipescrolldirection -bool false

# Tap to click on trackpads
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# Keyboard repeat rates
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Improve BT audio quality for QC35 (and others)
# https://bencollier.net/2011/04/improve-compressed-bluetooth-audio-on-mac/
# https://www.reddit.com/r/apple/comments/5rfdj6/pro_tip_significantly_improve_bluetooth_audio/
# defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Max (editable)" 80
# defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" 80
# defaults write com.apple.BluetoothAudioAgent "Apple Initial Bitpool (editable)" 80
# defaults write com.apple.BluetoothAudioAgent "Apple Initial Bitpool Min (editable)" 80
# defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool" 80
# defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool Max" 80
# defaults write com.apple.BluetoothAudioAgent "Negotiated Bitpool Min" 80

# Open Finder window for removable media on plugin
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder "FXPreferredViewStyle" -string "clmv"

# Disable rename warning
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"

# Keep folders on top when sorting by name
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true" 

# Add a quit option to the Finder.
defaults write com.apple.finder "QuitMenuItem" -bool "false"

# Show hidden files
defaults write com.apple.finder "AppleShowAllFiles" -bool "true" 

# Show path bar in the bottom of the Finder windows
defaults write com.apple.finder "ShowPathbar" -bool "true"

# Empty Trash securely by default
defaults write com.apple.finder EmptyTrashSecurely -bool true

# Enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Disable "This is trying to access that" warning
defaults write com.apple.LaunchServices LSQuarantine -bool NO

# Update every second
defaults write com.apple.ActivityMonitor "UpdatePeriod" -int "1" 

#
# Menu bar
#

# Show Bluetooth Icon on the menu bar (to turn off, use -int 24)
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Bluetooth -int 18

# Battery % on menu bar
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist BatteryShowPercentage -bool true

# Show Speaker/volume icon on menu bar
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Sound -int 18

# Time ticks
defaults write com.apple.menuextra.clock "FlashDateSeparators" -bool "true" 

#
# Dock
#

# Mute some animations
defaults write com.apple.dock "mineffect" -string "scale" 
defaults write com.apple.dock launchanim -bool false

# Have dock show only the open apps.
defaults write com.apple.dock static-only -bool TRUE

# Make dock dim hidden apps
defaults write com.apple.dock showhidden -bool TRUE

# Dock to left 
defaults write com.apple.dock "orientation" -string "left" 

# Smaller icons on dock
defaults write com.apple.dock "tilesize" -int "36" 

# Faster no animation dock
defaults write com.apple.dock "autohide-time-modifier" -float "0"
defaults write com.apple.dock "autohide-delay" -float "0"

#
# Activate all setting changes
#

# Activate the above settings without a logout
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u

# Restart dock
killall Dock

# Restart Finder
killall Finder


## App specific: iTerm

# Most of iTerm's settings can be configured via `defaults write com.googlecode.iterm2`,
# however, it's way more efficient to have the configuration be pointed to dotfiles, 
# including the color palettes. 
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -int 1
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$(pwd)/iterm"

# Save and sync settings back to dotfiles automatically
defaults write com.googlecode.iterm2 NoSyncNeverRemindPrefsChangesLostForFile_selection -int 2

# Dont ask back when I ask you to quit
defaults write com.googlecode.iterm2 PromptOnQuit -int 0

# Minimal/no title bar
defaults write com.googlecode.iterm2 TabStyleWithAutomaticOption -int 5

# Preserve whitespace in selections copied to the pasteboard
defaults write com.googlecode.iterm2 TrimWhitespaceOnCopy -bool false

## git 

# Set global .gitignore
git config --global core.excludesfile ~/.gitignore

