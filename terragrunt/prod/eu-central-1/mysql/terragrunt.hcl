include "root" {
  path = find_in_parent_folders()
}

include "common" {
  path = "${dirname(find_in_parent_folders())}/_common/mysql.hcl"
}

inputs = {
  instance_class = "db.t3.small"
}
