echo Symlinking ~/.tmux.conf.
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
echo Done.

echo Symlinking ~/.zshrc.
rm ${ZDOTDIR:-$HOME}/.zshrc
rm ${ZDOTDIR:-$HOME}/.zpreztorc
rm ${ZDOTDIR:-$HOME}/.zprofile
ln -s ~/.dotfiles/.zshrc ${ZDOTDIR:-$HOME}/.zshrc
ln -s ~/.dotfiles/.zpreztorc ${ZDOTDIR:-$HOME}/.zpreztorc
ln -s ~/.dotfiles/.zprofile ${ZDOTDIR:-$HOME}/.zprofile

echo Done.

echo Symlinking ~/.jshintrc.
ln -s ~/.dotfiles/.jshintrc ~/.jshintrc
echo Done.

echo Symlinking ~/.vimperatorrc.
ln -s ~/.dotfiles/.vimperatorrc ~/.vimperatorrc
ln -s ~/.dotfiles/.vimperator ~/.vimperator
echo Done.
