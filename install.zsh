#!/bin/zsh

export DOTFILES="${HOME}/.dotfiles"

: "Install Homebrew" && {
  printf "\n\033[32m%s\033[m\n" "> Install Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

: "git clone dotfiles" && {
  printf "\n\033[32m%s\033[m\n" "> github.com/rinrinrin4046/dotfiles -> ~/.dotfiles"
  git clone https://github.com/rin4046/dotfiles "${DOTFILES}"
}

: "Run some scripts" && {
  zsh "${DOTFILES}/scripts/symlink.zsh"
  zsh "${DOTFILES}/scripts/bundle.zsh"
  zsh "${DOTFILES}/scripts/misc.zsh"
}

printf "\n\033[32m%s\033[m\n" "Done!"
