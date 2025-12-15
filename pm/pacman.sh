pm_update() {
  pacman -Sy
}

pm_upgrade() {
  pacman -Su
}

pm_install() {
  pacman -S "$@"
}
