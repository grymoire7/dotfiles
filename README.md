grymoire7's dotfiles
====================

I'm currently using [homeshick](https://github.com/andsens/homeshick) to manage
my dotfiles and symlinks.  I switched from
[homesick](https://github.com/technicalpickles/homesick) for fewer
dependencies (ie. just bash/zsh and git).

## Setting up homeshick with this repo
See the [homeshick](https://github.com/andsens/homeshick) docs for more details.
In particular, I skip the step of adding a line to source homeschick.sh to my .bashrc/.zshrc
file since it's already there.

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

If any of the dotfiles already existed, the ones in this repo will not be
linked.  Now is the time to check that out, remove files as need and run the
`homeshick -s link` command agai.

Finally, clone any local castle (for .bashrc.local, etc.) and link again.

## Install software and configure System
This is interactive script that may ask whether you'd like to install/configure
various things. It does some things without asking, so you might want to check
it out before running it for the first time.

```bash
bin/machine_up
```

## Local configuration note
A recurring theme in these dotfiles is the inclusion of a `.local` version of
the config file, if present, at the end of the config file here.  This is to
accomodate those configuration details that may be different on your different
machines.  Files that adhere to this philosophy inlude `.bashrc`, `.gitconfig`,
`.tmux.conf` and `.vimrc`.  For me, these `.local` files are often tracked
in another repo, for example a corporate repo at work or just a local git repo
at home.

