terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.0"
    }
  }
}


provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_container" "apache" {
  name  = "apache_server"
  image = "httpd:latest"
  ports {
    internal = 80
    external = 8080
  }
}
