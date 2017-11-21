grymoire7's dotfiles
====================

I'm currently using homeshick to manage my dotfiles and symlinks.  I switched
from [homesick](https://github.com/technicalpickles/homesick) for fewer
dependencies (bash).

## Install homeshick
To install [homeshick](https://github.com/andsens/homeshick):

```bash
git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
```

The line below should already be added to the .bashrc in this repo, but just in case:

```bash
# from sh and its derivates (bash, dash, ksh, zsh etc.)
printf '\nsource "$HOME/.homesick/repos/homeshick/homeshick.sh"' >> $HOME/.bashrc
# csh and derivatives (i.e. tcsh)
printf '\nalias homeshick source "$HOME/.homesick/repos/homeshick/bin/homeshick.csh"\n' >> $HOME/.cshrc
# fish shell
echo \n'source "$HOME/.homesick/repos/homeshick/homeshick.fish"' >> "$HOME/.config/fish/config.fish"
```

Finally, link everything up with `homeshick -s link`.  See `homeshick --help` for more options.

## Configure vim
Install [vim-plug](https://github.com/junegunn/vim-plug):

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Then in vim `:PlugInstall`.

## Local configuration
A recurring theme in these dotfiles is the inclusion of a `.local` version of
the config file, if present, at the end of the config file here.  This is to
accomodate those configuration details that may be different on your different
machines.  Files that adhere to this philosophy inlude `.bashrc`, `.gitconfig`
and `.vimrc`.

