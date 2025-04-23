import bluetooth

def scan_bluetooth():
    print("Recherche des périphériques Bluetooth...")

    nearby_devices = bluetooth.discover_devices(lookup_names=True, lookup_uuids=True, lookup_accurate=True)
    if not nearby_devices:
        print("Aucun périphérique Bluetooth trouvé.")
    else:
        print("Périphériques Bluetooth trouvés :")
        for addr, name in nearby_devices:
            print(f"Adresse: {addr} - Nom: {name}")

if __name__ == "__main__":
    scan_bluetooth()
