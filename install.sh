# Go to church just once
sudo -v

sh install-dotfiles.sh

if [[ $OSTYPE == 'darwin'* ]]; then
  sh macos-packages.sh
  sh macos-preferences.sh
fi

sh personal.sh
