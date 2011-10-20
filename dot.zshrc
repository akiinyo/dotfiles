unlimit
limit core 0
limit -s

umask 022

HISTFILE=${HOME}/.zhistory
HISTSIZE=100000
SAVEHIST=100000

PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/git/bin:/usr/local/mysql/bin

LANG=ja_JP.UTF-8
LC_CTYPE=ja_JP.UTF-8
LC_MESSAGES=C
EDITOR=`which vim`
PAGER=`which lv`
export PATH SHELL LANG LC_CTYPE LC_MESSAGES EDITOR

PROMPT='%n %F{blue}[%~]%f$ '

alias vv="vim ~/.vimrc"

autoload -U compinit
compinit

bindkey -e
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# v このへんだいぶおまじない
# zstyle ':completion:*' verbose yes
# zstyle ':completion:*:descriptions' format '%B%d%b'
# zstyle ':completion:*:messages' format '%d'
# zstyle ':completion:*:warnings' format 'No matches for: %d'
# zstyle ':completion:*' group-name ''
#
# zstyle ':completion:*:cd:*' tag-order local-directories path-directories
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#
# setopt auto_list auto_menu _auto_name_dirs auto_name_dirs always_last_prompt
# setopt auto_param_keys auto_pushd auto_param_slash auto_remove_slash auto_pushd
# setopt brace_ccl chase_dots extended_glob hash_cmds hash_dirs
# setopt hist_expire_dups_first hist_ignore_all_dups hist_reduce_blanks
# setopt hist_ignore_space hist_save_no_dups magic_equal_subst inc_append_history
# setopt pushd_ignore_dups printeightbit
#
# unsetopt allexport bgnice correct_all flowcontrol promptcr
# # ^ おまじない
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
