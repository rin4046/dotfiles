#!/bin/zsh

printf "\n\033[32m%s\033[m\n" "> Miscellaneous"

: "Sign in to GitHub" && {
  gh auth login
}

echo

: "git clone dotfiles-private" && {
  git clone "https://github.com/rin4046/dotfiles-private" "$HOME/.dotfiles-private"
  mkdir -p "$HOME/.ssh"
  ln -snfv "$HOME/.dotfiles-private/ssh_config" "$HOME/.ssh/config"
}
