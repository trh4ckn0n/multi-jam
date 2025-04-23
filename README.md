<div align="center">

## 💀 MULTI-JAM — HackRF CLI Toolset by <code>trhacknon</code> 𒀱

<img src="https://h.top4top.io/p_3400wd9lq0.jpg" alt="logo" width="300"/>

> 🛰️ Full-spectrum jamming & GSM sniffing suite  
> 🧠 Reverse | 🧨 Jam | 📡 Sniff | 🎯 Disrupt | ⛓️ Own

[![HackRF Jam](https://img.shields.io/badge/HackRF-Jam_by_TRHACKNON𒀱-purple?logo=hackaday)](https://github.com/trhacknon)
![Hacker Look](https://img.shields.io/badge/We_are-anonymous-ff00ff?logo=eye)
[![License](https://img.shields.io/badge/License-GPLv3-blue)](LICENSE)

</div>

---

<details>
  <summary>🕶️ <strong>Underground Tech Stack</strong> | 👤 Powered by <code>trhacknon</code> ⚡</summary>

  <br>

  ### 🛠️ Core Technologies  
  ![Python](https://img.shields.io/badge/Python-3.x-blue?logo=python)
  ![Bash](https://img.shields.io/badge/Shell-Bash-121011?logo=gnu-bash&logoColor=white)
  ![GNU Radio](https://img.shields.io/badge/GNU_Radio-SDR-red?logo=gnuradio)
  ![gr-gsm](https://img.shields.io/badge/gr--gsm-GSM_Analysis-orange)
  ![HackRF](https://img.shields.io/badge/HackRF-One-6e40c9?logo=hackaday)

  ### 🧨 Offensive Ops  
  ![HackRF Jam](https://img.shields.io/badge/Jamming%20Enabled-trhacknon-purple?logo=hackaday)
  ![Anonymous Style](https://img.shields.io/badge/Anonymous-We_are_Legion-black?logo=anonymous)
  ![HTB Ready](https://img.shields.io/badge/Hack_The_Box-Certified-green?logo=hackthebox)
  ![Metasploit](https://img.shields.io/badge/Metasploit-Ready-red?logo=metasploit)
  ![Termux](https://img.shields.io/badge/Termux-Compatible-black?logo=termux)
  ![CLI Tool](https://img.shields.io/badge/Interface-CLI-lightgrey?logo=gnome-terminal)

  ### ⚙️ Shell & Recon  
  ![fzf](https://img.shields.io/badge/fzf-integration-yellow?logo=linux)
  ![BlueZ](https://img.shields.io/badge/Bluetooth-BlueZ-0072c6?logo=bluetooth)
  ![RfCat](https://img.shields.io/badge/rfcat-ready-red?logo=usb)
  ![rtl-sdr](https://img.shields.io/badge/RTL--SDR-supported-lightblue?logo=raspberrypi)

  ### 🧪 Tested & Proven  
  ![Kali](https://img.shields.io/badge/Tested_on-Kali_Linux-blue?logo=kalilinux)
  ![Debian](https://img.shields.io/badge/Compatible-Debian/Ubuntu-green?logo=debian)

  <br>

  > 🧬 *“We are Hackers. We Jam. We Signal. We Own. We do it loud.”*

</details>

---

JamTool est un outil multifonction permettant de brouiller diverses technologies mobiles, telles que le Wi-Fi, Bluetooth et GSM. Il propose une interface utilisateur simple mais flexible avec deux modes de menu : un mode classique basé sur `dialog` et un mode plus stylisé utilisant `fzf`. 

## Fonctionnalités

- **Wi-Fi Jammer** : Permet de désauthentifier les périphériques connectés à un réseau Wi-Fi spécifié.
- **Bluetooth Jammer** : Permet de brouiller les connexions Bluetooth proches en envoyant des paquets de données nuisibles.
- **GSM Jammer (SDR)** : Permet de scanner les réseaux GSM à l'aide d'un SDR (Software Defined Radio) et d'effectuer des attaques simulées.
- **Mode Monitor Bluetooth** : Scanne et affiche les périphériques Bluetooth à proximité.

## Dépendances
![Dependances](https://img.shields.io/badge/Dependances-ff00ff)

<img src="https://h.top4top.io/p_3400eflyy0.jpg" alt="logo" width="300"/>

Avant d'exécuter le script, assurez-vous que les dépendances suivantes sont installées sur votre machine :

### Dépendances du système :
- `python3`
- `dialog`
- `fzf`
- `figlet`
- `lolcat`

### Dépendances Python :
- `pybluez` (pour le scan des périphériques Bluetooth)

Vous pouvez installer les dépendances du système en utilisant la commande suivante :

sudo apt update
sudo apt install python3 dialog fzf figlet lolcat

Pour installer la dépendance Python `pybluez` :

```bash
pip install -r requirements.txt
```
or
```bash
chmod +x install.sh
./install.sh
```

## Installation

<img src="https://e.top4top.io/p_3400i89qa0.jpg" alt="logo" width="300"/>

1. Clonez le dépôt Git sur votre machine :
   ```bash
   git clone https://github.com/trh4ckn0n/multi-jam.git
   cd multi-jam
   ```

3. Installez les dépendances système et Python (comme décrit ci-dessus).

## Utilisation

### Lancer l'outil

<img src="https://g.top4top.io/p_3400qsvl50.jpg" alt="logo" width="300"/>


Une fois les dépendances installées, vous pouvez lancer l'outil en exécutant le script `jammer.sh` :

```bash
./jammer.sh
```

### Choisir l'interface utilisateur

Vous serez invité à choisir entre deux modes de menu :

1. **Classique (dialog)** : Menu stable et simple.
2. **Stylé (fzf)** : Menu animé et interactif avec des effets visuels.

### Choisir une fonctionnalité

Après avoir choisi l'interface, vous pourrez sélectionner l'une des options suivantes :

1. **Wi-Fi Jammer** : Détection et déauthentification des périphériques connectés à un réseau Wi-Fi.
2. **Bluetooth Jammer** : Scan et flood des périphériques Bluetooth.
3. **GSM Jammer (SDR)** : Scan des réseaux GSM et attaques simulées avec un SDR.
4. **Mode Monitor Bluetooth** : Affiche les périphériques Bluetooth détectés à proximité.

### Quitter l'outil

Vous pouvez quitter le programme à tout moment en sélectionnant l'option "Quitter" dans le menu.

## HackRF Toolkit (hackrf.py)
# JamTool - Mobile RF Attacks Toolkit

![HackRF Compatible](https://img.shields.io/badge/HackRF-Compatible-blue?logo=hackaday)

Ce script tout-en-un permet d'exploiter la puissance du HackRF pour diverses opérations offensives et d'analyse de signaux radio.

### Fonctionnalités

- **Scan du spectre RF** : capture de signal I/Q, affichage du spectre, détection de pics de fréquence (> -30 dB).
- **Sniff GSM** : intégration avec `gr-gsm` pour l'écoute des communications GSM (livemon).
- **Rejouer un signal** : envoi d’un fichier I/Q à une fréquence définie avec `hackrf_transfer`.
- **Lancer GNURadio Companion** : accès à l'interface graphique pour construire des flux personnalisés.

### Dépendances

Installe-les via :

```bash
sudo apt install hackrf gnuradio gr-gsm fzf figlet lolcat python3-numpy python3-matplotlib
```

### Utilisation

Lance simplement le script :

```bash
python3 hackrf.py
```

Un menu interactif (via `fzf`) te permet de choisir l'action à effectuer.

### Exemple de capture + spectre :

```bash
python3 hackrf.py
# > Choix : Scan spectre + détection active
# > Fréquence centrale : 868000000
# > Durée : 5s
```

Une fenêtre matplotlib s’ouvre avec l’analyse spectrale.

### Dossier de captures

Les fichiers I/Q sont enregistrés automatiquement dans le dossier `captures/`.

---

## Contribution

Les contributions sont les bienvenues ! Si vous souhaitez ajouter de nouvelles fonctionnalités, corriger des bugs ou améliorer la documentation, n'hésitez pas à ouvrir une issue ou soumettre une pull request.

## ⚖️ License & Style  
  ![License](https://img.shields.io/badge/License-GPLv3-blue)
  ![Hacker Look](https://img.shields.io/badge/We_are-anonymous-ff00ff?logo=eye)
  ![DarkMode](https://img.shields.io/badge/UI-Dark_Mode_Only-black?logo=darkreader)


Ce projet est sous la licence MIT. Voir le fichier [LICENSE](LICENSE) pour plus de détails.

## Avertissement

**Attention** : L'utilisation de cet outil peut interférer avec des réseaux et des périphériques en fonctionnement. Assurez-vous de l'utiliser dans un environnement de test et de ne pas perturber des services ou des utilisateurs non autorisés. L'auteur décline toute responsabilité en cas d'utilisation abusive de cet outil.
