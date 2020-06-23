resource "null_resource" "files" {
  provisioner "local-exec" {
    command = "find | sed 's|[^/]*/|- |g'"
  }
  triggeres = {
    run_every_time = uuid()
  }
}

resource "null_resource" "env" {
  provisioner "local-exec" {
    command = "env"
  }
  triggeres = {
    run_every_time = uuid()
  }
}

resource "null_resource" "cat-backend-override" {
  provisioner "local-exec" {
    command = "cat zzz_backend_override.tf.json"
  }
  triggeres = {
    run_every_time = uuid()
  }
}

resource "null_resource" "mem-check" {
  provisioner "local-exec" {
    command = "cat /proc/meminfo | grep 'MemTotal'"
  }
  triggeres = {
    run_every_time = uuid()
  }
}

