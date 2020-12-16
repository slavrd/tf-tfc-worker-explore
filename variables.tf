variable "command_list" {
  description = "Map containing short command id as keys and the commands to run as values."
  type        = map(string)
  default     = {}
}
