function exists() {
  command -v "$1" >/dev/null 2>&1
}

# Install homebrew
if ! exists brew; then
  /bin/bash -c \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.profile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Enable font cask
brew tap homebrew/cask-fonts

# Install favorite brews.
declare BREWS=(
  "git"

  # Programming fonts
  "font-inconsolata"
  "font-fira-code"
  "font-cascadia-code"
  "font-meslo-lg-nerd-font"
  "font-ibm-plex"
  "font-monaspace"

  # Other packages
  "tmux"
  "rsync" # upgrade 14 year old mac rsync
  "nvm"
  "iterm2"
  "powerlevel10k" # powerline10k
  "fzf" # fuzzy search (^r)
  "jq" # json processor
  "jless" # json view for cmdline
  "mas" # mac appstore with brew
  "gh" # github cli
  "tldr" # explainer
  "rectangle" # window manager
  "watch"
)

for keg in "${BREWS[@]}"
do
  printf "Brewing %s... " $keg
  if ! brew list $keg > /dev/null 2>&1; then
    brew install $keg
  else
    printf "already installed.\n"
  fi
done

if [ -f ~/.nvm ]; then
  mkdir ~/.nvm
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi

# Install favorite Mac Store apps
declare MACAPPS=(
  "937984704" # Amphetamine
  "425955336" # Skitch
)

for app in "${MACAPPS[@]}"
do
  printf "Installing %s from AppStore... " $app
  if ! mas list | grep $app > /dev/null 2>&1; then
    mas install $app
  else
    printf "already installed.\n"
  fi
done
