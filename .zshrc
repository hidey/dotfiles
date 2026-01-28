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
path=(/opt/homebrew/bin(N-/) ~/bin(N-/) ${path})
path=(${path} ~/.local/bin)
path=(${path} $(brew --prefix)/sbin)

#completion
[ -f ~/.zsh-completions ] && fpath=(~/.zsh-completions $fpath)
[ -f /opt/homebrew/bin/brew ] && fpath=($(brew --prefix)/share/zsh/site-functions $fpath)

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
powerline_zsh=""
# pipx
powerline_pipx=(~/.local/pipx/venvs/powerline-status/lib/python*/site-packages/powerline/bindings/zsh/powerline.zsh(N))
if [[ -n "$powerline_pipx" ]]; then
    powerline_zsh="$powerline_pipx[1]"
# pip (user)
elif [[ -f ~/.local/lib/python*/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    powerline_pip=(~/.local/lib/python*/site-packages/powerline/bindings/zsh/powerline.zsh(N))
    powerline_zsh="$powerline_pip[1]"
# homebrew
elif [[ -f /opt/homebrew/lib/python*/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    powerline_brew=(/opt/homebrew/lib/python*/site-packages/powerline/bindings/zsh/powerline.zsh(N))
    powerline_zsh="$powerline_brew[1]"
fi

if [[ -n "$powerline_zsh" ]]; then
    . "$powerline_zsh"
fi

## PRのページを開く (gh CLI)
alias propen='gh pr view --web'

export JAVA17_HOME=$(/usr/libexec/java_home -v 17)
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH="${JAVA_HOME}/bin:${PATH}"

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt share_history
setopt hist_ignore_dups

## for ruby
# rbenv
if [ -d ${HOME}/.rbenv  ] ; then
    export PATH="${HOME}/.rbenv/bin:${HOME}/.rbenv/shims:${PATH}"
    eval "$(rbenv init - --no-rehash)"
fi

export HOMEBREW_NO_ANALYTICS=1

if [ -d /usr/local/sbin ]; then
    PATH="/usr/local/sbin:$PATH"
fi
if [ -d /usr/local/opt/openssl ]; then
    PATH="/usr/local/opt/openssl/bin:$PATH"
fi

## fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## alias設定
#
[ -f ~/.zshrc.alias ] && source ~/.zshrc.alias
## local固有設定
#
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

alias dl='docker ps -l -q'
alias ll="ls -l"

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
