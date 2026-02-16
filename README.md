# LinuxLab-Online 🚀

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

# 🏗 Project Structure

linux-online/

├── linuxlab-online-v1/
│   ├── Dockerfile
│   ├── lab.sh
│   ├── setup_OS.sh
│   └── start.sh
│
└── linuxlab-online-fast/
    ├── Dockerfile
    ├── lab.sh
    └── start.sh

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
