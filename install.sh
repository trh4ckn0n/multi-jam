#!/bin/bash

echo -e "\n[+] Installation des dépendances système (APT)...\n"
sudo apt update
sudo apt install -y \
  python3 python3-pip dialog aircrack-ng bluez rfkill rtl-sdr \
  gr-gsm rfcat fzf figlet lolcat hackrf gnuradio gnuradio-dev gnuradio-companion

echo -e "\n[+] Installation des modules Python (pip)...\n"
pip3 install numpy matplotlib scipy

echo -e "\n[✓] Installation terminée."
