# gsm_jammer.py
#!/usr/bin/env python3
# Nécessite dongle RTL-SDR + gr-gsm ou rfcat

import os
import time

def check_sdr():
    print("[*] Détection dongle SDR...")
    result = os.popen("rtl_test -t").read()
    if "No supported devices found" in result:
        print("[!] Aucun SDR détecté.")
        exit(1)

def scan_cells():
    print("[*] Lancement de scan GSM (simulé)...")
    # À remplacer par grgsm_scanner si disponible
    time.sleep(3)
    return ["Cellule 1 - ARFCN 62", "Cellule 2 - ARFCN 124"]

def choose_cell(cells):
    for i, cell in enumerate(cells):
        print(f"{i+1}. {cell}")
    idx = int(input("Cellule cible : ")) - 1
    return cells[idx]

def fake_attack(target):
    print(f"[!] Simulation d'attaque GSM sur {target}...")
    print("-> Pour le brouillage réel, utilisez gr-gsm ou rfcat avec un HackRF ou YardStick One.")

check_sdr()
cells = scan_cells()
target = choose_cell(cells)
fake_attack(target)
