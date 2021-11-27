# Use Ctrl+Z as interrupt instead of Ctrl+C
# This must be done before Powerlevel10k instant prompt
stty intr ^X

DISABLE_MAGIC_FUNCTIONS="true"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

function command_exists()
{
    which "$@" > /dev/null 2>&1
}

# Location for storing plugins
ZGEN_DIR="$HOME/.zgenom"

ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
ZSH_COMPDUMP=$ZSH_CACHE_DIR/.zcompdump

# Disable Oh-My-ZSH's internal updating.
DISABLE_AUTO_UPDATE=true

ZSH_AUTOSUGGEST_STRATEGY=(completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true

export EDITOR='code'
export VISUAL=${EDITOR}
export TZ='America/Los_Angeles'

# Load plugin manager
source "${HOME}/zgenom/zgenom.zsh"

if ! zgenom saved; then
  # To update the saved shell init, run `zgenom reset`
  echo "Creating a zgenom save"

  zgenom ohmyzsh

  # Prefix current or previous command with sudo by hitting ESC twice
  zgenom ohmyzsh plugins/sudo

  # Adds 'acs' alias that lists aliases grouped by plugin
  zgenom ohmyzsh plugins/aliases

  # Suggests how to install missing packages
  zgenom ohmyzsh plugins/command-not-found

  # Fuzzy history search
  # https://github.com/junegunn/fzf
  zgenom ohmyzsh plugins/fzf

  zgenom load zsh-users/zsh-syntax-highlighting
  zgenom load zsh-users/zsh-autosuggestions

  # Theme
  zgenom load romkatv/powerlevel10k powerlevel10k

  # save all to init script
  zgenom save

  # Compile your zsh files
  # zgenom compile "$HOME/.zshrc"
fi

# Source: https://github.com/zsh-users/zsh-autosuggestions/issues/351#issuecomment-483938570
# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# https://github.com/zsh-users/zsh-autosuggestions/issues/351
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(bracketed-paste accept-line)

source "$HOME/.zsh/functions.zsh"
source "$HOME/.zsh/aliases.zsh"
source "$HOME/.zsh/keybindings.zsh"

# Source all dotfiles in the ~/.zshrc.d directory
# https://github.com/unixorn/zsh-quickstart-kit/blob/master/zsh/.zshrc
if [ -n "$(/bin/ls -A ~/.zshrc.d)" ]; then
  for dotfile in $(/bin/ls -A ~/.zshrc.d)
  do
    if [ -r ~/.zshrc.d/$dotfile ]; then
      source ~/.zshrc.d/$dotfile
    fi
  done
fi

# Dedupe $PATH using a ZSH builtin
# https://til.hashrocket.com/posts/7evpdebn7g-remove-duplicates-in-zsh-path
typeset -aU path

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
