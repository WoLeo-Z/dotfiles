{lib, ...}: {
  username = "wol";
  userfullname = "WoL Zheng";
  useremail = "me@w0l.top";
  networking = import ./networking.nix {inherit lib;};
}
