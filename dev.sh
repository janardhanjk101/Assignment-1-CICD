#!/bin/bash

echo "🔧 Updating system..."
sudo apt update && sudo apt upgrade -y

echo "📦 Installing Git, curl, and required tools..."
sudo apt install -y git curl gnupg2 ca-certificates lsb-release apt-transport-https software-properties-common

echo "🟢 Installing Node.js (v18 LTS) and npm..."
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs
node -v && npm -v

echo "🐳 Installing Docker..."
sudo apt install -y docker.io
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER

echo "✅ Docker version:"
docker --version

echo "☕ Installing Java (OpenJDK 17 for Jenkins)..."
sudo apt install -y openjdk-17-jdk

echo "🔧 Adding Jenkins key and repo..."
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "🛠️ Installing Jenkins..."
sudo apt update
sudo apt install -y jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins

echo "🧪 Jenkins is starting. It may take a minute..."
sleep 10
echo "🌐 Visit: http://localhost:8080"
echo "🔑 Initial Jenkins Admin Password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

echo "✅ Setup Complete! Please log out and log in again to apply Docker permissions (or run 'newgrp docker')."
