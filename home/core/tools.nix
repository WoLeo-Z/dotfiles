{pkgs, ...}: {
  home.packages = with pkgs; [
    wireguard-tools # manage wireguard vpn manually, via wg-quick
  ];

  # auto mount usb drives
  services = {
    udiskie.enable = true;
    syncthing.enable = true;
  };
}
