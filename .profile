# ~/.profile: executed by the command interpreter for login shells
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists

# if running bash
if [ -n "$BASH_VERSION" ]; then
	# include .bashrc if it exists
	if [ -f "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
	fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
	PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
	PATH="$HOME/.local/bin:$PATH"
fi

# detect and export SSH
if [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH_TTY" ]]; then
	export IS_SSH=true
else
	case "$(ps -o comm= -p $PPID)" in
		sshd|*/sshd) export IS_SSH=true ;;
	esac
fi

# Added by Toolbox App
export PATH="$PATH:/home/slobodan/.local/share/JetBrains/Toolbox/scripts"
