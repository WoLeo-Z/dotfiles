{
  pkgs,
  config,
  lib,
  ...
}: {
  boot = {
    bootspec.enable = true;

    initrd = {
      systemd.enable = true;
      supportedFilesystems = ["ext4"];
    };

    # use latest kernel
    kernelPackages = pkgs.linuxPackages_latest;

    consoleLogLevel = 3;
    kernelParams = [
      # "quiet"
      "log_level=5"
      # "systemd.show_status=auto"
      "rd.udev.log_level=3"
    ];

    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        configurationLimit = lib.mkDefault 10;
        consoleMode = lib.mkDefault "max";
      };
    };

    plymouth.enable = true;

    # ddc support https://discourse.nixos.org/t/how-to-enable-ddc-brightness-control-i2c-permissions/20800
    /*
       extraModulePackages = [config.boot.kernelPackages.ddcci-driver];
    services.udev.extraRules = ''
      KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"
    '';
    */
  };

  # ddc support
  hardware.i2c.enable = true;

  environment.systemPackages = [config.boot.kernelPackages.cpupower];
}
