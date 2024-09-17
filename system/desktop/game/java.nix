/*
{pkgs, ...}: let
  oraclejre8-low = pkgs.oraclejre8.overrideAttrs (oldAttrs: {
    meta.priority = 10;
  });
in {
  programs.java = {
    enable = true;
    package = oraclejre8-low;
  };
}
*/
{}
