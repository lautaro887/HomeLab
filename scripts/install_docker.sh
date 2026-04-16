#!/bin/bash
set -e

echo "=== Instalando Docker y Docker Compose en Ubuntu 22.04 ==="

sudo apt update && sudo apt upgrade -y

sudo apt install -y ca-certificates curl gnupg lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update

sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo usermod -aG docker $USER

echo ""
echo "=== Docker instalado ==="
echo "Versión de Docker: $(docker --version)"
echo "Versión de Docker Compose: $(docker compose version)"
echo ""
echo "IMPORTANTE: Cerrá sesión y volvé a entrar para aplicar los permisos de docker."
echo "O ejecutá: newgrp docker"
