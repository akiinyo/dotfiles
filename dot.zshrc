unlimit
limit core 0
limit -s

umask 022

HISTFILE=${HOME}/.zhistory
HISTSIZE=100000
SAVEHIST=100000

LANG=ja_JP.UTF-8
LC_CTYPE=ja_JP.UTF-8
LC_MESSAGES=C
EDITOR=`which vim`
PAGER=`which lv`
export PATH SHELL LANG LC_CTYPE LC_MESSAGES EDITOR
export PATH=/usr/local/bin:$PATH
export PATH=/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH
export WORDCHARS="*?_-.[]~=&;#$%^(){}<>"

alias vv="vim ~/.vimrc"
alias sc="screen"
alias be="bundle exec"

autoload -U compinit
compinit
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  psvar[1]=$vcs_info_msg_0_
}
PROMPT=$'%2F%n@%m%f %3F%~%f%1v\n%T [%(?.%?.%F{red}%?%f)]%(!.%F{red}#.$)%f%b '

bindkey -e
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

autoload -Uz is-at-least
if is-at-least 4.3.10; then
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' stagedstr "+"    # 適当な文字列に変更する
  zstyle ':vcs_info:git:*' unstagedstr "-"  # 適当の文字列に変更する
  zstyle ':vcs_info:git:*' formats '(%s)-[%b] %c%u'
  zstyle ':vcs_info:git:*' actionformats '(%s)-[%b|%a] %c%u'
fi

zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''

zstyle ':completion:*:cd:*' tag-order local-directories path-directories
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

setopt auto_list auto_menu _auto_name_dirs auto_name_dirs always_last_prompt
setopt auto_param_keys auto_pushd auto_param_slash auto_remove_slash auto_pushd
setopt hist_expire_dups_first hist_ignore_all_dups hist_reduce_blanks
setopt hist_ignore_space hist_save_no_dups magic_equal_subst inc_append_history
setopt pushd_ignore_dups printeightbit

unsetopt allexport bgnice correct_all flowcontrol promptcr

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
