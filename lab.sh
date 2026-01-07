#!/bin/sh

LAB_TIME=3600
PADDING="                                       "

command -v figlet >/dev/null 2>&1 || {
    echo "figlet not installed"
    exit 1
}

while true
do
    clear
    echo "======================================================================================================================="
    figlet "LiNuX LaB" | sed "s/^/$PADDING/"
    echo "======================================================================================================================="
    echo -e "\e[31m==================================================\e[0m[\e[32m #Learn With Pratik \e[0m]\e[31m===============================================\e[0m"

    echo "1) Ubuntu"
    echo "2) CentOS"
    echo "3) Kali Linux"
    echo "4) OpenSUSE"
    echo "5) Debian"
    echo "6) Alpine"
    echo "7) Fedora"
    echo "8) Oracle Linux"
    echo "9) AlmaLinux"
    echo "10) Arch Linux"
    echo
    echo -n "Select Operating System: "
    read choice

    case "$choice" in
        1) OS_NAME="Ubuntu"; IMAGE="ubuntu:latest" ;;
        2) OS_NAME="CentOS"; IMAGE="centos:stream" ;;
        3) OS_NAME="Kali Linux"; IMAGE="kalilinux/kali-rolling" ;;
        4) OS_NAME="OpenSUSE"; IMAGE="opensuse/leap:latest" ;;
        5) OS_NAME="Debian"; IMAGE="debian:latest" ;;
        6) OS_NAME="Alpine"; IMAGE="alpine:latest" ;;
        7) OS_NAME="Fedora"; IMAGE="fedora:latest" ;;
        8) OS_NAME="Oracle Linux"; IMAGE="oraclelinux:latest" ;;
        9) OS_NAME="AlmaLinux"; IMAGE="almalinux:latest" ;;
        10) OS_NAME="Arch Linux"; IMAGE="archlinux:latest" ;;
        *) echo "Invalid choice"; sleep 2; continue ;;
    esac

    CONTAINER_NAME="$(echo "$IMAGE" | tr '/:' '_')_Lab_$$"

    clear
    echo "Starting Lab for Operating System: $OS_NAME"
    echo "Time Limit: 1 Hour"
    echo

    # ✅ Pull first
    docker pull "$IMAGE" >/dev/null 2>&1 || {
        echo "❌ Operating System '$OS_NAME' is not available"
        sleep 3
        continue
    }

    # ✅ Run container without privileged
    docker run -dit --name "$CONTAINER_NAME" "$IMAGE" >/dev/null 2>&1 || {
        echo "❌ Failed to start $OS_NAME"
        sleep 3
        continue
    }

    # ⏱ Timer
    ( sleep "$LAB_TIME" && docker rm -f "$CONTAINER_NAME" >/dev/null 2>&1 ) &
    TIMER_PID=$!

    # Shell
    if [ "$IMAGE" = "alpine:latest" ]; then
        docker exec -it "$CONTAINER_NAME" sh
    else
        docker exec -it "$CONTAINER_NAME" bash
    fi

    # Cleanup
    kill "$TIMER_PID" >/dev/null 2>&1
    docker rm -f "$CONTAINER_NAME" >/dev/null 2>&1
    clear
    echo
    echo "🔴 Lab session ended for $OS_NAME"
    echo "Press Enter to continue..."
    echo "Returning to main menu..."
    sleep 2
done
