# env
export EDITOR=nvim

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export GTK_THEME="adw-gtk3"

export PATH="$HOME/.local/bin:$PATH"

export GOPATH=$HOME/.go
export PATH="$PATH:$(go env GOPATH)/bin"

# export GEM_HOME="$HOME/.gem"
# export PATH="$PATH:$HOME/.gem/bin"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zsh history
HISTFILE="$XDG_CACHE_HOME/zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000
setopt append_history inc_append_history share_history
setopt globdots

# binds
bindkey -v
bindkey -v '^?' backward-delete-char

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

### Plugins ###
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit ice blockf atpull'zinit creinstall -q .' # idk what this does
zinit light zsh-users/zsh-completions

# turbo mode stuff
# zinit wait lucid for \
#  atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
#     zdharma-continuum/fast-syntax-highlighting \
#  blockf \
#     zsh-users/zsh-completions \
#  atload"!_zsh_autosuggest_start" \
#     zsh-users/zsh-autosuggestions

# completions
autoload -Uz compinit
compinit

autoload -U +X bashcompinit 
bashcompinit

# powerlevel10k
source ~/.local/bin/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# zstyle :compinstall filename '/home/cnbldn/.zshrc'
# autoload -Uz compinit
# compinit

# yazi cwd command
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# aliases
alias mux="tmuxinator"
eval "$(uv generate-shell-completion zsh)"
