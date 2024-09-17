{
  pkgs,
  # pkgs-unstable,
  ...
}: {
  home.packages = with pkgs; [
    gnome.nautilus
    flatpak
    gnome.gnome-software # flatpak gui
    localsend
    obsidian
  ];
}
