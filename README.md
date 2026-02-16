# LinuxLab-Online 🚀
![Docker Pulls](https://img.shields.io/docker/pulls/pratikmule127/linuxlab-online)
![Docker Image Size](https://img.shields.io/docker/image-size/pratikmule127/linuxlab-online/fast)
![MIT License](https://img.shields.io/badge/License-MIT-yellow.svg)
![Platform](https://img.shields.io/badge/platform-Docker-blue)
![Status](https://img.shields.io/badge/status-Active-brightgreen)

LinuxLab-Online is a lightweight, container-based Linux lab environment designed for learning, testing, and DevOps practice.

This project provides two versions of the lab environment:

1. linuxlab-online:v1 (Initial Setup Version)
2. linuxlab-online:fast (Optimized Startup Version)

Both images are published on Docker Hub.

------------------------------------------------------------

# 📦 Docker Images

Repository:
pratikmule127/linuxlab-online

Available Tags:

- v1
- fast

Pull the images:

docker pull pratikmule127/linuxlab-online:v1
docker pull pratikmule127/linuxlab-online:fast

------------------------------------------------------------

# 🏗 Architecture Diagram

LinuxLab-Online provides a browser-based Linux lab environment using ttyd (web terminal) inside a Docker container.

The user accesses the lab via browser, which connects to ttyd running inside the container.  
Inside the container, Docker is used to manage multiple OS lab environments.

------------------------------------------------------------

                ┌──────────────────────────────┐
                │           User               │
                │         (Browser)            │
                │   http://server:7681         │
                └──────────────┬───────────────┘
                               │
                               ▼
                ┌──────────────────────────────┐
                │            ttyd              │
                │   Web Terminal Interface     │
                │  (Running inside container)  │
                └──────────────┬───────────────┘
                               │
                               ▼
        ┌──────────────────────────────────────────┐
        │      LinuxLab Docker Container           │
        │   (v1 or fast image version)             │
        │                                          │
        │   - lab.sh                               │
        │   - start.sh                             │
        │   - setup_OS.sh (v1 only)                │
        │                                          │
        │   Docker Engine (via docker.sock)       │
        └──────────────┬──────────────────────────┘
                       │
                       ▼
        ┌──────────────────────────────────────────┐
        │      Multiple OS Lab Environments        │
        │   (Ubuntu, Debian, Alpine, etc.)        │
        └──────────────────────────────────────────┘
## How It Works

1. User opens browser and connects to port 7681.
2. Browser loads ttyd web terminal interface.
3. ttyd runs inside the LinuxLab container.
4. The container has access to Docker (via docker.sock or privileged mode).
5. User can start and manage different OS lab environments.
6. In v1, setup_OS.sh prepares the OS during first startup.
7. In fast version, OS is already prepared for quicker access.
## Security Model

Recommended method:

docker run -v /var/run/docker.sock:/var/run/docker.sock

This provides controlled Docker access without full privileged mode.

Alternative method:

docker run --privileged

This gives extended container permissions but is less secure.
Use only if required.


------------------------------------------------------------

# 🔹 Version 1 (v1 – Initial Setup Version)

## Overview

This version performs full OS setup during the first container startup.

When the container runs for the first time:

- setup_OS.sh executes automatically
- Required operating systems and tools download in the background
- OS initialization takes some time
- Lab becomes accessible after setup completes

You can monitor this process using Docker logs.

## First Run Behavior

First Run:
- setup_OS.sh runs
- Background downloads occur
- Initial startup is slower
- OS components are prepared

Second Run:
- Setup already completed
- Container starts much faster
- Lab access becomes immediate

## Monitor Setup Progress

docker logs <container_name>

------------------------------------------------------------

# 🔹 Fast Version (Optimized Version)

## Overview

This version is optimized for faster startup.

In this version:

- setup_OS.sh does NOT execute at startup
- OS environment is already prepared
- Only start.sh runs directly
- Container becomes accessible much faster

## Performance Difference

v1:
- Slower first run
- Background OS loading
- Educational setup experience

fast:
- Immediate startup
- No background OS download
- Production-like performance

------------------------------------------------------------
------------------------------------------------------------

# ⚙ Prerequisites

Before running LinuxLab-Online, make sure your server or system has the following installed:

## 1️⃣ Docker Installed

Docker must be installed and running on the server.

Check Docker version:

docker --version

If Docker is not installed, install it from:
https://docs.docker.com/get-docker/

After installation, verify Docker service:

sudo systemctl status docker

------------------------------------------------------------

## 2️⃣ Docker Permissions

You should have permission to run Docker commands.

If needed, add your user to Docker group:

sudo usermod -aG docker $USER

Then log out and log back in.

------------------------------------------------------------

## 3️⃣ Open Port 7681

Make sure port 7681 is open on your server firewall.

Example (Ubuntu with UFW):

sudo ufw allow 7681

------------------------------------------------------------

## 4️⃣ Linux-Based Server Recommended

Recommended environments:

- Ubuntu Server
- Debian
- CentOS
- Any Linux distribution supporting Docker

------------------------------------------------------------
------------------------------------------------------------

# 🛠 Build Docker Images From Source

If you cloned this repository and want to build the images locally instead of pulling from Docker Hub, follow the steps below.

------------------------------------------------------------

## 🔹 Build Version 1 (Initial Setup Version)

Navigate to the v1 directory:

cd linuxlab-online-v1

Build the image:

docker build -t linuxlab-online:v1 .

Verify image:

docker images

------------------------------------------------------------

## 🔹 Build Fast Version (Optimized Version)

Navigate to the fast directory:

cd linuxlab-online-fast

Build the image:

docker build -t linuxlab-online:fast .

Verify image:

docker images

------------------------------------------------------------

## 🔹 (Optional) Tag for Docker Hub

If you want to push the image to Docker Hub, tag it using your Docker Hub username:

docker tag linuxlab-online:v1 <your-dockerhub-username>/linuxlab-online:v1
docker tag linuxlab-online:fast <your-dockerhub-username>/linuxlab-online:fast

Then push:

docker push <your-dockerhub-username>/linuxlab-online:v1
docker push <your-dockerhub-username>/linuxlab-online:fast

------------------------------------------------------------

# ▶ How To Run The Lab

You can run either version using the tag you prefer (v1 or fast).

------------------------------------------------------------

## 🔐 Recommended (More Secure Method)

This method mounts the Docker socket instead of using full privileged mode.

docker run -itd -p 7681:7681 --name linuxlab -v /var/run/docker.sock:/var/run/docker.sock pratikmule127/linuxlab-online:<v1 or fast>

Example:

docker run -itd -p 7681:7681 --name linuxlab -v /var/run/docker.sock:/var/run/docker.sock pratikmule127/linuxlab-online:<v1 or fast>

Why this is recommended:
- Avoids full privileged mode
- More controlled Docker access
- Better security practice

------------------------------------------------------------

## ⚠ Alternative (Privileged Mode)

docker run -itd \
-p 7681:7681 \
--name linuxlab \
--privileged \
pratikmule127/linuxlab-online:<v1 or fast>

This provides extended container capabilities but is less secure.
Use only if required for specific kernel-level features.

------------------------------------------------------------

# 📊 Useful Docker Commands

Check running containers:

docker ps

Check logs:

docker logs linuxlab

Stop container:

docker stop linuxlab

Remove container:

docker rm linuxlab

------------------------------------------------------------

# 🔎 Technical Difference Summary

Feature                     | v1 | fast
--------------------------- |----|------
setup_OS.sh executed        | Yes | No
First startup time          | Slow | Fast
Background OS loading       | Yes | No
Optimized for quick start   | No  | Yes
Best for learning setup     | Yes | Limited

------------------------------------------------------------

# 🎯 Use Cases

- Linux command practice
- DevOps training
- Docker experimentation
- Understanding automated OS setup
- Learning container optimization techniques

------------------------------------------------------------

# 📜 License

This project is licensed under the MIT License.
See the LICENSE file for details.
