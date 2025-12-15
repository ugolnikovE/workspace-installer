#!/bin/bash
. ./utils.sh

# Script consts
VERSION="0.1.0"
OWNER="ugolnikovE"

# Print script information
echo "======================================="
echo "workspace-installer ${VERSION}"
echo "Develop by ${OWNER}"
echo "======================================="

# Detect OS
OS="$(detect_os)"
case "$OS" in
  Linux)        SCRIPT="./os/linux.sh";;
  FreeBSD)      SCRIPT="./os/freebsd.sh";;
  Darwin)       SCRIPT="./os/macos.sh";;
  *)
    echo "Unsupported OS": $OS
    exit 1
    ;;
esac

# Print detected vars
echo "Detected OS: ${OS}"
echo "Choosen script: ${SCRIPT}"
echo "======================================="
echo -e "\n"

# Run OS-spec script
. "$SCRIPT"
