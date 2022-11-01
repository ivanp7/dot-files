# dot-files
Portable dot-files for Arch/Artix Linux

## How to use

### 1. Fill `content` directory with dot-files.

The directory tree must be as follows.

`content/GROUP/CONFIGURATION/PATH_VARIABLE/...`

where:
* `GROUP` is a group of configurations, united according to some criterion (e.g. "xorg-apps")
* `CONFIGURATION` is a set of files, which are related to the same thing (e.g. "tmux")
* `PATH_VARIABLE` is a name of an environment variable, value of which will be used as base directory for installation (e.g. "XDG_CONFIG_HOME" will designate `$XDG_CONFIG_HOME`)

The following environment variables are provided by the script and always available:
* `$XDG_CONFIG_HOME`, defaults to `$HOME/.config`
* `$XDG_CACHE_HOME`, defaults to `$HOME/.cache`
* `$XDG_DATA_HOME`, defaults to `$HOME/.local/share`
* `$XDG_STATE_HOME`, defaults to `$HOME/.local/state`
* `$USER_BINARY_DIR`, defaults to `$HOME/.local/bin`

### 2. Write custom installation/uninstallation instructions for configurations if needed.

There are 5 supported events, each of which has its own shell instruction file:
* `content/GROUP/CONFIGURATION/install` -- run during installation of the package
* `content/GROUP/CONFIGURATION/reinstall_pre` -- run during reinstallation of the package, before old files are removed
* `content/GROUP/CONFIGURATION/reinstall_post` -- run during reinstallation of the package, after new files are copied
* `content/GROUP/CONFIGURATION/uninstall` -- run during uninstallation of the package
* `content/GROUP/CONFIGURATION/update` -- run only when `dot-files.sh update` is executed (see step 5)

Notice that `install` and `uninstall` instructions are NOT run during reinstallation!

### 3. Write custom package preprocessors (scripts in `pkg_prepare` directory)

Scripts from `pkg_prepare` directory are run sequentially in the `prepare()` function of `PKGBUILD`, after initial package tree is formed under `$srcdir`.
Their purpose is to do some content preprocessing before it is packaged (e.g. to consolidate files from some subdirectory into a single file, or to edit files automatically, etc).

### 4. Build and install the package

* Download the installer: `git submodule init && git submodule update`
* Execute the installer: `installer/install.sh`

The package name and its interface script depend on the current git branch: `dot-files-{branch}`.

### 5. Use the package

Log as a user and execute:
* `dot-files-{branch}.sh` to see list of commands
* `dot-files-{branch}.sh status` to check whether dot-files are installed for you or not
* `dot-files-{branch}.sh install` to install dot-files for you
* `dot-files-{branch}.sh reinstall` to reinstall dot-files for you
* `dot-files-{branch}.sh uninstall` to uninstall dot-files for you
* `dot-files-{branch}.sh update` to perform dot-files custom update instructions for you without reinstalling the files

Uninstallation or reinstallation of the package automatically triggers uninstallation/reinstallation of dot-files for all users, which have them installed.

