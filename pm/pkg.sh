pm_update() {
  pkg update -y
}

pm_upgrade() {
  pkg upgrade -y
}

pm_install() {
  pkg install -y "$@"
}
