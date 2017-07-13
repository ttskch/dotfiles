alias s="source ~/.zshrc"
alias ls="gls --color=auto"     # require `brew install coreutils`
alias ll="ls -l"
alias la="ls -a"
alias lla="ll -a"
alias vi="vim"
alias more="less"
alias ip-release="sudo ipconfig set en0 BOOTP"
alias ip-new="sudo ipconfig set en0 DHCP"
alias cp="cp -p"
alias mkdir="mkdir -p"
alias find="find -E"
alias x="exit"
alias gi='(){ cd $(ghq root)/$(ghq list | peco --query "$*") }'    # require `brew install ghq peco`
alias gh='(){ hub browse $(ghq list | peco --query "$*" | cut -d "/" -f2,3) }'    # require `brew install ghq peco`
alias gg='(){ ghq get -u -p $1 && $(ghq root)/github.com/$_ }'
alias hubb="hub browse"
alias hubpr="hub pull-request"
alias mv="mv -i"
alias rm="gmv -f -b -t ~/.Trash"    # require `brew install coreutils`
alias mysql="mysql --pager='less -S -n -i -F -X' --auto-rehash"
alias pst="pstorm"
alias ql="qlmanage -p"
alias chm="open -a \"Google Chrome\""
alias atom="open -a Atom"
alias diff="git diff"
alias ydl="youtube-dl -x --audio-format=mp3"
alias it='(){ mv $1 ~/Music/iTunes/iTunes\ Media/Automatically\ Add\ to\ iTunes.localized/ }'
alias brew-cask-cleanup='for c in /usr/local/Caskroom/*; do vl=(`ls -t $c`) && for v in "${vl[@]:1}"; do grm -rf "$c/$v"; done; done'
alias ql='qlmanage -p "$@" >& /dev/null'
alias phpv="switch-php-version"
alias tree="tree -N"
alias date-to-time='(){ date -j -f "%Y-%m-%d %H:%M:%S" "$1" +%s }'
alias time-to-date='(){ date -r $1 +"%Y-%m-%d %H:%M:%S" }'
