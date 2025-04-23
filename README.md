# JamTool by TRHACKNON- Mobile Jammer

![Logo HackRF CLI](https://h.top4top.io/p_3400wd9lq0.jpg)

JamTool est un outil multifonction permettant de brouiller diverses technologies mobiles, telles que le Wi-Fi, Bluetooth et GSM. Il propose une interface utilisateur simple mais flexible avec deux modes de menu : un mode classique basé sur `dialog` et un mode plus stylisé utilisant `fzf`. 

## Fonctionnalités

- **Wi-Fi Jammer** : Permet de désauthentifier les périphériques connectés à un réseau Wi-Fi spécifié.
- **Bluetooth Jammer** : Permet de brouiller les connexions Bluetooth proches en envoyant des paquets de données nuisibles.
- **GSM Jammer (SDR)** : Permet de scanner les réseaux GSM à l'aide d'un SDR (Software Defined Radio) et d'effectuer des attaques simulées.
- **Mode Monitor Bluetooth** : Scanne et affiche les périphériques Bluetooth à proximité.

## Dépendances

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

1. Clonez le dépôt Git sur votre machine :
   ```bash
   git clone https://github.com/trh4ckn0n/multi-jam.git
   cd multi-jam
   ```

3. Installez les dépendances système et Python (comme décrit ci-dessus).

## Utilisation

### Lancer l'outil

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

## License

Ce projet est sous la licence MIT. Voir le fichier [LICENSE](LICENSE) pour plus de détails.

## Avertissement

**Attention** : L'utilisation de cet outil peut interférer avec des réseaux et des périphériques en fonctionnement. Assurez-vous de l'utiliser dans un environnement de test et de ne pas perturber des services ou des utilisateurs non autorisés. L'auteur décline toute responsabilité en cas d'utilisation abusive de cet outil.
