variable "project_id" {
  type        = string
  description = "Google Cloud project ID."
}

variable "region" {
  type        = string
  description = "Primary Google Cloud region."
  default     = "asia-northeast1"
}

variable "bucket_location" {
  type        = string
  description = "Storage bucket location."
  default     = "ASIA-NORTHEAST1"
}

variable "name_prefix" {
  type        = string
  description = "Resource naming prefix."
  default     = "__PROJECT_SLUG__"
}
