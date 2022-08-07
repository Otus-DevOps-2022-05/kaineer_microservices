variable "zone" {
  type        = string
  description = "Network zone"
  default     = "ru-central1-a"
}

variable "token" {
  type        = string
  description = "Authentication token"
  default     = ""
}

variable "cloud_id" {
  type        = string
  description = "Cloud ID"
  default     = ""
}

variable "folder_id" {
  type        = string
  description = "Folder ID"
  default     = ""
}

variable "service_account_key_file" {
  type        = string
  description = "Service account key file path"
  default     = ""
}

variable "boot_disk_image" {
  type        = string
  description = "Boot disk from packer image"
  default     = ""
}

variable "metadata_file" {
  type        = string
  description = "File with metadata"
  default     = "./files/metadata.yml"
}

variable "private_key_file" {
  type = string
  description = "File with private key"
  default = "/home/kaineer/.ssh/appuser"
}
