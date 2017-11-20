grymoire7's dotfiles
====================

## homesick
To configure as a [homesick](https://github.com/technicalpickles/homesick) castle:

```
gem install homesick
homesick clone grymoire7/dotfiles
```

## homeshick
To configure as a [homeshick](https://github.com/andsens/homeshick) castle:

```
git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
# from sh and its derivates (bash, dash, ksh, zsh etc.)
printf '\nsource "$HOME/.homesick/repos/homeshick/homeshick.sh"' >> $HOME/.bashrc
# csh and derivatives (i.e. tcsh)
printf '\nalias homeshick source "$HOME/.homesick/repos/homeshick/bin/homeshick.csh"\n' >> $HOME/.cshrc
# fish shell
echo \n'source "$HOME/.homesick/repos/homeshick/homeshick.fish"' >> "$HOME/.config/fish/config.fish"
```


