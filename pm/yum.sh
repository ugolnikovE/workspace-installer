pm_update() {
  yum update -y
}

pm_upgrade() {
  yum upgrade -y
}

pm_install() {
  yum install -y "$@"
}
