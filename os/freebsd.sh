#!/usr/bin/env bash

# Prevent direct execution (must be run via install.sh)
if [ -z "$WORKSPACE_INSTALLER" ]; then
  echo "This script must be run via install.sh"
  exit 1;
fi

# FreeBSD requires root privileges
check_sudo

# Load package manager implementation
. "$INSTALLER_ROOT/pm/pkg.sh"

# pkg package manager installation
install_pkg() {
  if confirm_install "Installing pkg package manager"; then
    env ASSUME_ALWAYS_YES=yes pkg bootstrap
  else
    echo "Skipped installing pkg."
  fi
}

# Development tools installation
install_dev_tools() {
  local packages=(gcc gdb cmake gmake neovim git)
  install_packages "Development Tools" packages[@]
}

# Lua ecosystem installation
install_lua_ecosystem() {
  local packages=(lua54 luajit lua54-luarocks)
  install_packages "Lua Ecosystem" packages[@]
}

# Common utilities installation
install_utilities() {
  local packages=(tmux wget curl nano sudo mc)
  install_packages "Utilities" packages[@]
}

# Show interactive menu
show_menu() {
  echo "================================="
  echo "  workspace-installer FreeBSD"
  echo "================================="
  echo "1) Pkg package manager (recommended)"
  echo "2) Development Tools"
  echo "3) Lua Ecosystem"
  echo "4) Utilities"
  echo "5) Install All"
  echo "0) Exit"
  echo "================================="
  echo -n "Enter your choice [0-5]: "
}

# Main menu loop
while true; do
  show_menu
  read -r choice
  case "$choice" in
    1) install_pkg;;
    2) install_dev_tools;;
    3) install_lua_ecosystem;;
    4) install_utilities;;
    5) install_pkg
       install_dev_tools
       install_lua_ecosystem
       install_utilities;;
    0) exit 0;;
    *) echo "Invalid choice";;
  esac
  echo
  read -rp "Press Enter to continue...""
  clear
done
