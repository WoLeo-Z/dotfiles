{lib}: rec {
  mainGateway = "192.168.0.1"; # main router
  # use suzi as the default gateway
  # it's a subrouter with a transparent proxy
  defaultGateway = "192.168.0.1";
  nameservers = [
    "223.5.5.5" # AliDNS
    "119.29.29.29" # DNSPod
  ];
  prefixLength = 24;

  hostsAddr = {
    swift3 = {
      iface = "wlp2s0";
      ipv4 = "192.168.0.201";
    };
  };

  hostsInterface =
    lib.attrsets.mapAttrs
    (
      key: val: {
        interfaces."${val.iface}" = {
          useDHCP = false;
          ipv4.addresses = [
            {
              inherit prefixLength;
              address = val.ipv4;
            }
          ];
        };
      }
    )
    hostsAddr;
}
