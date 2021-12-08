#!/bin/zsh

printf "\n\033[32m%s\033[m\n" "> Create symbolic links"

for f in "$DOTFILES/."??*; do
  filename="$(basename $f)"
  case "$filename" in
  ".DS_Store") continue ;;
  ".git") continue ;;
  ".gitignore") continue ;;
  ".config") continue ;;
  *) ln -snfv "$DOTFILES/$filename" "$HOME/$filename" ;;
  esac
done

mkdir -p "$HOME/.config/kitty"
ln -snfv "$DOTFILES/.config/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"
mkdir -p "$HOME/.config/nvim"
ln -snfv "$DOTFILES/.config/nvim/init.vim" "$HOME/.config/nvim/init.vim"
