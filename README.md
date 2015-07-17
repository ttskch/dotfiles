# My dotfiles

## Installation

```bash
# clone me
$ cd ~
$ git clone git@github.com:qckanemoto/dotfiles.git
$ cd dotfiles

# if you need some local settings do below
$ cp .zsh/secret.zsh{.placeholder,}
$ cp .gitconfig.local{.placeholder,}
$ vi .zsh/secret.zsh    #
$ vi .gitconfig.local   # tailor them

# install dotfiles
$ sh symlink.sh
```
