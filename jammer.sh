# jammer.sh
#!/bin/bash
# Outil principal pour choisir le type de brouillage

check_dependencies() {
  for dep in dialog rfkill python3; do
    if ! command -v "$dep" &>/dev/null; then
      echo "[!] $dep manquant. Installez-le avec apt ou pkg." >&2
      exit 1
    fi
  done
}

main_menu() {
  while true; do
    CHOICE=$(dialog --clear --backtitle "JamTool - Mobile Jammer" \
      --title "Sélection de module" \
      --menu "Choisissez une technologie à brouiller :" 15 50 4 \
      1 "Wi-Fi Jammer" \
      2 "Bluetooth Jammer" \
      3 "GSM Jammer (SDR)" \
      4 "Quitter" \
      3>&1 1>&2 2>&3)

    case "$CHOICE" in
      1) python3 wifi_jammer.py ;;
      2) python3 bluetooth_jammer.py ;;
      3) python3 gsm_jammer.py ;;
      4) clear; exit 0 ;;
    esac
  done
}

check_dependencies
main_menu
