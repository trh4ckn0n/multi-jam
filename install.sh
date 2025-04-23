#!/bin/bash

# Couleurs
green="\e[32m"
red="\e[31m"
yellow="\e[33m"
blue="\e[34m"
bold="\e[1m"
reset="\e[0m"

# Check if gum is installed
if ! command -v gum &> /dev/null; then
  echo -e "${red}[!] Gum is not installed. Please install gum first.${reset}"
  echo "Try: go install github.com/charmbracelet/gum@latest"
  exit 1
fi

# ASCII Banner
figlet -f slant "multi-jam" | lolcat
echo -e "${bold}${yellow}by trhacknon — Interactive Setup Script${reset}\n"

# Upgrade system ?
if gum confirm "Do you want to upgrade your system before continuing?"; then
  echo -e "\n${blue}[~] Upgrading system...${reset}"
  sudo apt update && sudo apt upgrade -y
fi

# Installer les paquets APT
echo -e "\n${blue}[+] Installing system dependencies (APT)...${reset}\n"
sudo apt install -y \
  python3 python3-pip dialog aircrack-ng bluez rfkill rtl-sdr \
  gr-gsm rfcat fzf figlet lolcat hackrf gnuradio gnuradio-dev

# Check si gnuradio-companion est dispo
if apt-cache show gnuradio-companion 2>/dev/null | grep -q Package; then
  sudo apt install -y gnuradio-companion
else
  echo -e "${yellow}[!] Skipping gnuradio-companion: not found in repositories.${reset}"
fi

# Choix interactif pip
pipmode=$(gum choose \
  "Install Python modules with --break-system-packages" \
  "Install Python modules with regular pip3")

if [[ "$pipmode" == *"--break-system-packages"* ]]; then
  echo -e "\n${green}[+] Installing with --break-system-packages...${reset}"
  pip3 install numpy matplotlib scipy --break-system-packages
else
  echo -e "\n${green}[+] Installing with regular pip3...${reset}"
  pip3 install numpy matplotlib scipy
fi

# Résumé final
gum style --border double --margin "1" --padding "1 2" --border-foreground 212 \
  "Setup Complete!" \
  "All tools and Python modules are now installed." \
  "You're ready to jam, ${bold}trhacknon-style${reset}!"

echo -e "${blue}Run ./multi-jam.py or build your hacking session now.${reset}\n"
