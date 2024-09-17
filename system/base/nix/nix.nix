{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  # we need git for flakes
  environment.systemPackages = [pkgs.git];
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # to install chrome, you need to enable unfree packages
  nixpkgs.config.allowUnfree = lib.mkForce true;
  nixpkgs.config.allowBroken = lib.mkForce true;

  # do garbage collection weekly to keep disk usage low
  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };

  # Manual optimise storage: nix-store --optimise
  # https://nixos.org/manual/nix/stable/command-ref/conf-file.html#conf-auto-optimise-store
  nix.settings.auto-optimise-store = true;

  # nix.channel.enable = false; # remove nix-channel related tools & configs, we use flakes instead.
}
