#!/usr/bin/env python3
# hackrf.py - by trhacknon
# Toolkit tout-en-un : scan, sniff GSM, replay, GNURadio launch

import os
import subprocess
import sys
import tempfile
from datetime import datetime


def banner():
    os.system("clear")
    os.system("figlet -f slant 'HackRF Tool' | lolcat")
    print("\n> Toolkit avancé - trhacknon\n")


def check_deps():
    deps = ["hackrf_transfer", "grgsm_livemon", "fzf", "figlet", "lolcat", "gnuradio-companion"]
    for dep in deps:
        if not shutil.which(dep):
            print(f"[!] {dep} manquant. Installer avec apt install {dep}")
            sys.exit(1)


def fzf_menu():
    options = {
        "Scan spectre + détection active": scan_detect,
        "Sniff GSM (gr-gsm)": sniff_gsm,
        "Rejouer un signal I/Q": replay_signal,
        "Lancer analyse GNURadio": launch_gnuradio,
        "Quitter": lambda: sys.exit(0)
    }

    while True:
        banner()
        fzf_input = "\n".join(options.keys())
        selected = subprocess.run(
            "fzf --reverse --prompt='Choix > '", input=fzf_input,
            text=True, shell=True, capture_output=True
        ).stdout.strip()

        action = options.get(selected)
        if action:
            action()
            input("\n[Entrée pour revenir au menu] ")
        else:
            print("[!] Choix invalide")


def scan_detect():
    freq = input("Fréquence centrale (ex: 868000000) > ")
    rate = input("Sample rate (default 2000000) > ") or "2000000"
    dur = input("Durée en secondes (default 5) > ") or "5"
    timestamp = datetime.now().strftime("%Y%m%d-%H%M%S")
    filename = f"captures/scan_{timestamp}.iq"
    samples = int(int(rate) * float(dur))

    print(f"\n[~] Capture en cours... {filename}")
    subprocess.run(["hackrf_transfer", "-f", freq, "-s", rate, "-r", filename, "-n", str(samples)])

    print("[~] Lecture du spectre...")
    import numpy as np
    import matplotlib.pyplot as plt

    with open(filename, 'rb') as f:
        raw = np.frombuffer(f.read(), dtype=np.int8)
        iq = raw[::2] + 1j * raw[1::2]

    psd, freqs = plt.psd(iq, NFFT=1024, Fs=int(rate)/1e6)
    peaks = freqs[np.where(psd > -30)]
    print(f"\n[+] Pics fréquence > -30dB : {peaks * 1e6} Hz")
    plt.show()


def sniff_gsm():
    print("\n[~] Démarrage grgsm_livemon sur 900MHz...")
    subprocess.run(["gnuradio-companion", "/usr/share/gr-gsm/examples/grgsm_livemon.grc"])


def replay_signal():
    iq_path = input("Fichier I/Q à rejouer > ")
    freq = input("Fréquence (ex: 433920000) > ")
    rate = input("Sample rate (default 2000000) > ") or "2000000"

    subprocess.run(["hackrf_transfer", "-t", iq_path, "-f", freq, "-s", rate, "-x", "47"])


def launch_gnuradio():
    print("\n[~] Lancement de GNURadio...")
    subprocess.run(["gnuradio-companion"])


if __name__ == "__main__":
    import shutil
    os.makedirs("captures", exist_ok=True)
    check_deps()
    fzf_menu()
