{
  pkgs,
  inputs,
  ...
}:
# games
# steam is at "system/desktop/game/steam.nix"
{
  home.packages = with pkgs; [
    inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
    # gamescope # SteamOS session compositing window manager
    # (lutris.override {extraPkgs = p: [p.libnghttp2];})
    minecraft
  ];

  # programs.gamescope.capSysNice = true; # https://github.com/NixOS/nixpkgs/issues/208936
}
