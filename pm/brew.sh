pm_update() {
  brew update
}

pm_upgrade() {
  brew upgrade
}

pm_install() {
  brew install "$@"
}
