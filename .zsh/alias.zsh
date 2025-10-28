alias s="source ~/.zshrc"
alias ls="gls --color=auto" # require `brew install coreutils`
alias ll="ls -l"
alias la="ls -a"
alias lla="ll -a"
alias vi="vim"
alias more="less"
alias cat="bat --theme=base16"
alias ip-release="sudo ipconfig set en0 BOOTP"
alias ip-new="sudo ipconfig set en0 DHCP"
alias cp="cp -p"
alias mkdir="mkdir -p"
alias find="find -E"
alias x="exit"
alias gi='(){ cd $(ghq root)/$(ghq list | peco --query "$*") }' # require `brew install ghq peco`
alias gg='(){ ghq get -u -p $1 && $(ghq root)/github.com/$_ }'
alias gho='(){ gh repo view --web $(ghq list | peco --query "$*" | cut -d "/" -f2,3) }' # require `brew install ghq peco`
alias ghb="gh repo view --web"
alias mv="mv -i"
alias rm="mv2trash"
alias grm="/usr/local/bin/grm" # overwite "git rm" alias from git.plugin.zsh, require `brew install coreutils`
alias mysql="mysql --pager='less -S -n -i -F -X' --auto-rehash"
alias pst="/Applications/PhpStorm.app/Contents/MacOS/phpstorm"
alias chm="open -a \"Google Chrome\""
alias diff="colordiff"
alias it='(){ mv $1 ~/Music/iTunes/iTunes\ Media/Automatically\ Add\ to\ iTunes.localized/ }'
alias brew-cask-cleanup='for c in /usr/local/Caskroom/*; do vl=(`ls -t $c`) && for v in "${vl[@]:1}"; do grm -rf "$c/$v"; done; done'
alias ql='qlmanage -p "$@" >& /dev/null'
alias tree="tree -N"
alias date-to-time='(){ date -j -f "%Y-%m-%d %H:%M:%S" "$1" +%s }'
alias time-to-date='(){ date -r $1 +"%Y-%m-%d %H:%M:%S" }'
alias hl='(){ pbpaste | highlight -O rtf -S $1 -s "molokai" -k "Menlo" -K 24 | pbcopy }'
alias psy="psysh"
alias sed="gsed"
alias sf="bin/console"
alias pu="bin/phpunit --stop-on-failure"
alias chrome='open -a "Google Chrome"'
alias zenn-slug="php -r 'echo substr(md5(uniqid()), 0, 14);' | pbcopy"
alias add-bom='(){ echo -ne "\xef\xbb\xbf" | cat - $1 > $1.bom.csv }'
alias beep='for i in {1..3}; do afplay /System/Library/Sounds/Glass.aiff; done'
alias lg="lazygit"
