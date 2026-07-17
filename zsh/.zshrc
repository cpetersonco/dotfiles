eval "$(starship init zsh)"

export PYENV_VERSION=3.10.14
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# pnpm
export PNPM_HOME="/Users/cpeterson/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# brew update
function bu() {
    echo "Updating brew\n"
    brew update

    echo "Upgrading brew\n"
    brew upgrade

    echo "Cleaning up after brew\n"
    brew cleanup --prune 5

    echo "Autoremoving stuff that were only installed as dependencies of other stuff\n"
    brew autoremove

    echo "Checking whether any installed formulas are missing dependencies\n"
    brew missing
    
    echo "Checking brew status\n"
    brew doctor
}

# Optionally (when you use pyenv virtualenv)
eval "$(pyenv virtualenv-init -)"

# Created by `pipx` on 2024-06-22 19:11:50
export PATH="$PATH:/Users/cpeterson/.local/bin"
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"
export SSH_AUTH_SOCK=/Users/cpeterson/.bitwarden-ssh-agent.sock
