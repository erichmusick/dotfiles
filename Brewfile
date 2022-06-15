tap "homebrew/cask"
tap "microsoft/git"
cask_args appdir: "~/Applications", require_sha: true

# Some inspiration from https://github.com/driesvints/dotfiles/blob/main/Brewfile
# Binaries
brew 'coreutils' # Those that come with macOS are outdated
brew 'git'
brew 'grep'
brew 'fzf'
brew 'stow'

# Development
brew 'ansible'
brew 'composer'

# To switch versions:
# brew unlink php@7.4
# brew link php@8.0 --force
brew 'php@7.4'
brew 'php@8.0'

# Apps
cask 'adobe-acrobat-reader'
cask 'adobe-creative-cloud'
cask 'alfred'
cask 'docker'
cask 'dotnet-sdk'
cask 'karabiner-elements'
cask 'firefox'
cask 'flycut'
cask 'gimp'
cask 'git-credential-manager-core'
cask "google-chrome", args: { require_sha: false }
cask "iterm2"
cask "microsoft-office"
cask "mysqlworkbench"
cask "powershell"
cask "rectangle"
cask "signal"
cask 'slack'
cask "spotify", args: { require_sha: false }
cask "visual-studio-code"
cask 'zoom'

# TODO: To learn about
# cask 'ray'