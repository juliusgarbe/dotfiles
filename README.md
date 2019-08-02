# Dotfiles
This repository contains my [dotfiles](https://wiki.archlinux.org/index.php/Dotfiles).

**Warning:** These files contain code which affects the way your system behaves. Do not use blindly unless you know what that entails and only after reviewing the code. Use at your own risk! And always remember: with great power comes great responsibility :point_up:.

## Contents

- `.jupyter/custom/custom.css`: Configuration file for [Jupyter Notebooks](https://jupyter.org). Mainly adds custom colors and some font styles.
- `.bashrc`: Configuration file for the Bash Shell. Prepares environment to use [Environment Modules](http://modules.sourceforge.net).
- `.kshrc`: Configuration file for the [KornShell](http://www.kornshell.org).
- `.ncviewrc`: Configuration file for [Ncview](http://meteora.ucsd.edu/~pierce/ncview_home_page.html).
- `.profile`: General Bash configurations, like environment variables etc.
- `.vimrc`: Configuration file for [Vim](https://www.vim.org). I'm using [vim-plug](https://github.com/junegunn/vim-plug), e.g. for the [Nord](https://www.nordtheme.com/ports/vim) color scheme.
- `.xinitrc`: Configuration file for the [X Server](https://www.x.org/).
- `.zshrc`: Configuration file for [Oh My Zsh](https://ohmyz.sh). Adds a bunch of custom aliases and custom themes. The [agnoster](https://github.com/agnoster/agnoster-zsh-theme) theme requires [Powerline Fonts](https://github.com/powerline/fonts) to be installed in the terminal in order to render properly.

## Author

*Copyright* Julius Garbe. Licensed under the [MIT License](https://en.wikipedia.org/wiki/MIT_License).
