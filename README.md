# dotfiles

Or something of that shape.

Going to borrow inspiration from https://github.com/mtaron/dotfiles.

But to start, setting up my machine.

## Usage

On a fresh machine:

```
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git

# Install rest of apps, tools
git clone https://github.com/erichmusick/dotfiles.git "$HOME/dotfiles"
cd $HOME/dotfiles

brew bundle

zsh "$HOME/dotfiles/install.zsh"
```

## Installing Iterm2 Theme

```
open iterm2/themes/TomorrowNight.itermtheme
```

Then Cmd+I, choose TomorrowNight from the picker.

TODO: Where does Iterm2 store this?

## References

* Borrowed heavily from https://github.com/mtaron/dotfiles
