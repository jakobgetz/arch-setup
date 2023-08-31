#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -l'

# Neovim
alias nvim-default='NVIM_APPNAME=default nvim'
alias nvim-tutorial='NVIM_APPNAME=tutorial.nvim nvim'
alias nvim-chad='NVIM_APPNAME=NvChad.nvim nvim'
alias vi='nvim-chad'
alias vim='nvim-chad'
# alias nvim='nvim-chad'
function nvims() {
	items=("default" "tutorial.nvim" "NvChad.nvim")
	config=$(printf "%s\n" "${items[@]}" | fzf --prompt="Neovim Config" --height=~50% --layout=reverse --border --exit-0)
	if [[ -z $config ]]; then
		echo "Nothing Selected"
		return 0
	elif [[ $config == "default" ]]; then
		config = ""
	fi
	NVIM_APPNAME=$config nvim $@
}

source /home/jakob/repos/pintos-kaist/activate
source /home/jakob/.emsdk/emsdk_env.sh
. "$HOME/.cargo/env"

export WASMTIME_HOME="$HOME/.wasmtime"

export PATH="$WASMTIME_HOME/bin:$PATH"