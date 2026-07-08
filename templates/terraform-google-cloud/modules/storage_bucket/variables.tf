variable "bucket_name" {
  type        = string
  description = "Name of the bucket."
}

variable "location" {
  type        = string
  description = "Bucket location."
}

variable "force_destroy" {
  type        = bool
  description = "Whether to allow bucket deletion with objects inside."
  default     = false
}

variable "labels" {
  type        = map(string)
  description = "Labels to assign to the bucket."
  default     = {}
}
