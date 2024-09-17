{lib, ...}:
# networking configuration
{
  networking = {
    nameservers = [
      "223.5.5.5"
      "114.114.114.114"
      "8.8.4.4"
      "1.1.1.1"
    ];

    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
      wifi.powersave = true;
    };
  };

  services = {
    openssh = {
      enable = true;
      settings.UseDns = true;
    };

    # DNS resolver
    resolved = {
      enable = true;
      dnsovertls = "opportunistic";
    };
  };

  # Don't wait for network startup
  systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;

  # Fix Error: Nexthop has invalid gateway.
  systemd.services.network-addresses-wlp2s0 = {
    after = ["dhcpcd.service"];
  };
}
