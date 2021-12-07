export HISTFILE="${HOME}/.zsh_history"
export HISTSIZE=1000
export SAVEHIST=1000

export DOTFILES="${HOME}/.dotfiles"
export PATH="${DOTFILES}-private/bin:${PATH}"

set_window_title() {
  print -Pn "\e]0;%m %~\a"
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd set_window_title

source "$DOTFILES/zinit.zsh"
eval "$(starship init zsh)"

alias ls="exa --long --git --icons"
alias ssh="kitty +kitten ssh"
