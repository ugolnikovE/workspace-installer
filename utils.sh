#!/usr/bin/env bash

check_sudo() {
  if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root or using sudo!" 1>&2
    exit 1
  fi
}

detect_os() {
  case "$(uname)" in
    Darwin)     echo "Darwin";;
    Linux)      echo "Linux";;
    FreeBSD)    echo "FreeBSD";;
    *)          echo "Unknown";;
  esac
}

detect_pm() {
  local pm
  if command -v apt-get >/dev/null; then
    echo "apt"
  elif command -v yum >/dev/null; then
    echo "yum"
  elif command -v dnf >/dev/null; then
    echo "dnf"
  elif command -v pacman >/dev/null; then
    echo "pacman"
  else
    echo "Unknown"
  fi
}

confirm_install() {
  local title="$1"
  shift
  local packages=("$@")

  echo "$title"
  echo "================================="
  for pkg in "${packages[@]}"; do
    echo " - $pkg"
  done
  echo
  read -rp "Continue? [y/N]: " ans
  [[ "$ans" =~ ^[Yy]$ ]]
}

install_dotfiles() {
  echo "Installing dotfiles..."

  if [ -n "$SUDO_USER" ]; then
    USER_OWNER="$SUDO_USER"
  else
    USER_OWNER="$USER"
  fi

  if [ "$OS" = "Darwin" ]; then
    USER_GROUP="staff"
  else
    USER_GROUP="$USER_OWNER"
  fi

  TARGET_HOME=$(eval echo "~$USER_OWNER")

  echo "Target home directory: $TARGET_HOME"
  echo "Installing as user: $USER_OWNER"

  mkdir -p "$TARGET_HOME/.config/nvim"

  ln -sf "$INSTALLER_ROOT/dotfiles/nvim/init.lua" "$TARGET_HOME/.config/nvim/init.lua"
  ln -sf "$INSTALLER_ROOT/dotfiles/nvim/lua" "$TARGET_HOME/.config/nvim/lua"

  ln -sf "$INSTALLER_ROOT/dotfiles/tmux/tmux.conf" "$TARGET_HOME/.tmux.conf"

  chown -R "$USER_OWNER":"$USER_GROUP" "$TARGET_HOME/.config/nvim"
  chown "$USER_OWNER":"$USER_GROUP" "$TARGET_HOME/.tmux.conf"

  echo "Dotfiles installed successfully!"
}
