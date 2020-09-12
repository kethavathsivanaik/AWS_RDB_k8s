// kubernetes deployment - kubectl create deployment wordpress --image=wordpress
resource "kubernetes_deployment" "wordpress" {
  metadata {
    name = "wordpress"
    labels = {
      app = "wordpress"
      tier = "frontend"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "wordpress"
        tier = "frontend"
      }
    }

    template {
      metadata {
        labels = {
          app = "wordpress"
          tier = "frontend"
        }
      }

      spec {
        container {
          image = "wordpress"
          name  = "wordpress"
          //port = 80
        }
      }
    }
  }
}


// service wordpress - kubectl expose deployment wordpress --type=NodePort --port=80


resource "kubernetes_service" "wordpress" {
  metadata {
    name = "wordpress"
  }
  spec {
    selector = {
      app = "wordpress"
    }
    port {
        protocol = "TCP"
        port        = 80
    }

    type = "NodePort"
  }
}
