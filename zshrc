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

cmd_exists() {
  command -v "$1" >/dev/null
}

case "$(uname)" in
  Linux)
    alias ls='ls -F --color=auto --group-directories-first'
    alias grep='grep --color=always'
    alias pacman='pacman --color=always'
    alias open='xdg-open'
    alias dnd='kde-inhibit --notifications'
    alias open='xdg-open'
    alias o='open .'
    case "$XDG_SESSION_TYPE" in
    x11)
      alias pbcopy='xsel --input --clipboard'
      alias pbpaste='xsel --output --clipboard'
      ;;
    wayland)
      alias pbcopy='wl-copy'
      alias pbpaste='wl-paste'
      ;;
    esac
    ;;
  FreeBSD)
    alias ls='ls -FG'
    alias grep='grep --color=always'
    ;;
  Darwin)
    alias ls='ls -FG'
    alias grep='grep --color=always'
    alias o='open .'
    alias ql='qlmanage -px >/dev/null'
    ;;
  OpenBSD)
    alias ls='ls -F';;
esac
alias l='ls -lah'
alias l1='ls -1'
alias c='cat'
alias e='$EDITOR'
alias g='git'

cmd_exists ranger  && alias f='source ranger'
cmd_exists ipython && alias p='ipython'
cmd_exists whipper && alias cdrip='whipper cd rip --track-template="%A/%d (%y)/%t. %n" --disc-template="%A/%d (%y)/%d"'
cmd_exists ncdu    && alias ncdu='ncdu --color=off'
cmd_exists mdcat   && alias mdcat='mdcat --columns=80'
if cmd_exists gitg; then
  alias gk='gitg &> /dev/null &'
elif cmd_exists gitk; then
  alias gk='gitk &> /dev/null &'
fi

alias hd='hexdump -C'
alias objd='objdump -d --disassembler-options=intel --disassembler-color=on'
alias wik='cd ~/Documents/wiki && nvim source/Toplevel/TODO.rst'
if cmd_exists rg; then
  alias rg='rg --color=always'
  alias todos='rg -w "(TODO|FIXME|XXX)"'
fi

if [[ $TERM == 'xterm-kitty' ]]; then
  if cmd_exists kitty; then
    alias icat='kitty +kitten icat'
    alias kssh='kitty +kitten ssh'
    alias rg='kitty +kitten hyperlinked_grep'
  fi
fi

zip_epub() {
  # $1 = book_name.epub
  # mimetype has to be first in epub file and it has to be uncompressed.
  zip -Xr "$1" mimetype *
}

jsondiff() {
  if [[ $# != 2 ]]; then
    echo "Usage: jsondiff <file1.json> <file2.json>"
    return 1
  fi
  nvim -d <(jq --sort-keys . "$1") <(jq --sort-keys . "$2")
}

# man zshmisc -> PROMPT EXPANSION
precmd() { vcs_info }
zstyle ':vcs_info:*' enable git svn cvs
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats "%f[%F{green}%b%f]%F{red}%m%u%c%f "
zstyle ':vcs_info:*' actionformats "%f[%F{red}%b|%a%f]%F{red}%m%u%c%f "
PROMPT='%(?..%F{red}%?'$'\n'')%F{green}%m %(!.%F{red}.%F{blue})%~ ${vcs_info_msg_0_}%f'$'\n''%# '
RPROMPT=''
TIMEFMT=$'sys %S; user %U; real %*E (%P cpu)'

HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.zsh_history

# less colors
export LESS_TERMCAP_mb=$'\e[5m'     # start blink
export LESS_TERMCAP_md=$'\e[1m'     # start bold
export LESS_TERMCAP_us=$'\e[4m'     # start underline
export LESS_TERMCAP_so=$'\e[7;32m'  # start standout (e.g. info box)
export LESS_TERMCAP_me=$'\e[0m'     # end bold/blink/underline
export LESS_TERMCAP_se=$'\e[0m'     # end standout
export LESS_TERMCAP_ue=$'\e[0m'     # end underline
export LESS=iR                      # ignore case and interpret ANSI color escape sequences

cmd_exists fzf && eval "$(fzf --zsh)"

if [[ -f ~/.zshrc_local ]]; then
  source ~/.zshrc_local
fi
