# Dotfiles

My personal configuration files.

## Contents

| Tool | Path | Description |
|------|------|-------------|
| **Neovim** | `nvim/` | AstroNvim-based config with custom plugins |
| **Zellij** | `zellij/` | Terminal multiplexer config |
| **Starship** | `starship/` | Shell prompt theme |
| **Zsh** | `zsh/` | Shell configuration (.zshrc) |
| **Zed** | `zed/` | Editor settings, keymaps and themes |
| **GNOME Terminal** | `gnome-terminal/` | Night Owl terminal color scheme |

## Installation

### Neovim

```bash
ln -sf $(pwd)/nvim ~/.config/nvim
```

### Zellij

```bash
mkdir -p ~/.config/zellij
ln -sf $(pwd)/zellij/config.kdl ~/.config/zellij/config.kdl
```

### Starship

```bash
ln -sf $(pwd)/starship/starship.toml ~/.config/starship.toml
```

### Zsh

```bash
ln -sf $(pwd)/zsh/.zshrc ~/.zshrc
```

### Zed

```bash
mkdir -p ~/.config/zed
ln -sf $(pwd)/zed/settings.json ~/.config/zed/settings.json
ln -sf $(pwd)/zed/keymap.json ~/.config/zed/keymap.json
```

### GNOME Terminal

```bash
# Import the terminal profile
dconf load /org/gnome/terminal/legacy/profiles:/ < gnome-terminal/night-owl-term.dconf
```
