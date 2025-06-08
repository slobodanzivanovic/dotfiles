# .zshenv is always sourced, also it is loaded before .zshrc
# Most ${ENV_VAR} vars should be saved here

# https://specifications.freedesktop.org/basedir-spec/basedir-spec-0.6.html)
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_RUNTIME_DIR="/tmp"
export XDG_STATE_HOME="$HOME/.local/state"

export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

if [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH_TTY" ]]; then
	export IS_SSH=true
else
	case $(ps -o comm= -p $PPID) in
		sshd|*/sshd) IS_SSH=true
	esac
fi
