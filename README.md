# Arch Linux + GNOME Configurations

This repository contains my personal Arch Linux and GNOME configurations, including:

- Dotfiles and XDG configs (`~/.config`, `~/.bashrc`, etc.)
- Custom GNOME themes and icons
- GNOME settings (exported via `dconf`)
- GNOME extensions
- List of Pacman and AUR packages
- List of Flatpak applications

## How to use

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/arch-config.git
   cd arch-config
   ```
2. Run the installation script:

   ```bash
   install.sh
   ```

⚠️ Make sure to review the script before running, especially if it overwrites configuration files.

## GNOME backup and restore

- Restore GNOME settings:
  `dconf load / < dconf-settings.ini`
- Extensions: install manually via GNOME Extensions or copy to `~/.local/share/gnome-shell/extensions/`
- Themes: copied to `~/.themes/`

## Flatpak

Flatpak applications listed in flatpak-apps.txt will be installed automatically.
