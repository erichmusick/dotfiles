# Reload the shell configuration
alias zshrc="source $HOME/.zshrc"

alias ls='ls -GFh'

# git
# Remove untracked files and directories
alias clean='git clean --force -X -d'
alias git-cleanup='git checkout master && comm -12 <(git branch | sed "s/ *//g") <(git remote prune origin | sed "s/^.*origin\///g") | xargs -L1 -J % git branch -D %'
alias g='git'

# Enable `cd` directly into subdirectories of ~/ and ~/dev/
CDPATH=.:~:~/dev/

# Hm ... I'm using tomorrow night, but overriding some of the colors?!
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

export PATH="/opt/homebrew/opt/php@8.0/bin:$PATH"
export PATH="/opt/homebrew/opt/php@8.0/sbin:$PATH"