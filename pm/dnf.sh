pm_update() {
  dnf update -y
}

pm_upgrade() {
  dnf upgrade -y
}

pm_install() {
  dnf install -y "$@"
}
