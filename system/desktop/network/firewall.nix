{
  networking.firewall = {
    allowedTCPPorts = [
      # Localsend
      53317

      # Clash-Nyanpasu
      7890
      7891
    ];
    allowedUDPPorts = [
      # Localsend
      53317

      # Clash-Nyanpasu
      7890
      7891
    ];
  };
}
