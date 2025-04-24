terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.0"
    }
  }
}

provider "docker" {
  # If you want to specify a custom Docker host, you can uncomment and modify the following line:
  # host = "tcp://<DOCKER_HOST>:<DOCKER_PORT>"

}

resource "docker_image" "web_image" {
  name = "flask_app_image"
  build {
    context    = "."
    dockerfile = "Dockerfile"
  }
}

resource "docker_container" "web_container" {
  name  = "flask_web_app"
  image = docker_image.web_image.name
  ports {
    internal = 5000
    external = 5000
  }

  restart = "unless-stopped"

  env = [
    "FLASK_APP=app.py",
    "FLASK_RUN_HOST=0.0.0.0"
  ]

  # Optionally, you can mount volumes if necessary
  # volumes {
  #   host_path      = "/path/on/host"
  #   container_path = "/path/in/container"
  # }
}


