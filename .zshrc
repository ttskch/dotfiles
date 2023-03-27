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

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# general
setopt autocd
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit load zdharma/history-search-multi-word

# show colorful
zinit light chrissicool/zsh-256color

# some additional plugins
zinit snippet OMZP::git
zinit snippet OMZP::composer
zinit light supercrabtree/k

# theming
zinit snippet OMZL::git.zsh # zinit theming system depends on this
zinit snippet OMZL::theme-and-appearance.zsh # some themes depends on this
zinit snippet OMZL::spectrum.zsh # some themes depends on this
# https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
zinit snippet OMZT::robbyrussell

# to avoid "zsh: no matches found: head^"
setopt NO_NOMATCH

# make case-insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# enable to select completions by cursor
autoload -U compinit
compinit
zstyle ':completion:*:default' menu select=1

# change select-word-style
autoload -Uz select-word-style
select-word-style bash
WORDCHARS=''

# read additional config
source ~/.zsh/env.zsh
source ~/.zsh/alias.zsh
source ~/.zsh/secret.zsh
