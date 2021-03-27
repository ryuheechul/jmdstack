# should be in versions.tf
terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = "~> 2.0"
    }
  }
}

# should be in providers.tf
provider "kubernetes" {
  config_path = "./.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "./.kube/config"
  }
}

# should be in helm.tf
resource "kubernetes_namespace" "crossplane_system" {
  metadata {
    name = "crossplane-system"
  }
}

resource "helm_release" "crossplane" {
  name = "crossplane-system"
  namespace = kubernetes_namespace.crossplane_system.metadata[0].name
  repository = "https://charts.crossplane.io/stable"
  chart = "crossplane"
  version = "1.1.0"
}
