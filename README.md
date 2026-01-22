# LinuxLab‑Online

**A lightweight Linux lab environment container for learning, testing, and development online.** :contentReference[oaicite:1]{index=1}

## 🚀 Overview

This project provides a simple Linux lab environment inside a container so you can practice Linux commands, scripting, and system tasks without installing a full Linux OS on your machine.

- Runs inside Docker
- Easy to start/stop
- Great for beginners and testing

## 📦 Included

The repository contains:

- `Dockerfile` – Builds the Linux lab image. :contentReference[oaicite:2]{index=2}
- `docker‑compose.yml` – Run the lab with Docker Compose. :contentReference[oaicite:3]{index=3}
- `lab.sh` – Entry script to launch your environment. :contentReference[oaicite:4]{index=4}
- `setup_OS.sh` – Sets up tools inside the container. :contentReference[oaicite:5]{index=5}
- `start.sh` – Starts the container. :contentReference[oaicite:6]{index=6}

## 📌 Features

- Full shell access to a Linux environment
- Tools for file system navigation, process management, and networking
- Easy reset/restart

## 🧰 Prerequisites

Make sure you have installed:

- [Docker](https://docs.docker.com/get‑docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## 🔧 Installation & Usage

1. **Clone the repository**

   ```bash
   git clone https://github.com/pratikmule127/linuxlab‑online.git
   cd linuxlab‑online
Build the Docker image

docker build ‑t linuxlab‑online .


Start with Docker Compose

docker‑compose up ‑d


Launch the lab

./lab.sh


Stop the lab

docker‑compose down
