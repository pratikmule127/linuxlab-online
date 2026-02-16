#!/bin/sh

images="ubuntu:latest centos/systemd:latest kalilinux/kali-rolling opensuse/leap debian:latest alpine:latest fedora:latest rockylinux/rockylinux:9 almalinux:latest archlinux:latest"

for image in $images; do
    if docker image inspect "$image" >/dev/null 2>&1; then
        echo "image exists: $image"
    else
        echo "image not found, pulling: $image"
        docker pull "$image"
    fi
done
