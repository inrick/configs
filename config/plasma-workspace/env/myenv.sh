#!/bin/sh
# NOTE: The SDDM Xsession will also source ~/.zprofile when one's shell is zsh,
# see /usr/share/sddm/scripts/Xsession.
export SSH_ASKPASS='/usr/bin/ksshaskpass'
export GTK_USE_PORTAL=1
