recuration-dotfiles
=============================


Attempt to start a trendy dotfiles habit


Configuration
----------

You probably want to edit `.stow-local-ignore`.  It already is configured to ignore the `.git` files as well as `README.md` and `Makefile`.   Use the `-n` option as in `stow -n -v --target="$HOME" -S .` to check which links will be created.  The `--adopt` option may also be useful.



Installation
-------------

dotfiles can be copied in or being adopted using: `stow -v --target="$HOME" --adopt . `.

Use `make stow` to install the dotfiles.

Use `make install` to script installation of all necessary components.

Use `make update` for updates.

Contributing
------------

Currently experimenting with "git flow".  Branches:

```
master   -> currently deployed everywhere
develop
feature/ -> branched from develop (current, tag)
bugfix/  -> branched from release/latest or develop (current, tag)
release/ -> develop to master
hotfix/  -> branched from master
support/
```

Flow
    Always using `--showcommands` to see what actual `git` commands are being executed.
    Read the output, sometimes you need to update a version or push a tag outside
    specific `git flow` commands.

Actions
    ```
    start
    finish
    publish
    track
    diff
    rebase
    checkout
    pull
    delete
    ```

Example Workflows:

* New feature request is prioritized.
  * `git flow feature start   ${my-feature-name}`
  * Complete development of the feature.
    * git add
    * git commit
  * Pull any updates from upstream
    * fetch --all, checkout develop, git pull?
    * `git flow feature checkout ${my-feature-name}`
    * `git flow feature rebase`
  * `git flow feature publish ${my-feature-name}`
  * Create pull request against develop, discuss, merge
  * `git flow feature finish  ${my-feature-name}`
    * merges local feature branch into local develop
    * delete feature branch from local and origin
    * return to develop branch

* Cut a new release
  * Make sure to refresh from origin
  * `git flow release start   ${release-version}`
    * creates new release branch from develop
  * Bump the version number now! :question:
  * `git flow release publish ${release-version}`
  * Create pull request against master, discuss, merge
  * `git flow release finish  ${release-version}`
    * release is tagged
    * merged back into develop in case any changes since start
    * delete release branch from local and origin
    * return to develop branch
  * `git push origin --tags`

Testing
-------

Lint bootstrap files with `test/lint.sh`

Build docker image with `packer build test/packer.json`
* `docker run --rm --name recuration-workstation-0 --interactive --tty --user b --workdir /home/b recuration-workstation:master /bin/bash`
* Pass `--volume recuration:/home/b` flag to create a persistent volume. Note that files are only copied from container to volume on first run when volume is created.

Test `bootstrap.yaml` locally with `ansible-playbook --connection local --inventory localhost, --become --ask-become-pass bootstrap/bootstrap.yaml`

Further reading
---------------

`man stow`

`man git`

`man make`

References
---------------------------

Created from cookiecutter template

* https://github.com/cookiecutter/cookiecutter
* https://github.com/bdcaf/cookiecutter_dotfile
