# List of Chromium checkout folders to enable clangd remote indexing for.
# https://github.com/clangd/chrome-remote-index/blob/main/docs/index.md
declare CHROMIUM_CHECKOUTS=(
  "$HOME/Documents/projects/chromium/src"
)

mkdir -p ~/Library/Preferences/clangd
for folder in "${CHROMIUM_CHECKOUTS[@]}"
do
  printf "Enabling remote-indexing for %s...\n" $folder
  cat > ~/Library/Preferences/clangd/config.yaml <<-EOF
If:
  PathMatch: $folder/.*
Index:
  External:
    Server: linux.clangd-index.chromium.org:5900
    MountPoint: $folder/
---
EOF
done

# MacOS ships with a clangd that's only compiled with mac+xpc.
# In order for remote indexing to work, we need a clangd thats compiled with grpc.
printf "Installing clangd: "
if ! brew list clangd > /dev/null 2>&1; then
  brew install alexnj/clangd/clangd
  printf "Done.\n"
else
  printf "already installed.\n"
fi

# Increase maxproc and maxfiles (10.15+)

REBOOT_NEEDED=0

if ! diff assets/limit.maxfiles.plist /Library/LaunchDaemons/limit.maxfiles.plist > /dev/null 2>&1; then
  printf "Updating maxfiles.plist\n"
  sudo cp assets/limit.maxfiles.plist /Library/LaunchDaemons/limit.maxfiles.plist
  sudo chown root:wheel /Library/LaunchDaemons/limit.maxfiles.plist > /dev/null 2>&1
  sudo launchctl load -w /Library/LaunchDaemons/limit.maxfiles.plist > /dev/null 2>&1
  REBOOT_NEEDED=1
else
  printf "No diff in limit.maxfiles.plist, skipping update.\n";
fi

if ! diff assets/limit.maxproc.plist /Library/LaunchDaemons/limit.maxproc.plist > /dev/null 2>&1; then
  printf "Updating maxproc.plist\n"
  sudo cp assets/limit.maxproc.plist /Library/LaunchDaemons/limit.maxproc.plist
  sudo chown root:wheel /Library/LaunchDaemons/limit.maxproc.plist > /dev/null 2>&1
  sudo launchctl load -w /Library/LaunchDaemons/limit.maxproc.plist > /dev/null 2>&1
  REBOOT_NEEDED=1
else
  printf "No diff in limit.maxproc.plist, skipping update.\n";
fi

if [ $REBOOT_NEEDED -eq 1 ]; then
  printf "Files/process limit has been modified. You'll need to reboot before they can take effect..\n"
fi
