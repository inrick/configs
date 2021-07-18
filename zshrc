setopt \
  always_to_end \
  append_history \
  auto_cd \
  auto_list \
  auto_menu \
  bash_rematch \
  complete_in_word \
  hist_ignore_dups \
  hist_ignore_space \
  inc_append_history \
  interactive_comments \
  list_types \
  no_beep \
  prompt_subst

unsetopt \
  list_ambiguous \
  multibyte

autoload -U compinit # tab completion
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case insensitive
autoload -U select-word-style
select-word-style bash
autoload -U colors
colors
autoload -Uz vcs_info
autoload -U edit-command-line
zle -N edit-command-line
autoload -U zmv

bindkey -e # -e emacs, -v vi
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
bindkey '^[[Z' reverse-menu-complete # shift-tab

stty -ixon

case "$(uname)" in
  Linux)
    alias ls='ls -F --color=auto --group-directories-first'
    alias grep='grep --color=always'
    alias pacman='pacman --color=always'
    alias pbcopy='xsel --input --clipboard'
    alias pbpaste='xsel --output --clipboard'
    ;;
  FreeBSD)
    alias ls='ls -FG'
    alias grep='grep --color=always'
    ;;
  OpenBSD)
    alias ls='ls -F';;
esac
alias l='ls -lah'
alias l1='ls -1'
alias c='cat'
alias e='$EDITOR'
alias g='git'
alias p='$PAGER'
alias gk='gitk &> /dev/null &'
alias hd='hexdump -C'
alias objd='objdump -d --disassembler-options=intel'
alias open='xdg-open'
alias o='xdg-open .'
alias cdrip='whipper cd rip --track-template="%A/%d (%y)/%t. %n" --disc-template="%A/%d (%y)/%d"'

alias -s gz=tar xvfz
alias -s bz2=tar xvfj
alias -s txt=$EDITOR

night() {
  if [[ -z "$1" ]]; then
    gsettings get org.gnome.settings-daemon.plugins.color night-light-temperature
  else
    gsettings set org.gnome.settings-daemon.plugins.color night-light-temperature $1
  fi
}

zip_epub() {
  # $1 = book_name.epub
  # mimetype has to be first in epub file and it has to be uncompressed.
  zip -Xr "$1" mimetype *
}

# man zshmisc -> PROMPT EXPANSION
precmd() { vcs_info }
zstyle ':vcs_info:*' enable git svn cvs
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats "%f[%F{green}%s:%b%f]%F{red}%m%u%c%f "
zstyle ':vcs_info:*' actionformats "%f[%F{red}%s:%b|%a%f]%F{red}%m%u%c%f "
PROMPT='%(?..%F{red}%?'$'\n'')%F{green}%m %(!.%F{red}.%F{blue})%~ ${vcs_info_msg_0_}%f'$'\n''%# '
RPROMPT=''

HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

# less colors
export LESS_TERMCAP_mb=$'\e[5m'     # start blink
export LESS_TERMCAP_md=$'\e[1m'     # start bold
export LESS_TERMCAP_us=$'\e[4m'     # start underline
export LESS_TERMCAP_so=$'\e[7;32m'  # start standout (e.g. info box)
export LESS_TERMCAP_me=$'\e[0m'     # end bold/blink/underline
export LESS_TERMCAP_se=$'\e[0m'     # end standout
export LESS_TERMCAP_ue=$'\e[0m'     # end underline
export LESS=R                       # interpret ANSI color escape sequences

if [[ -f ~/.zshrc_local ]]; then
  source ~/.zshrc_local
fi
