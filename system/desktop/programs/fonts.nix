{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      # icon fonts
      material-symbols

      # Sans(Serif) fonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      roboto
      (google-fonts.override {fonts = ["Inter"];})

      # Source fonts
      source-sans # Source Sans 3 & Source Sans Pro & Source Sans 3 VF
      source-serif # Source Code Pro
      source-han-sans
      source-han-serif

      # monospace fonts
      jetbrains-mono

      # nerdfonts
      (nerdfonts.override {fonts = [
        "NerdFontsSymbolsOnly"
        "JetBrainsMono"
      ];})
    ];

    # causes more issues than it solves
    enableDefaultPackages = false;

    fontDir.enable = true;

    # user defined fonts
    # the reason there's Noto Color Emoji everywhere is to override DejaVu's
    # B&W emojis that would sometimes show instead of some Color emojis
    fontconfig.defaultFonts = {
        serif = ["Noto Sans CJK SC" "Noto Sans CJK TC" "Noto Color Emoji"];
        sansSerif = ["Noto Sans CJK SC" "Noto Sans CJK TC" "Noto Color Emoji"];
        monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji"];
        emoji = ["Noto Color Emoji"];
      };
  };
}
