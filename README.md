# Dotfiles
This repository contains my [dotfiles](https://wiki.archlinux.org/index.php/Dotfiles).

**Warning:** These files contain code which affects the way your system behaves. Do not use blindly unless you know what that entails and only after reviewing the code. Use at your own risk! And always remember: with great power comes great responsibility :point_up:.

## Installing and managing dotfiles
Before installation, make sure to back up already existing configuration files in your $HOME folder if you care about them, so they won't be overwritten by Git. To install, use the following commands (note, that this dotfile repository should be managed as a *bare Git repository*):
```
git clone --bare https://github.com/juliusgarbe/dotfiles.git $HOME/.cfg
git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout
```
Create an alias `config` which is used instead of the regular `git` command when interacting with the configuration repository:
```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```
You might want to add the alias definition to your `.bashrc` (make sure to log out and log back in afterwards to be able to use it):
```
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```
Set a local flag to hide files that are not explicitly tracked:
```
config config --local status.showUntrackedFiles no
```
After successful execution of the setup any file within the $HOME folder can be version-controlled with normal commands, replacing `git` with the newly created `config` alias, e.g.:
```
config status
config add .bashrc
config commit -m "Add bashrc"
```
For more details, see [here](https://www.atlassian.com/git/tutorials/dotfiles).

## Contents
- `.jupyter/custom/custom.css`: Configuration file for [Jupyter Notebooks](https://jupyter.org). Mainly adds custom colors and some font styles.
- `.bashrc`: Configuration file for the Bash Shell. Prepares environment to use [Environment Modules](http://modules.sourceforge.net) and sets various environment variables.
- `.kshrc`: Configuration file for the [KornShell](http://www.kornshell.org).
- `.ncviewrc`: Configuration file for [Ncview](http://meteora.ucsd.edu/~pierce/ncview_home_page.html).
- `.profile`: General Bash configurations, like environment variables etc.
- `.vimrc`: Configuration file for [Vim](https://www.vim.org). I'm using [vim-plug](https://github.com/junegunn/vim-plug), e.g. for the [Nord](https://www.nordtheme.com/ports/vim) color scheme.
- `.xinitrc`: Configuration file for the initialization of the [X Server](https://www.x.org/).
- `.Xresources`: Configuration file for the [X Window System](https://www.x.org/). Also adds some UI customization for *Ncview*.
- `.zshrc`: Configuration file for [Oh My Zsh](https://ohmyz.sh). Adds a bunch of custom aliases and custom themes. The [agnoster](https://github.com/agnoster/agnoster-zsh-theme) theme requires [Powerline Fonts](https://github.com/powerline/fonts) to be installed in the terminal in order to render properly.

## Author
Copyright (c) 2020 [Julius Garbe](mailto:julius.garbe@pik-potsdam.de). Licensed under the [MIT License](https://en.wikipedia.org/wiki/MIT_License).
