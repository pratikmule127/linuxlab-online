---

# LinuxLab-Online 🚀

![Docker Pulls](https://img.shields.io/docker/pulls/pratikmule127/linuxlab-online)
![Docker Image Size](https://img.shields.io/docker/image-size/pratikmule127/linuxlab-online/fast)
![MIT License](https://img.shields.io/badge/License-MIT-yellow.svg)
![Platform](https://img.shields.io/badge/platform-Docker-blue)
![Status](https://img.shields.io/badge/status-Active-brightgreen)

**LinuxLab-Online** is a lightweight, container-based Linux lab environment designed for **learning, testing, and DevOps practice**.

It provides a **browser-based terminal interface** using `ttyd` and Docker to run multiple OS lab environments inside a single container.

---

## ⚡ Quick Start – Run Lab Instantly

No build required. Use any of these **4 commands** to run the lab immediately:

| Version | Mode                        | Command                                                                                                                       |
| ------- | --------------------------- | ----------------------------------------------------------------------------------------------------------------------------- |
| v1      | Privileged                  | `docker run -itd -p 7681:7681 --name fastlab --privileged pratikmule127/linuxlab-online:v1`                                   |
| v1      | Docker Socket (Recommended) | `docker run -itd -p 7681:7681 --name fastlab -v /var/run/docker.sock:/var/run/docker.sock pratikmule127/linuxlab-online:v1`   |
| fast    | Privileged                  | `docker run -itd -p 7681:7681 --name fastlab --privileged pratikmule127/linuxlab-online:fast`                                 |
| fast    | Docker Socket (Recommended) | `docker run -itd -p 7681:7681 --name fastlab -v /var/run/docker.sock:/var/run/docker.sock pratikmule127/linuxlab-online:fast` |

> ✅ Browser access: `http://<server-ip>:7681`
> ⚠ Privileged mode = full kernel access, less secure
> ⚠ Docker socket mode = more secure, recommended

---

## 📜 Overview

* Run multiple Linux distributions (Ubuntu, Debian, Alpine, etc.) in one container
* Learn Linux commands and DevOps tools
* Practice Docker inside Docker
* Two versions available: **v1** (full setup) and **fast** (optimized startup)

---

## 📥 Clone the Repository

If you are new to Git:

### 1️⃣ Copy Repository URL

Go to the GitHub repository and click the green **Code** button → copy the HTTPS URL.

Example:

```
https://github.com/pratikmule127/linuxlab-online.git
```

### 2️⃣ Install Git (if not installed)

```bash
# Ubuntu/Debian
sudo apt update && sudo apt install git -y

# CentOS/RHEL
sudo yum install git -y
```

### 3️⃣ Clone the Repository

```bash
git clone https://github.com/pratikmule127/linuxlab-online.git
```

---

## 🧪 Run Prerequisite Check Script

After cloning, verify system requirements:

```bash
cd linuxlab-online
chmod +x check_prerequisites.sh
./check_prerequisites.sh
```

Ensures:

* Docker installed and user has permissions
* Port 7681 is available
* Required Linux environment is ready

---

## 🐳 Docker Images

**Repository:** `pratikmule127/linuxlab-online`

**Available Tags:**

* `v1` – Initial Setup Version
* `fast` – Optimized Startup Version

**Pull images manually (optional):**

```bash
docker pull pratikmule127/linuxlab-online:v1
docker pull pratikmule127/linuxlab-online:fast
```

---

## 🏗 Architecture

```
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
        │   Docker Engine (via docker.sock)       │
        └──────────────┬──────────────────────────┘
                       │
                       ▼
        ┌──────────────────────────────────────────┐
        │      Multiple OS Lab Environments        │
        │   (Ubuntu, Debian, Alpine, etc.)        │
        └──────────────────────────────────────────┘
```

---

## 🔹 Version Differences

| Feature                   | v1   | fast    |
| ------------------------- | ---- | ------- |
| setup_OS.sh executed      | Yes  | No      |
| First startup time        | Slow | Fast    |
| Background OS loading     | Yes  | No      |
| Optimized for quick start | No   | Yes     |
| Best for learning setup   | Yes  | Limited |

---

## 🛠 Build Docker Images From Source (Optional)

### Version 1

```bash
cd linuxlab-online-v1
docker build -t linuxlab-online:v1 .
docker images
```

### Fast Version

```bash
cd linuxlab-online-fast
docker build -t linuxlab-online:fast .
docker images
```

### Push to Docker Hub (Optional)

```bash
docker tag linuxlab-online:v1 <your-dockerhub-username>/linuxlab-online:v1
docker tag linuxlab-online:fast <your-dockerhub-username>/linuxlab-online:fast
docker push <your-dockerhub-username>/linuxlab-online:v1
docker push <your-dockerhub-username>/linuxlab-online:fast
```

---

## 📊 Useful Docker Commands

* List running containers:

```bash
docker ps
```

* Check container logs:

```bash
docker logs fastlab
```

* Stop container:

```bash
docker stop fastlab
```

* Remove container:

```bash
docker rm fastlab
```

---

## 🎯 Use Cases

* Linux command practice
* DevOps training
* Docker experimentation
* Understanding automated OS setup
* Learning container optimization techniques

---

## 📜 License

This project is licensed under the **MIT License**.
See the LICENSE file for details.

---
