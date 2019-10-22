resource "null_resource" "files" {
  provisioner "local-exec" {
    command = "find | sed 's|[^/]*/|- |g'"
  }
}

resource "null_resource" "env" {
  provisioner "local-exec" {
    command = "env"
  }
}
