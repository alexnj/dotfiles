# List of Chromium checkout folders to enable clangd remote indexing for.
# https://github.com/clangd/chrome-remote-index/blob/main/docs/index.md
declare CHROMIUM_CHECKOUTS=(
  "$HOME/Documents/projects/chromium/src"
)

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
if ! brew list clangd > /dev/null 2>&1; then
  brew install alexnj/clangd/clangd
else
  printf "already installed.\n"
fi