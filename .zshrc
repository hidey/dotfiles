export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8

## Backspace key
#
bindkey "^?" backward-delete-char

#path
typeset -U path cdpath fpath manpath
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=({/usr/local,/usr,}/sbin(N-/))
path=(/usr/local/bin(N-/) ~/bin(N-/) ${path})
path=(${path} ~/Library/Python/2.7/bin)
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

# powerline
. ~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh

## PRのページを開く
propen() {
    local current_branch_name=$(git symbolic-ref --short HEAD | xargs perl -MURI::Escape -e 'print uri_escape($ARGV[0]);')
    hub browse -- pull/${current_branch_name}
}

export JAVA7_HOME=$(/usr/libexec/java_home -v 1.7)
export JAVA8_HOME=$(/usr/libexec/java_home -v 1.8)
export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt share_history
setopt hist_ignore_dups

## for perl
#export PATH="${HOME}/.plenv/shims:${PATH}"
#if which plenv > /dev/null; then eval "$(plenv init -)"; fi

## for ruby
# rbenv
if [ -d ${HOME}/.rbenv  ] ; then
    export PATH="${HOME}/.rbenv/bin:${HOME}/.rbenv/shims:${PATH}"
    eval "$(rbenv init - --no-rehash)"
fi

if [ -s "$HOME/.rvm/scripts/rvm" ]; then
    source "$HOME/.rvm/scripts/rvm"
elif [ -x `which gem` ]; then
          PATH="`gem env | perl -ne 'print $1 if /EXECUTABLE DIRECTORY: (.+)$/'`":$PATH
fi

## alias設定
#
[ -f ~/.zshrc.alias ] && source ~/.zshrc.alias
## local固有設定
#
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

alias dl=docker ps -l -q
