#!/usr/bin/env bash

# Prevent direct execution (must be run via install.sh)
if [ -z "$WORKSPACE_INSTALLER" ]; then
  echo "This script must be run via install.sh"
  exit 1;
fi

# Load package manager implementation
. "$INSTALLER_ROOT/pm/brew.sh"

# brew package manager installation
install_brew() {
  if confirm_install "Installing brew package manager"; then
    curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
  else
    echo "Skipped installing brew."
  fi
}

# Xcode command-line Tools installation
install_command_line_tools() {
  if confirm_install "Installing xcode command-line Tools (clang, make, git)"; then
    xcode-select --install
  else
    echo "Skipped installation xcode command-line Tools"
  fi
}

# Development tools installation
install_dev_tools() {
  local packages=(cmake neovim)

}

# Lua ecosystem installation
install_lua_ecosystem() {
  local packages=(lua luajit luarocks)
  install_packages "Lua Ecosystem" packages[@]
}

# Common utilities installation
install_utilities() {
  local packages=(tmux wget nano mc)
  install_packages "Utilities" packages[@]
}

# Verilog tools installation
install_verilog() {
  local packages=("icarus-verilog")
  install_packages "Verilog tools" packages[@]
}

# Show interactive menu
show_menu() {
  echo "================================="
  echo "  workspace-installer macOS"
  echo "================================="
  echo "1) Brew package manager (recommended)"
  echo "2) Xcode command-line Tools"
  echo "3) Lua Ecosystem"
  echo "4) Utilities"
  echo "5) Verilog"
  echo "6) Install All"
  echo "0) Exit"
  echo "================================="
  echo -n "Enter your choice [0-6]: "
}

# Main menu loop
while true; do
  show_menu
  read -r choice
  case "$choice" in
    1) install_brew;;
    2) install_command_line_tools;;
    3) install_lua_ecosystem;;
    4) install_utilities;;
    5) install_verilog;;
    6) install_brew
       install_command_line_tools
       install_lua_ecosystem
       install_utilities
       install_verilog;;
    0) exit 0;;
    *) echo "Invalid choice";;
  esac
  echo -e ""
  echo "Press Enter to continue..."
  read -r
  clear
done
