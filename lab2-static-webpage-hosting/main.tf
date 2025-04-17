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

resource "docker_image" "nginx_image" {
  name = "static_site:latest"
  build {
    context = "."
  }
}

resource "docker_container" "static_site" {
  name  = "static_site"
  image = docker_image.nginx_image.name
  ports {
    internal = 80
    external = 8080
  }
}
