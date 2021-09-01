terraform {
  experiments = [module_variable_optional_attrs]
}
resource "helm_release" "prefect" {
  name      = "prefect"
  namespace = var.namespace
  chart     = "${path.module}/chart"

  set_sensitive {
    name  = "prefectToken"
    value = var.prefect_token
  }

  set_sensitive {
    name  = "jupyterHubToken"
    value = var.jupyterhub_api_token
  }

  set {
    name  = "prefectImage"
    value = var.image
  }

  set {
    name  = "namespace"
    value = var.namespace
  }

  set {
    name  = "cloudApi"
    value = var.cloud_api
  }


  set {
    type  =  object({
        prefect__cloud__api = optional(string)
        image_pull_secrets = optional(string)
        prefect__cloud__agent__labels = optional(string)
    })
    name  = "prefectAgent"
    value =  {"image_pull_secrets" = "val1"}
}

}
