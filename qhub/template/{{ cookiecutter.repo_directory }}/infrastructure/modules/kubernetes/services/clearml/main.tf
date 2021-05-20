resource "helm_release" "clearml" {
  name      = "clearml"
  namespace = var.namespace
  chart     = "${path.module}/chart"

  set_sensitive {
    name  = "clearmlToken"
    value = var.clearml_token
  }

  set_sensitive {
    name  = "jupyterHubToken"
    value = var.jupyterhub_api_token
  }
}
