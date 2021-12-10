# dot-files
Portable dot-files for Arch/Artix Linux

## How to use

### 1. Fill `content` directory with dotfiles.

The directory tree must be as follows.

`content/GROUP/CONFIGURATION/PATH_VARIABLE/...`

where:
* `GROUP` is a group of configurations, united according to some criterion (i.e. "xorg-apps")
* `CONFIGURATION` is a set of files, which are related to the same thing (i.e. "tmux")
* `PATH_VARIABLE` is a name of an environment variable, value of which will be used as base directory for installation (i.e. "XDG_CONFIG_HOME")

### 2. Write custom installation/uninstallation instructions for configurations if needed.

There are 5 supported events, each of which has its own shell instruction file:
* `content/GROUP/CONFIGURATION/install` -- run during installation of the package
* `content/GROUP/CONFIGURATION/reinstall_pre` -- run during reinstallation of the package, before old files are removed
* `content/GROUP/CONFIGURATION/reinstall_post` -- run during reinstallation of the package, after new files are copied
* `content/GROUP/CONFIGURATION/uninstall` -- run during uninstallation of the package
* `content/GROUP/CONFIGURATION/update` -- run only when `dot-files.sh update` is executed (see step 5)

Notice that `install` and `uninstall` instructions are NOT run during reinstallation!

### 3. Write custom package processors (scripts in `pkg_prepare` directory)

Scripts from `pkg_prepare` directory are run sequentially in the `prepare()` function of `PKGBUILD`. 
Their purpose is to do some content pre-processing before it is packaged (i.e. to consolidate files from some subdirectory into a single file).

### 4. Build and install the package by executing `install.sh`

The default package name is `dot-files`, but it can be changed by editing `pkgname=` in `PKGBUILD` and `PACKAGE_NAME=` in `dot-files.install`.
Warning: name of the dot-files tool (default `dot-files.sh`) depends on the package name: it is `${PACKAGE_NAME}.sh`.

### 5. Use the package

Log as a user and execute:
* `dot-files.sh` to see list of commands
* `dot-files.sh status` to check whether dot-files are installed for you or not
* `dot-files.sh install` to install dot-files for you
* `dot-files.sh reinstall` to reinstall dot-files for you
* `dot-files.sh uninstall` to uninstall dot-files for you
* `dot-files.sh update` to perform dot-files custom update instructions for you without reinstalling the files

Uninstallation or reinstallation of the package automatically triggers uninstallation/reinstallation of dot-files for all users, which have them installed.
