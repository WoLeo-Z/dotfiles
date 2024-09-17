{
  pkgs,
  inputs,
  ...
}: {
  home.file.".local/share/fcitx5/themes".source = "${inputs.nur-ryan4yin.packages.${pkgs.system}.catppuccin-fcitx5}/src";

  xdg.configFile = {
    "fcitx5/profile" = {
      source = ./profile;
      # every time fcitx5 switch input method, it will modify ~/.config/fcitx5/profile,
      # so we need to force replace it in every rebuild to avoid file conflict.
      force = true;
    };
    "fcitx5/config" = {
      source = ./config;
      # every time fcitx5 switch input method, it will modify ~/.config/fcitx5/profile,
      # so we need to force replace it in every rebuild to avoid file conflict.
      force = true;
    };
    "fcitx5/conf/classicui.conf".source = ./classicui.conf;
  };

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-rime
      (fcitx5-rime.override {rimeDataPkgs = [pkgs.nur.repos.linyinfeng.rimePackages.rime-ice];})
      rime-data
      fcitx5-configtool
      # fcitx5-chinese-addons
      fcitx5-gtk
    ];
  };
}
