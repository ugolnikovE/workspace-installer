#!/usr/bin/env bash

# Prevent direct execution (must be run via install.sh)
if [ -z "$WORKSPACE_INSTALLER" ]; then
  echo "This script must be run via install.sh"
  exit 1;
fi

# Linux installer entry
echo "Start installing on Linux"

# Linux requires root privileges
check_sudo

# Detect package manager
PM="$(detect_pm)"
if [ "$PM" = "Unknown" ]; then
  echo "Unsupported package manager!"
  exit 1
fi

# Load package manager implementation
. "$INSTALLER_ROOT/pm/$PM.sh"

# System update & upgrade
prepare_system() {
  echo "System update & upgrade"
  echo "================================="

  if confirm_install "This will update and upgrade system packages"; then
    pm_update
    pm_upgrade
  else
    echo "Skipped system update."
  fi
}

# Install common and specific packages
install_packages() {
  local category="$1"
  shift
  local common=("${!1}")
  local specific=("${!2}")
  
  local packages=("${common[@]}" "${specific[@]}")
  
  if confirm_install "Installing $category" "${packages[@]}"; then
    pm_install "${packages[@]}"
  else
    echo "Skipped $category."
  fi
}

# Development tools installation
install_dev_tools() {
  local common=(gcc gbd cmake make)
  local specific=()
  case $PM in
    apt) specific=(build-essential);;
    yum|dnf) specific=(kernel-devel);;
    pacman) specific=(base-devel);;
  esac
  install_packages "Development Tools" common[@] specific[@]
}

# Lua ecosystem installation
install_lua_ecosystem() {
  echo "Installing Lua Ecosystem..."
}

# Common utilities installation
install_utilities() {
  echo "Installing utilities..."
}

# Docker installation
install_docker() {
  echo "Installing docker..."
}

# Verilog tools installation
install_verilog() {
  echo "Installing verilog..."
}

# Show interactive menu
show_menu() {
  clear
  echo "================================="
  echo "  workspace-installer Linux"
  echo "================================="
  echo "1) System Update (recommended)"
  echo "2) Development Tools"
  echo "3) Lua Ecosystem"
  echo "4) Utilities"
  echo "5) Docker"
  echo "6) Verilog"
  echo "7) Install All"
  echo "0) Exit"
  echo "================================="
  echo -n "Enter your choice [0-7]: "
}

# Main menu loop
while true; do
  show_menu
  read -r choice
  case "$choice" in
    2) install_dev_tools;;
    3) install_lua_ecosystem;;
    4) install_utilities;;
    5) install_docker;;
    6) install_verilog;;
    7) prepare_system
       install_dev_tools
       install_lua_ecosystem
       install_utilities
       install_docker
       install_verilog;;
    0) exit 0;;
    *) echo "Invalid choice";;
  esac
  echo "Press Enter to continue..."
  read -r
done
