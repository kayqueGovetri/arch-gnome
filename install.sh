```bash
#!/bin/bash

set -e

echo "=== Restoring Pacman packages ==="
sudo pacman -Syu --needed - < pkglist.txt

if [ -f pkglist-aur.txt ]; then
    echo "=== Installing AUR packages ==="
    if ! command -v yay &> /dev/null; then
        echo "Yay is not installed. Installing manually..."
        sudo pacman -S --needed --noconfirm base-devel git
        git clone https://aur.archlinux.org/yay.git /tmp/yay
        cd /tmp/yay && makepkg -si --noconfirm
        cd -
    fi
    yay -S --needed - < pkglist-aur.txt
fi

echo "=== Restoring GNOME settings (dconf) ==="
dconf load / < dconf-settings.ini || echo "Failed to restore dconf. Check permissions."

echo "=== Installing Flatpaks ==="
if command -v flatpak &> /dev/null && [ -f flatpak-apps.txt ]; then
    while read app; do
        echo "Installing $app"
        flatpak install -y "$app"
    done < flatpak-apps.txt
else
    echo "Flatpak not found or flatpak-apps.txt missing."
fi

echo "=== Copying themes and icons ==="
mkdir -p ~/.themes ~/.icons
cp -r themes/* ~/.themes/ || echo "No themes to copy."
cp -r icons/* ~/.icons/ || echo "No icons to copy."

echo "=== Copying application configurations ==="
cp -r config/* ~/.config/ || echo "No extra configs to copy."

echo "=== Done! Restart GNOME Shell or log out/login ==="