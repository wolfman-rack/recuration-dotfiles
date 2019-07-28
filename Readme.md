recuration-dotfiles
=============================


Attempt to start a trendy dotfiles habit


Configuration
----------

You probably want to edit `.stow-local-ignore`.  It already is configured to ignore the `.git` files as well as `Readme` and `Makefile`.   Use the `-n` option as in `stow -n -v --target="$HOME" -S .` to check which links will be created.  The `--adopt` option may also be useful.



Installation
-------------

dotfiles can be copied in or being adopted using: `stow -v --target="$HOME" --adopt . `.

Use `make stow` to install the dotfiles.

Use `make install` to script installation of all necessary components.

Use `make update` for updates.


Further reading
---------------

`man stow`

`man git`

`man make`
