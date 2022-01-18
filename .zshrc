export DOTFILES="$HOME/.dotfiles"
export PATH="$DOTFILES-private/bin:$PATH"
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000
export SAVEHIST=1000

set_window_title() {
  print -Pn "\e]0;%m %~\a"
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd set_window_title

source "$DOTFILES/zinit.zsh"
eval "$(starship init zsh)"

alias ls="exa --long --git --icons"

if [[ -n "$VIM_TERMINAL" ]]; then
  function vim() {
    if [[ $# != 1 ]]; then
      return 1
    fi
    local _abspath=$([[ $1 = /* ]] && print "$1" || print -P "%//$1")
    print -n "\e]51;[\"drop\",\"$_abspath\"]\x07"
  }

  function vimcd() {
    print -Pn "\e]51;[\"call\",\"Tapi_vimcd\",\"%/\"]\x07"
  }
fi
