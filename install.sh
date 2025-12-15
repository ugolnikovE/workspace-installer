#!/usr/bin/env bash

if [ -z "$BASH_VERSION" ]; then
  echo "This installer requires bash"
  exit 1
fi

export WORKSPACE_INSTALLER=1
export INSTALLER_ROOT="$(cd "$(dirname "$0")" && pwd)"

. "$INSTALLER_ROOT/utils.sh"

# Script consts
VERSION="0.1.0"
OWNER="ugolnikovE"

# Print script information
echo "================================="
echo "workspace-installer ${VERSION}"
echo "Develop by ${OWNER}"
echo "================================="

# Detect OS
OS="$(detect_os)"
case "$OS" in
  Linux)        SCRIPT="$INSTALLER_ROOT/os/linux.sh";;
  FreeBSD)      SCRIPT="$INSTALLER_ROOT/os/freebsd.sh";;
  Darwin)       SCRIPT="$INSTALLER_ROOT/os/macos.sh";;
  *)
    echo "Unsupported OS": $OS
    exit 1
    ;;
esac

# Print detected vars
echo "Detected OS: ${OS}"
echo "Choosen script: ${SCRIPT}"
echo "================================="
echo -e ""

# Run OS-spec script
. "$SCRIPT"
