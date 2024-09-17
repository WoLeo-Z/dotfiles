echo "Reboot recommended after rebuild. \n"
sudo nix-store --gc
nix-collect-garbage -d
sudo nix-collect-garbage -d
sudo nix-collect-garbage --delete-old
sudo journalctl --vacuum-size=100M
# nix-store --optimise