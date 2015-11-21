export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

PS1="[${USER}@${HOST%%.*}]%1~%(!.#.%%) "

## Backspace key
#
bindkey "^?" backward-delete-char

#path
typeset -U path cdpath fpath manpath
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=({/usr/local,/usr,}/sbin(N-/))
path=(/usr/local/bin(N-/) ~/bin(N-/) ${path})
#completion
[ -f ~/.zsh-completions ] && fpath=(~/.zsh-completions $fpath)
[ -f ~/usr/local/bin/brew ] && fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

autoload -U compinit
compinit

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst
autoload colors

# 指定したコマンド名がなく、ディレクトリ名と一致した場合 cd する
setopt auto_cd

# cd でTabを押すとdir list を表示
setopt auto_pushd

# ディレクトリスタックに同じディレクトリを追加しないようになる
setopt pushd_ignore_dups

# コマンドライン全てのスペルチェックをする
#setopt correct_all

# 上書きリダイレクトの禁止
setopt no_clobber

# 補完候補リストを詰めて表示
setopt list_packed

# 補完候補が複数ある時に、一覧表示する
setopt auto_list

# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst

# カッコの対応などを自動的に補完する
setopt auto_param_keys

# 補完キー（Tab,  Ctrl+I) を連打するだけで順に補完候補を自動で補完する
setopt auto_menu

# 色付きで補完する
zstyle ':completion:*' list-colors di=34 fi=0

# beepを鳴らさないようにする
setopt nolistbeep


autoload vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'

autoload -Uz is-at-least

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "+"    # 適当な文字列に変更する
zstyle ':vcs_info:git:*' unstagedstr "-"  # 適当の文字列に変更する
zstyle ':vcs_info:git:*' formats '(%s)-[%b] %c%u'
zstyle ':vcs_info:git:*' actionformats '(%s)-[%b|%a] %c%u'

## プロンプトにバージョン管理情報を表示
precmd () {
    psvar=()
    LANG=ja_JP.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{green}%1v%f|)"

export JAVA7_HOME=$(/usr/libexec/java_home -v 1.7)
export JAVA8_HOME=$(/usr/libexec/java_home -v 1.8)
export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt share_history
setopt hist_ignore_dups

## alias設定
#
[ -f ~/.zshrc.alias ] && source ~/.zshrc.alias
## local固有設定
#
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

