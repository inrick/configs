#!/bin/sh
# NOTE: The SDDM Xsession will also source ~/.zprofile when one's shell is zsh,
# see /usr/share/sddm/scripts/Xsession.
export SSH_ASKPASS='/usr/bin/ksshaskpass'

# Use 1 to force KDE open file dialogs, for instance. But it makes rendering
# terrible when using Wayland, in which case 0 is preferred.
export GTK_USE_PORTAL=0
