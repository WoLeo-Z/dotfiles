{
  pkgs,
  # pkgs-unstable,
  ...
}:
# media - control and enjoy audio/video
{
  home.packages = with pkgs; [
    # audio control
    pavucontrol
    playerctl
    pulsemixer
    imv # simple image viewer

    nvtopPackages.full
  ];

  programs = {
    mpv = {
      enable = true;
      defaultProfiles = ["gpu-hq"];
      # scripts = [pkgs.mpvScripts.mpris];
    };
  };

  services = {
    playerctld.enable = true;
  };
}
