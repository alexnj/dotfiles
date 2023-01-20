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

# Install favorite brews.
declare BREWS=(
  # Programming fonts
  "font-inconsolata"
  "font-fira-code"
  "tmux"
  "nvm"
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

if ! exists ~/.nvm; then
  mkdir ~/.nvm
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi

