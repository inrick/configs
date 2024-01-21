umask 022

export PATH=~/.bin:~/local/bin:$PATH
export MANPATH=~/local/share/man:$MANPATH
export EDITOR=nvim
export PAGER=less
export VISUAL=nvim
export BROWSER=chromium-default
export MANWIDTH=80
export QT_PLUGIN_PATH=~/.qtplugins:$QT_PLUGIN_PATH
# Disable QT_QPA_PLATFORMTHEME when running KDE
#export QT_QPA_PLATFORMTHEME=qt5ct
export WINEDLLOVERRIDES="mscoree=d;mshtml=d"
export GTK_OVERLAY_SCROLLING=0
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Add Go and Rust paths
export GOPATH=~/local/go
export GOBIN=~/local/go/bin
export CARGO_TARGET_DIR=~/.cargo/target
export PATH=$GOBIN:~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin:$PATH
export MANPATH=~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/share/man:$MANPATH
