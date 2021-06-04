resource "null_resource" "files" {
  provisioner "local-exec" {
    command = "find | sed 's|[^/]*/|- |g'"
  }
  triggers = {
    run_every_time = uuid()
  }
}

resource "null_resource" "env" {
  provisioner "local-exec" {
    command = "env | sort"
  }
  triggers = {
    run_every_time = uuid()
  }
}

resource "null_resource" "cat-backend-override" {
  provisioner "local-exec" {
    command = "cat zzz_backend_override.tf*"
  }
  triggers = {
    run_every_time = uuid()
  }
}

resource "null_resource" "mem-check" {
  provisioner "local-exec" {
    command = "cat /proc/meminfo | grep 'MemTotal'"
  }
  triggers = {
    run_every_time = uuid()
  }
}

resource "null_resource" "os_version" {
  provisioner "local-exec" {
    command = "cat /etc/os-release"
  }
  triggers = {
    run_every_time = uuid()
  }
}

resource "null_resource" "run_command" {
  for_each = var.command_list
  provisioner "local-exec" {
    command = each.value
  }
  triggers = {
    run_every_time = uuid()
  }
}

