#!/bin/sh
images="ubuntu:latest debian:latest alpine:latest fedora:latest opensuse/leap:latest kalilinux/kali-rolling archlinux:latest oraclelinux:latest almalinux:latest centos:stream"

for image in $images; do
    echo "Pulling $image..."
    docker pull "$image" >/dev/null 2>&1
done
