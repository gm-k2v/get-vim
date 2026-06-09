#!/usr/bin/env bash
mkdir -p ~/.vim-appImage

if curl -L -o ~/.vim-appImage/vim.appimage https://github.com/vim/vim-appimage/releases/download/v9.1.1301/Vim-v9.1.1301.glibc2.29-x86_64.AppImage; then
  chmod +x ~/.vim-appImage/vim.appimage
  if ( cd ~/.vim-appImage; ~/.vim-appImage/vim.appimage --appimage-extract ); then
    [[ -f ~/.vimrc ]] || touch ~/.vimrc
    alias vi=~/.vim-appImage/squashfs-root/AppRun
    grep -q "$alias vi=" ~/.bash_profile || echo "alias vi=~/.vim-appImage/squashfs-root/AppRun" >>~/.bash_profile
  fi
fi
