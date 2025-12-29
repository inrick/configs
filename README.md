Instructions
------------

The `setup` script creates symlinks of relevant configuration files (based on
system uname) into the user's home directory. Links are only created for files
that do not already exist. Similarly, when unlinking, the script only ever
removes links to files that point to within this repository. In other words,
it is always safe to run:

  * Run `./setup link` to symlink config files to home

  * Run `./setup unlink` to remove created symlinks.


Misc.
-----

GNOME can be configured by running `./gnome-setup`, though note that this will
overwrite existing GNOME settings.

KDE can be (partially) configured by running `./kde-setup`, but, again, note
that existing settings will be overwritten.

Remember to also [configure vim](https://github.com/inrick/Vim-config/).
