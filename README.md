# dotfiles

Personal macOS config: zsh, nvim (LazyVim), tmux, git, starship.

## How this works

No stow, no install script — each config lives in this repo and is symlinked
individually into place in `$HOME`. To set up on a new Mac, install
[Homebrew](https://brew.sh), then create these symlinks (paths relative to
`~/dotfiles`):

```sh
cd ~/dotfiles

ln -s "$PWD/zsh/.zshrc"    ~/.zshrc
ln -s "$PWD/zsh/.zprofile" ~/.zprofile
ln -s "$PWD/tmux/.tmux.conf" ~/.tmux.conf
ln -s "$PWD/git/.gitconfig"  ~/.gitconfig

mkdir -p ~/.config
ln -s "$PWD/starship/.config/starship.toml" ~/.config/starship.toml

mkdir -p ~/.config/nvim/lua/config ~/.config/nvim/lua/plugins
for f in .config init.lua LICENSE lazy-lock.json README.md stylua.toml lazyvim.json; do
  ln -s "$PWD/nvim/.config/nvim/$f" ~/.config/nvim/"$f"
done
for f in nvim/.config/nvim/lua/config/*.lua; do
  ln -s "$PWD/$f" ~/.config/nvim/lua/config/"$(basename "$f")"
done
for f in nvim/.config/nvim/lua/plugins/*.lua; do
  ln -s "$PWD/$f" ~/.config/nvim/lua/plugins/"$(basename "$f")"
done
```

New nvim plugin files added under `nvim/.config/nvim/lua/plugins/` need a
matching symlink created by hand (loop above only covers what existed at
setup time) — otherwise Neovim won't load them.

## Structure

| Path in repo | Symlinked to |
|---|---|
| `zsh/.zshrc` | `~/.zshrc` |
| `zsh/.zprofile` | `~/.zprofile` |
| `tmux/.tmux.conf` | `~/.tmux.conf` |
| `git/.gitconfig` | `~/.gitconfig` |
| `starship/.config/starship.toml` | `~/.config/starship.toml` |
| `nvim/.config/nvim/*` | `~/.config/nvim/*` (per-file) |

## Not tracked here (on purpose)

- `~/.iterm2_shell_integration.zsh` — iTerm2-managed and auto-updated; if you
  want it, install fresh via iTerm2's own installer rather than vendoring a
  stale copy.
- Any SSH/GPG commit signing config — machine-specific, kept local.
