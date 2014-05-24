git config --global color.ui true
if [ -e $HOME/dotfiles ]; then
    echo "dotfiles are already cloned"
else
    git clone https://github.com/tarata/dotfiles.git $HOME/dotfiles
fi
rm -f $HOME/.vimrc
rm -rf $HOME/.vim
rm -f $HOME/.zshrc
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/.vim $HOME/.vim
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
if [ -e $HOME/dotfiles ]; then
    echo "rbenv is already cloned"
else
    git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv
    echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $HOME/.zshrc.local
    echo 'eval "$(rbenv init -)"' >> $HOME/.zshrc.local
    exec $SHELL -l
    git clone https://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
fi

$HOME/.rbenv/bin/rbenv install -v 2.1.2
$HOME/.rbenv/bin/rbenv rehash
$HOME/.rbenv/bin/rbenv global 2.1.2
