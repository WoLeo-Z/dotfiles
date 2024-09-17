{
  pkgs,
  # pkgs-unstable,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    # GUI apps
    # foliate # e-book viewer(.epub/.mobi/...), do not support .pdf

    # instant messaging
    telegram-desktop
    # discord
    # pkgs-unstable.qq # https://github.com/NixOS/nixpkgs/tree/master/pkgs/applications/networking/instant-messengers/qq

    # Learning
    inputs.nur-linyinfeng.packages.${pkgs.system}.wemeet
  ];

  # allow fontconfig to discover fonts and configurations installed through home.packages
  # Install fonts at system-level, not user-level
  fonts.fontconfig.enable = false;
}
