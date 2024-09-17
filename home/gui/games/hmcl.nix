{
  pkgs,
  # pkgs-unstable,
  ...
}: {
  home.packages = with pkgs; [
    hmcl

    # Deps
    jdk22
    openjfx22
  ];
}
