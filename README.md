# 🛠️ Workspace Installer

A small, modular Bash-based workspace bootstrapper for Unix-like systems.

This project was originally created for personal use to quickly reproduce a working environment across different machines.

## ✨ Core Ideas

- Explicit and interactive execution flow
- Clear separation of responsibilities:
  - OS-specific logic
  - Package manager implementations
  - Shared utilities
- Designed to be easy to read, modify, and extend

## 🧩 Architecture

The installer uses a simple, modular structure:

- Single entry point
- Runtime OS detection
- Package manager abstraction layer
- OS-specific scripts loaded dynamically

```text
.
├── install.sh          # Entry point
├── utils.sh            # Shared helper functions
├── os/
│   ├── linux.sh        # Linux-specific logic
│   ├── freebsd.sh      # FreeBSD-specific logic
│   └── macos.sh        # macOS-specific logic
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

## 📄 License

This project is licensed under the MIT License — see LICENSE for details.
