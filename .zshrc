export TMPDIR="/tmp"
export TZ="JST-09"
export MAKE_MODE="unix"
export LANG="ja_JP.UTF-8"
export JLESSCHARSET="japanese-sjis"
export C_INCLUDE_PATH="/usr/include/"

PATH="/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:~/scripts:.:$PATH"
PATH="$PATH:/usr/local/share/npm/bin"   # for npm apps.
export PATH

# 補完機能の強化.
autoload -U compinit
compinit
setopt auto_param_slash     # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える.
setopt mark_dirs            # ファイル名の展開でディレクトリにマッチした場合、末尾に / を付加.
setopt list_types           # 補完候補一覧でファイルの種別を識別マーク表示.
setopt auto_menu            # 補完キー連打で順に補完候補を自動で補完.
setopt auto_param_keys      # カッコの対応などを自動的に補完.
setopt interactive_comments # コマンドラインでも # 以降をコメントと見なす.
setopt magic_equal_subst    # コマンドラインの引数で --prefix=/usr などの = 以降も補完.
setopt complete_in_word     # 語の途中でもカーソル位置で補完.
setopt always_last_prompt   # カーソル位置は保持したままファイル名一覧を順次その場で表示.
setopt extended_glob        # ファイル名で #, ~, ^ の 3 文字を正規表現として扱う.
setopt globdots             # 明確なドットの指定なしで.から始まるファイルをマッチ.
setopt brace_ccl            # {a-c} を a b c に展開する機能を使えるようにする.
setopt list_packed          # 補完候補を詰めて表示.
setopt auto_list            # 曖昧補完ですぐに補完候補を表示.

bindkey "^I" menu-complete                                          # 展開する前に補完候補を出させる(Ctrl-iで補完するようにする)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'                 # 補完時に大文字小文字を区別しない.
zstyle ':completion:*:default' menu select=1                        # 補完候補のカーソル選択を有効に.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'      # 補完候補がなければより曖昧に候補を探す.

# 補完候補を色付け. (要 brew install coreutils)
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# その他.
setopt print_eight_bit      # 日本語ファイル名等8ビットを通す.
setopt auto_resume          # サスペンド中のプロセスと同じコマンド名を実行した場合はリジューム.
setopt equals               # =command を command のパス名に展開する.
setopt numeric_glob_sort    # ファイル名の展開で辞書順ではなく数値的にソート.
setopt auto_cd              # ディレクトリ名だけで cd.
setopt correct              # スペルチェック.
setopt NO_flow_control      # Ctrl+S/Ctrl+Q によるフロー制御を使わないようにする.
setopt hist_no_store        # history (fc -l) コマンドをヒストリリストから取り除く.
setopt noautoremoveslash    # 最後のスラッシュを自動的に削除しない.

# Git コマンドの補完 (要 brew install zsh-completions)
fpath=(/usr/local/share/zsh-completions $fpath)

# プロンプト改変. (Git のブランチ情報も出力)
autoload -Uz vcs_info
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
autoload colors
colors
local p1="%F{green}[%~]%f %F{cyan}%n@%m%f"
local p2="%1(v|%F{red}%1v%f|)"
PROMPT=$p1$p2$'\n'"%% "

# エイリアス.
alias s="source ~/.zshrc"
alias ls="gls --color=auto"
alias la="ls -a"
alias ll="ls -l"
alias lla="ll -a"
alias j="jobs"
alias vi="vim"
alias em="emacs"
alias more="less"
alias ip="ifconfig"
alias cp="cp -p"
alias mkdir="mkdir -p"
alias x="exit"
alias ht="cd ~/Data/workspace/htdocs"
alias console="php app/console"
alias composer="php ~/Data/workspace/htdocs/composer.phar"
alias g="git"
alias redis-server-start="redis-server /usr/local/etc/redis.conf"
