pm_update() {
  apt-get update -y
}

pm_upgrade() {
  apt-get upgrade -y
}

pm_install() {
  apt-get install -y "$@"
}
