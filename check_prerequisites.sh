#!/bin/bash

echo "🔍 Checking LinuxLab-Online Prerequisites..."
echo "--------------------------------------------"

# 1️⃣ Check Docker Installation
if command -v docker &> /dev/null
then
    echo "✅ Docker is installed."
else
    echo "❌ Docker is NOT installed."
    echo "👉 Install Docker using:"
    echo "   https://docs.docker.com/get-docker/"
fi

# 2️⃣ Check Docker Service Status
if systemctl is-active --quiet docker
then
    echo "✅ Docker service is running."
else
    echo "❌ Docker service is NOT running."
    echo "👉 Start Docker using:"
    echo "   sudo systemctl start docker"
fi

# 3️⃣ Check Docker Group Permission
if groups $USER | grep -q '\bdocker\b'
then
    echo "✅ User is in docker group."
else
    echo "❌ User is NOT in docker group."
    echo "👉 Add user to docker group using:"
    echo "   sudo usermod -aG docker $USER"
    echo "   Then logout and login again."
fi

# 4️⃣ Check Port 7681
if ss -tuln | grep -q ':7681'
then
    echo "⚠️ Port 7681 is already in use."
else
    echo "✅ Port 7681 appears available."
fi

echo "--------------------------------------------"
echo "✔ Prerequisite check completed."
