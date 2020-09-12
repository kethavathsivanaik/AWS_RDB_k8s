//aws provider

provider "aws" {
  region                  = "ap-south-1"
  profile                 = "default"
}

// kubernetes provider
provider "kubernetes" {
  config_context = "minikube"
}


