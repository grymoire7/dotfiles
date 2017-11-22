grymoire7's dotfiles
====================

I'm currently using [homeshick](https://github.com/andsens/homeshick) to manage
my dotfiles and symlinks.  I switched from
[homesick](https://github.com/technicalpickles/homesick) for fewer
dependencies (ie. just bash).

## Setting up homeshick with this repo
See the [homeshick](https://github.com/andsens/homeshick) docs for more details.
In particular, I skip the step of adding a line to source homeschick.sh to my .bashrc
file since I've already done that.

```bash
# Grab homeshick
git clone git@github.com:andsens/homeshick.git $HOME/.homesick/repos/homeshick
# Source it into the current shell
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
# grab this repo of dotfiles
homeshick clone grymoire7/dotfiles
# Setup the links, starting with this
homeshick -s link
```

Now diff the files in the repo with any remaining unlinked dotfiles and finish, save
anything you may need for later, rm the unlinked files and relink.

Finally, clone any local castle (for .bashrc.local, etc.) and link again.

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
machines.  Files that adhere to this philosophy inlude `.bashrc`, `.gitconfig`,
`.tmux.conf` and `.vimrc`.  For me, these `.local` files are sometimes tracked
in another repo, for example a corporate repo at work or just a local git repo
at home.



