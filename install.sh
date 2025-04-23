#!/bin/bash

# Couleurs
green="\e[32m"
red="\e[31m"
yellow="\e[33m"
blue="\e[34m"
bold="\e[1m"
reset="\e[0m"

# ASCII Banner
figlet -f slant "multi-jam" | lolcat
echo -e "${bold}${yellow}by trhacknon — Interactive Setup Script${reset}\n"

# APT dependencies
echo -e "${blue}[+] Installing system dependencies (APT)...${reset}\n"
sudo apt update
sudo apt install -y \
  python3 python3-pip dialog aircrack-ng bluez rfkill rtl-sdr \
  gr-gsm rfcat fzf figlet lolcat hackrf gnuradio gnuradio-dev gnuradio-companion

# Ask for pip install mode
echo -e "\n${bold}${yellow}[?] Do you want to install Python modules with --break-system-packages?${reset}"
echo -e "1) Yes, use --break-system-packages"
echo -e "2) No, use regular pip3 install"
read -p $'\n> Choose option [1/2]: ' pipmode

if [[ "$pipmode" == "1" ]]; then
  echo -e "\n${green}[+] Installing with --break-system-packages...${reset}"
  pip3 install numpy matplotlib scipy --break-system-packages
else
  echo -e "\n${green}[+] Installing with regular pip3...${reset}"
  pip3 install numpy matplotlib scipy
fi

echo -e "\n${green}[✓] Installation completed. You're ready to jam.${reset}"
