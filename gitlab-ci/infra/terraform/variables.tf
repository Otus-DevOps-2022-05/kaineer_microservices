variable "cloud" {
  type        = string
  description = "Идентификатор облака"
  default     = ""
}

variable "folder_id" {
  type        = string
  description = "Каталог для размещения ресурсов"
  default     = ""
}

variable "subnet_id" {
  type        = string
  description = "Идентификатор подсети"
  default     = ""
}

variable "zone" {
  type        = string
  description = "Зона, в которой размещаются подсети"
  default     = ""
}

variable "service_account_key_file" {
  type        = string
  description = "Key file path"
  default     = ""
}

variable "boot_disk_image" {
  type = string
  description = "Docker image id"
  default = ""
}

variable "metadata_file" {
  type = string
  description = "File with user data"
  default = ""
}

variable "private_key_file" {
  type = string
  description = "File with private key"
  default = ""
}
