# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

#Set Default Editor
export EDITOR=nvim

#Set the directory where we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

#Download zinit, if its not installed
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir - p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

#Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Install Powerlevel10k
zinit ice depth=1; zinit light romkatv/Powerlevel10k

#Install ZSH plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit load zsh-users/zsh-history-substring-search

#Install ZSH snippits
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

#Load Command-Not-Found
source /etc/bash/bashrc.d/command-not-found.sh

#Load Autocompletions
#Enabling Portage Completions & Gentoo Prompt
autoload -U compinit promptinit
compinit
promptinit prompt gentoo

#Style for autocompletions
zstyle ':completions::complete:*' use-cache 1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Cycle through history based on characters already typed on the line
autoload -U up-line-or-search
autoload -U down-line-or-search
zle -N up-line-or-search
zle -N down-line-or-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Set-up icons for files/directories in terminal using lsd
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

#History Setup
HISTFILE=~/.zsh_history #File to save history upon edit
HISTSIZE=1000000000 #Max number of events stored in history list
SAVEHIST=1000000000 #Max number of events stored in history file
HISDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

#Settings for NNN File Manager
export NNN_FIFO="/tmp/nnn.fifo"
export NNN_PLUG="i:imgview;p:preview-tui;w:wallpaper"
export SPLIT="h" # or "v" for vertical split
export NNN_OPTS="eH"
export NNN_PREVIEWDIR="$XDG_CACHE_HOME/nnn/previews"

#Display Pokemon Go Colorscripts
pokemon-go-colorscripts --no-title -r -s | fastfetch -c $HOME/.config/fastfetch/config-pokemon.jsonc --logo-type file-raw --logo-height 10 --logo-width 5 --logo -

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
