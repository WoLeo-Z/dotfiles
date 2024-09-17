{
  pkgs,
  lib,
  inputs,
  ...
}: {
  # Proxychains
  programs.proxychains = {
    enable = true;
    package = pkgs.proxychains-ng;
    quietMode = true;

    proxies = {
      sock = {
        enable = true;
        type = "socks5";
        host = "127.0.0.1";
        port = 7890;
      };
      http = {
        enable = true;
        type = "http";
        host = "127.0.0.1";
        port = 7890;
      };
    };
  };

  # Mihomo (Also known as Clash-Meta)
  services.mihomo = {
    enable = true;
    package = pkgs.mihomo;
    # webui = inputs.nur-linyinfeng.packages.${pkgs.system}.yacd;
    tunMode = true;
    configFile = "/etc/mihomo/config.yaml";
  };

  environment.variables = {
    http_proxy = "http://127.0.0.1:7890";
    all_proxy = "http://127.0.0.1:7890";
  };

  # https://github.com/NixOS/nixpkgs/blob/nixos-unstable/nixos/modules/services/networking/mihomo.nix

  /*
  systemd.services.mihomo = {
    unitConfig = {
      Description = "Mihomo Daemon, Another Clash Kernel.";
      After = "NetworkManager-wait-online.service network.target NetworkManager.service";
    };
    serviceConfig = {
      Type = "simple";
      LimitNPROC = "500";
      LimitNOFILE = "1000000";
      CapabilityBoundingSet = "CAP_NET_ADMIN CAP_NET_RAW CAP_NET_BIND_SERVICE CAP_SYS_TIME CAP_SYS_PTRACE CAP_DAC_READ_SEARCH CAP_DAC_OVERRIDE";
      AmbientCapabilities = "CAP_NET_ADMIN CAP_NET_RAW CAP_NET_BIND_SERVICE CAP_SYS_TIME CAP_SYS_PTRACE CAP_DAC_READ_SEARCH CAP_DAC_OVERRIDE";
      ### Hardening
      DeviceAllow = "";
      LockPersonality = true;
      MemoryDenyWriteExecute = true;
      NoNewPrivileges = true;
      # PrivateDevices = true;
      PrivateMounts = true;
      PrivateTmp = true;
      #zPrivateUsers = true;
      ProcSubset = "pid";
      ProtectClock = true;
      ProtectControlGroups = true;
      ProtectHome = true;
      ProtectHostname = true;
      ProtectKernelLogs = true;
      ProtectKernelModules = true;
      ProtectKernelTunables = true;
      ProtectProc = "invisible";
      ProtectSystem = "strict";
      RestrictRealtime = true;
      RestrictSUIDSGID = true;
      RestrictNamespaces = true;
      # RestrictAddressFamilies = "AF_INET AF_INET6";
      SystemCallArchitectures = "native";
      SystemCallFilter = "@system-service bpf";
      UMask = "0077";
      PrivateDevices = false;
      PrivateUsers = false;
      # AF_UNIX
      RestrictAddressFamilies = "AF_INET AF_INET6 AF_NETLINK";
      ExecStartPre = "${pkgs.coreutils}/bin/sleep 1s";
      ExecStart = "${pkgs.mihomo}/bin/mihomo -d /etc/mihomo";
      ExecReload = "${pkgs.coreutils}/bin/kill -HUP $MAINPID";
      Restart = "on-failure";
      RestartSec = 3;
    };
    wantedBy = ["multi-user.target"];
  };
  */

  /*
  # Mihomo subscription update
  systemd.timers.mihomo-sub-update = {
    unitConfig = {
      Description = "Mihomo subscription update.";
      After = "NetworkManager-wait-online.service";
    };
    timerConfig = {
      OnCalendar = "hourly";
      Persistent = "true";
      Unit = "mihomo.service";
    };
    wantedBy = [
      "timers.target"
      "multi-user.target"
    ];
  };
  */

  # cloudflare-warp
  # A proxy client using wireguard, powered by CloudFlare.
  # Use as alternative proxy provider.
  /*
  services.cloudflare-warp = {
    enable = true;
    package = pkgs.cloudflare-warp;
    udpPort = 2408;
    openFirewall = true;
  };
  */
}
