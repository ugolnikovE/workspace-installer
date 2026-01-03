# 🛠️ workspace-installer

A small, modular Bash-based workspace bootstrapper for Unix-like systems.

This project was originally created for personal use to quickly reproduce a working environment across different machines.

## ✨ Core Ideas

- Explicit and interactive execution flow
- Clear separation of responsibilities:
  - OS-specific logic
  - Package manager implementations
  - Shared utilities
  - Dotfiles deployment
- Designed to be easy to read, modify, and extend

## 🧩 Architecture

The installer uses a simple, modular structure:

- Single entry point
- Runtime OS detection
- Package manager abstraction layer
- OS-specific scripts loaded dynamically
- Dotfiles installation with automatic symlinks and correct ownership

```text
.
├── install.sh          # Entry point
├── utils.sh            # Shared helper functions
├── dotfiles/           # Configuration files
│   ├── nvim/
│   │   ├── init.lua
│   │   └── lua/
│   │       ├── core/
│   │       │   ├── keymaps.lua
│   │       │   ├── lazy.lua
│   │       │   └── options.lua
│   │       └── plugins/
│   │           ├── bufferline.lua
│   │           ├── cmp.lua
│   │           ├── lsp.lua
│   │           ├── lualine.lua
│   │           ├── nvim-tree.lua
│   │           ├── themes.lua
│   │           ├── toggleterm.lua
│   │           └── treesitter.lua
│   └── tmux/
│       └── tmux.conf
├── os/
│   ├── linux.sh
│   ├── freebsd.sh
│   └── macos.sh
└── pm/
    ├── apt.sh
    ├── brew.sh
    ├── dnf.sh
    ├── pacman.sh
    ├── pkg.sh
    └── yum.sh
    
```

## 🚀 Usage

Run the installer via the main entry script:

```bash
sudo ./install.sh
```
The script provides an interactive menu and asks for confirmation before performing any system-level actions.

## 💡 Motivation

I often need to set up development environments on different machines —
work VMs, local study setups, and in the future a home lab.

This project exists to make that process repeatable and predictable, while also
serving as a practical way to improve my Bash scripting and system-level skills.

## ⚠️ Notes

This project modifies system state.
Review and adapt the source code before running it on your system.
Symlinks will overwrite existing config files in the user's home directory.

## 📄 License

This project is licensed under the MIT License — see LICENSE for details.
