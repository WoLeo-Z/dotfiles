{lib, ...}:
# default configuration shared by all hosts
{
  imports = [
    ./boot.nix
    ./lanzaboote.nix
    ./security.nix
    ./users.nix
  ];

  documentation.dev.enable = true;

  i18n = {
    defaultLocale = "zh_CN.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "zh_CN.UTF-8/UTF-8"
    ];
    extraLocaleSettings = {
      LC_ADDRESS = "zh_CN.UTF-8";
      LC_IDENTIFICATION = "zh_CN.UTF-8";
      LC_MEASUREMENT = "zh_CN.UTF-8";
      LC_MONETARY = "zh_CN.UTF-8";
      LC_NAME = "zh_CN.UTF-8";
      LC_NUMERIC = "zh_CN.UTF-8";
      LC_PAPER = "zh_CN.UTF-8";
      LC_TELEPHONE = "zh_CN.UTF-8";
      LC_TIME = "zh_CN.UTF-8";
    };
  };

  # don't touch this
  system.stateVersion = lib.mkDefault "24.05";

  time.timeZone = lib.mkDefault "Asia/Shanghai";

  # Enable in-memory compressed devices and swap space provided by the zram kernel module.
  # By enable this, we can store more data in memory instead of fallback to disk-based swap devices directly,
  # and thus improve I/O performance when we have a lot of memory.
  #
  #   https://www.kernel.org/doc/Documentation/blockdev/zram.txt
  zramSwap = {
    enable = false;
    # one of "lzo", "lz4", "zstd"
    algorithm = "zstd";
    # Priority of the zram swap devices.
    # It should be a number higher than the priority of your disk-based swap devices
    # (so that the system will fill the zram swap devices before falling back to disk swap).
    priority = 5;
    # Maximum total amount of memory that can be stored in the zram swap devices (as a percentage of your total memory).
    # Defaults to 1/2 of your total RAM. Run zramctl to check how good memory is compressed.
    # This doesn’t define how much memory will be used by the zram swap devices.
    memoryPercent = 50;
  };
}
