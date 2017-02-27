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
alias cw="cd ~/work"
alias cg="cd ~/git"
alias mv="mv -i"
alias rm="gmv -f -b -t ~/.Trash"    # require `brew install coreutils`
alias mysql="mysql --pager='less -S -n -i -F -X' --auto-rehash"
alias pst="phpstorm"
alias ql="qlmanage -p"
alias chm="open -a \"Google Chrome\""
alias atom="open -a Atom"
alias diff="git diff"
alias hubb="hub browse"
alias hubpr="hub pull-request"
alias ydl="youtube-dl -x --audio-format=mp3"
alias it='(){ mv $1 ~/Music/iTunes/iTunes\ Media/Automatically\ Add\ to\ iTunes.localized/ }'
alias brew-cask-cleanup='for c in /usr/local/Caskroom/*; do vl=(`ls -t $c`) && for v in "${vl[@]:1}"; do grm -rf "$c/$v"; done; done'
alias ql='qlmanage -p "$@" >& /dev/null'
alias docker-ps='docker ps | peco | cut -d " " -f 1'
