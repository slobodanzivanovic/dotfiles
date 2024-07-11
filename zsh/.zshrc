export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

eval "$(fnm env)"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

source $ZSH/oh-my-zsh.sh

export EDITOR=nvim
export VISUAL=nvim
export GIT_EDITOR=nvim
export TERMINAL=wezterm

alias ..="cd .."
alias ...="cd ../.."
alias ls="ls -la --color"
alias vim="nvim"
alias gi="git init"
alias gs="git status"
alias gc="git commit"
alias gco="git checkout"
alias ga="git add"
alias gb="git branch"
alias gba="git branch --all"
alias gd="git difftool"
alias gds="git diff -w --staged"
alias grs="git restore --staged"
alias grd="git fetch origin && git rebase origin/master"
alias gp="git push -u origin"

bindkey -s ^f "~/.dotfiles/zsh/scripts/sessionizer\n"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/slobodan/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/slobodan/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/slobodan/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/slobodan/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

eval "$(starship init zsh)"
