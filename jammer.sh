#!/bin/bash
# Menu hybride : choix entre mode "classique" (dialog) ou "fun" (fzf)

set -e

DIALOG_MODE="dialog"
FUN_MODE="fzf"

check_dependencies() {
  base_deps=(python3)
  dialog_deps=(dialog)
  fun_deps=(fzf figlet lolcat)

  for dep in "${base_deps[@]}" "${dialog_deps[@]}" "${fun_deps[@]}"; do
    if ! command -v "$dep" &>/dev/null; then
      echo "[!] $dep manquant. Installe avec : apt install $dep"
      exit 1
    fi
  done
}

choose_ui_mode() {
  clear
  figlet "JAM TOOL by TRHACKNON" | lolcat
  echo -e "\nBienvenue dans JamTool, ton brouilleur mobile" | lolcat
  echo -e "\nJamTool, repo: https://github.com/trh4ckn0n/multi-jam" | lolcat
  echo -e "\nChoisis ton style de menu :\n" | lolcat

  echo -e "1. Classique (dialog) : sérieux et stable"
  echo -e "2. Stylé (fzf)       : fun et animé\n"

  read -p "Ton choix [1/2] > " style

  case "$style" in
    2) run_fzf_menu ;;
    *) run_dialog_menu ;;
  esac
}

run_dialog_menu() {
  while true; do
    CHOICE=$(dialog --clear --backtitle "JamTool by TRHACKNON- Mobile Jammer" \
      --title "Sélection de module" \
      --menu "Choisissez une technologie à brouiller :" 15 50 5 \
      1 "Wi-Fi Jammer" \
      2 "Bluetooth Jammer" \
      3 "GSM Jammer (SDR)" \
      4 "Mode Monitor Bluetooth" \
      5 "Quitter" \
      3>&1 1>&2 2>&3)

    case "$CHOICE" in
      1) python3 wifi_jammer.py ;;
      2) python3 bluetooth_jammer.py ;;
      3) python3 gsm_jammer.py ;;
      4) python3 bluetooth_scanner.py ;;  # Ajout de l'option pour le mode monitor
      5) clear; exit 0 ;;
    esac
  done
}

run_fzf_menu() {
  while true; do
    clear
    figlet -f slant "JAM TOOL by TRHACKNON" | lolcat
    echo -e "\n> Mobile Network Jammer by TRHACKNON | Sélectionne ton arme\n" | lolcat
    echo -e "\nJamTool, repo: https://github.com/trh4ckn0n/multi-jam" | lolcat

    choice=$(printf "%s\n" \
      "Wi-Fi Jammer : Détection + déauth" \
      "Bluetooth Jammer : Scan + flood" \
      "GSM Jammer : SDR scan + fake attack" \
      "Mode Monitor Bluetooth : Affichage des périphériques Bluetooth" \
      "Quitter" | \
      fzf --height 40% --reverse --border --color=16 --prompt="JamTool > ")

    case "$choice" in
      *Wi-Fi*) python3 wifi_jammer.py ;;
      *Bluetooth*) python3 bluetooth_jammer.py ;;
      *GSM*) python3 gsm_jammer.py ;;
      *"Mode Monitor Bluetooth"*) python3 bluetooth_scanner.py ;;  # Ajout de l'option pour le mode monitor
      *Quitter*) echo "A bientôt, Hacker!" | lolcat; exit 0 ;;
    esac

    echo -e "\n[Retour au menu dans 3s...]" | lolcat
    sleep 3
  done
}

check_dependencies
choose_ui_mode
