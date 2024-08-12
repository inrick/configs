umask 022

export PATH=~/.bin:~/local/bin:$PATH
export MANPATH=~/local/share/man:$MANPATH
export EDITOR=nvim
export PAGER=less
export VISUAL=nvim
export BROWSER=firefox-default
export MANWIDTH=80
# Disable QT_QPA_PLATFORMTHEME when running KDE
export QT_QPA_PLATFORMTHEME=qt6ct
export QT_QPA_PLATFORM=wayland
export QT_WAYLAND_DECORATION=adwaita
export WINEDLLOVERRIDES="mscoree=d;mshtml=d"
export GTK_OVERLAY_SCROLLING=0
#export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"
export MOZ_ENABLE_WAYLAND=1

# Add Go and Rust paths
export GOPATH=~/local/go
export GOBIN=~/local/go/bin
export CARGO_TARGET_DIR=~/.cargo/target
export PATH=$GOBIN:~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin:$PATH
export MANPATH=~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/share/man:$MANPATH
