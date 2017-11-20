grymoire7's dotfiles
====================

I'm currently using homeshick to manage my dotfiles and symlinks.  I switched
from [homesick](https://github.com/technicalpickles/homesick) since it has
fewer dependencies (bash).

## homeshick
To install [homeshick](https://github.com/andsens/homeshick):

```
git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
```

The line below should already be added to the .bashrc in this repo, but just in case:

```
# from sh and its derivates (bash, dash, ksh, zsh etc.)
printf '\nsource "$HOME/.homesick/repos/homeshick/homeshick.sh"' >> $HOME/.bashrc
# csh and derivatives (i.e. tcsh)
printf '\nalias homeshick source "$HOME/.homesick/repos/homeshick/bin/homeshick.csh"\n' >> $HOME/.cshrc
# fish shell
echo \n'source "$HOME/.homesick/repos/homeshick/homeshick.fish"' >> "$HOME/.config/fish/config.fish"
```

## Configure vim
Install [vim-plug](https://github.com/junegunn/vim-plug):

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Then in vim `:PlugInstall`.

