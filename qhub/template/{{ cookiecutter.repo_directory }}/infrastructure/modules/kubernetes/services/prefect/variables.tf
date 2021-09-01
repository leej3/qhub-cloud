terraform {
  experiments = [module_variable_optional_attrs]
}
variable "jupyterhub_api_token" {
  type    = string
  default = ""
}

variable "namespace" {
  type    = string
  default = "dev"
}

variable "prefect_token" {
  type = string
}

variable "image" {
  type    = string
  default = "prefecthq/prefect:0.14.22-python3.8"
}

variable "cloud_api" {
  type    = string
  default = "https://api.prefect.io"
}

variable "prefect_agent" {
  type  =  object({
    prefect__cloud__api = optional(string)
    image_pull_secrets = optional(string)
    prefect__cloud__agent__labels = optional(string)
  })
  default = {}
}
