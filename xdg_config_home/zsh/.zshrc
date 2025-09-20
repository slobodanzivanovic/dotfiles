skip_global_compinit=1

HISTSIZE=50000
SAVEHIST=50000
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY

setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

setopt NO_BEEP

autoload colors; colors

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'
setopt PROMPT_SUBST

PROMPT='%F{green}%n@%m %f%F{blue}%~%f%F{green}${vcs_info_msg_0_}%f
$ '

# alt prompt oob
# autoload -Uz promptinit
# promptinit
# prompt adam1

bindkey -v
export KEYTIMEOUT=1

autoload -Uz edit-command-line
zle -N edit-command-line

bindkey "\eOA" up-line-or-history
bindkey "\eOB" down-line-or-history
bindkey "\eOC" forward-char
bindkey "\eOD" backward-char

bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^?' backward-delete-char
bindkey '^[[3~' delete-char
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^U' backward-kill-line
bindkey '^K' kill-line
bindkey '^Y' yank

bindkey -M vicmd v edit-command-line
bindkey "^Q" push-input

export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

autoload -Uz compinit
compinit

setopt AUTO_MENU
setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' group-name ''
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*' rehash true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# https://askubuntu.com/questions/1219271/im-having-a-problem-with-locale-and-locale-gen-in-ubuntu
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# in case i need it
#if [[ "$OSTYPE" == "darwin"* ]]; then
#	export JAVA_HOME=$(/usr/libexec/java_home)
#elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
#	export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
#else
#	return 1
#fi
#export PATH=$JAVA_HOME/bin:$PATH

# nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

export PATH="$HOME/.local/bin:$PATH"

alias ..="cd .."
alias ...="cd ../.."

alias ls="ls --color=auto"
alias ll="ls -lh"
alias la="ls -lah"
alias mkdir="mkdir -p"
alias cls="clear"
alias grep="grep --color=auto"
alias df="df -h"
alias du="du -h"
alias tmp="cd $(mktemp -d)"
alias path='echo -e ${PATH//:/\\n}'

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
alias grh="git reset --hard"
alias gst="git stash"
alias gstp="git stash pop"
alias gbl="git blame -w -C -C -C"
alias gf="git fetch --all --prune"
alias grm="git rebase origin/master"
alias glg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
