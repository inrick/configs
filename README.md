Instructions
------------

The setup script will only remove files that are linked to this path and will
only install files that do not already exist, meaning it is always safe to run:

  * run `./setup install` to symlink config files to home,

  * run `./setup remove` to remove created symlinks.


Misc.
-----

GNOME can be configured by running `./gnome-setup`, though note that this will
overwrite existing GNOME settings.

KDE can be (partially) configured by running `./kde-setup`, but, again, note
that existing settings will be overwritten.

Remember to also [configure vim](https://github.com/inrick/Vim-config/).
