# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# load zgen
source "${HOME}/.zgen/zgen.zsh"
# if the init script doesn't exist
if ! zgen saved; then

  # specify plugins here
  zgen oh-my-zsh
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-completions src
  zgen load romkatv/powerlevel10k powerlevel10k
  zgen load jeffreytse/zsh-vi-mode

  # generate the init script from plugins above
  zgen save
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# zsh-vi-mode
# Only changing the escape key to `jk` in insert mode, we still
# keep using the default keybindings `^[` in other modes
ZVM_VI_INSERT_ESCAPE_BINDKEY=jj

# alias
alias ls='lsd'
alias ll='ls -la'
alias ssh10000='sshpass -p yhl ssh yhl@140.113.86.106 -p 10000'
alias ssh20000='sshpass -p yhl ssh yhl@140.113.86.106 -p 20000'
alias ssh60000='sshpass -p yhl ssh yhl@140.113.86.106 -p 60000'
alias vi='nvim'

case `uname` in
  Darwin)
    echo "Apply zshrc for Darwin"
    # Homebrew path
    export PATH="/opt/homebrew/bin:$PATH"
    # autojump
    [[ -s /Users/yhl/.autojump/etc/profile.d/autojump.sh ]] && source /Users/yhl/.autojump/etc/profile.d/autojump.sh
    # pyenv
    export PYENV_ROOT="$HOME/.pyenv"
    [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
  ;;
  Linux)
    echo "Apply zshrc for Linux"
    # autojump
    autoload -U compinit && compinit -u
    . /usr/share/autojump/autojump.sh
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

