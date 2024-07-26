# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zsh-vi-mode
ZVM_VI_INSERT_ESCAPE_BINDKEY=jj
ZVM_INIT_MODE=sourcing

# load zgen
source "${HOME}/.zgen/zgen.zsh"
# if the init script doesn't exist
if ! zgen saved; then

  # specify plugins here
  zgen oh-my-zsh
  zgen load zsh-users/zsh-autosuggestions
  # zgen load zsh-users/zsh-syntax-highlighting
  zgen load zdharma-continuum/fast-syntax-highlighting
  zgen load marlonrichert/zsh-autocomplete
  zgen load romkatv/powerlevel10k powerlevel10k
  zgen load jeffreytse/zsh-vi-mode

  # generate the init script from plugins above
  zgen save
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


unsetopt autocd

# alias
alias ls='lsd'
alias ll='ls -la'
alias vi='nvim'
alias zj='zellij'
eval "$(gh copilot alias -- zsh)"

case `uname` in
  Darwin)
    echo "Apply zshrc for Darwin"
    # Homebrew path
    export PATH="/opt/homebrew/bin:$PATH"
    # pyenv
    export PYENV_ROOT="$HOME/.pyenv"
    [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"

    # emulate delete key
    bindkey "^[[3~" delete-char
  ;;
  Linux)
    echo "Apply zshrc for Linux"
    # conda
    __conda_setup="$('/home/yhl/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/home/yhl/anaconda3/etc/profile.d/conda.sh" ]; then
            . "/home/yhl/anaconda3/etc/profile.d/conda.sh"
        else
            export PATH="/home/yhl/anaconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
  ;;
esac

# disable alt c key binding
FZF_ALT_C_COMMAND=""
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# zoxide
eval "$(zoxide init zsh)"
