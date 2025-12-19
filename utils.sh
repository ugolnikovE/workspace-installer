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

# Install packages (need load package manager implementation)
install_packages() {
  local category="$1"
  shift
  local packages=("${!1}")

  if confirm_install "Installing $category" "${packages[@]}"; then
    pm_install "${packages[@]}"
  else
    echo "Skipped $category."
  fi
}
