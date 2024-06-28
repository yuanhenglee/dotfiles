# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Homebrew path
export PATH="/opt/homebrew/bin:$PATH"


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

  # generate the init script from plugins above
  zgen save
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# autojump
	[[ -s /Users/yhl/.autojump/etc/profile.d/autojump.sh ]] && source /Users/yhl/.autojump/etc/profile.d/autojump.sh

	autoload -U compinit && compinit -u
. /usr/share/autojump/autojump.sh


# alias
alias ls='lsd'
alias ll='ls -la'
alias ssh10000='sshpass -p yhl ssh yhl@140.113.86.106 -p 10000'
alias ssh20000='sshpass -p yhl ssh yhl@140.113.86.106 -p 20000'
alias ssh60000='sshpass -p yhl ssh yhl@140.113.86.106 -p 60000'


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# export PATH="/home/yhl/anaconda3/bin:$PATH"  # commented out by conda initialize

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
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
# <<< conda initialize <<<

