# TODO: DoomEmacs
# ==============================================
# Based on doomemacs's auther's config:
#   https://github.com/hlissner/dotfiles/blob/master/modules/editors/emacs.nix
#
# Emacs Tutorials:
#  1. Official: <https://www.gnu.org/software/emacs/tour/index.html>
#  2. Doom Emacs: <https://github.com/doomemacs/doomemacs/blob/master/docs/index.org>
#
{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
with lib; let
  emacsPkg = myEmacsPackagesFor pkgs.emacs29-pgtk;
  cfg = config.modules.editors.emacs;
  envExtra = ''
    export PATH="${config.xdg.configHome}/emacs/bin:$PATH"
  '';
  shellAliases = {
    e = "emacsclient --create-frame"; # gui
    et = "emacsclient --create-frame --tty"; # termimal
  };
  librime-dir = "${config.xdg.dataHome}/emacs/librime";
  parinfer-rust-lib-dir = "${config.xdg.dataHome}/emacs/parinfer-rust";
  myEmacsPackagesFor = emacs: ((pkgs.emacsPackagesFor emacs).emacsWithPackages (epkgs: [
    epkgs.vterm
  ]));
in {
  home.packages = with pkgs; [
    emacsPkg

    ## Doom dependencies
    git
    (ripgrep.override {withPCRE2 = true;})
    gnutls # for TLS connectivity

    ## Optional dependencies
    fd # faster projectile indexing
    imagemagick # for image-dired
    zstd # for undo-fu-session/undo-tree compression

    # go-mode
    # gocode # project archived, use gopls instead

    ## Module dependencies
    # :checkers spell
    (aspellWithDicts (ds: with ds; [en en-computers en-science]))
    # :tools editorconfig
    editorconfig-core-c # per-project style config
    # :tools lookup & :lang org +roam
    sqlite
    # :lang latex & :lang org (latex previews)
    # texlive.combined.scheme-medium
  ];

  services.emacs = {
    enable = true;
    package = emacsPkg;
    client = {
      enable = true;
      arguments = [" --create-frame"];
    };
    startWithUserSession = true;
  };

  programs.bash.bashrcExtra = envExtra;
  programs.zsh.envExtra = envExtra;
  home.shellAliases = shellAliases;
  programs.nushell.shellAliases = shellAliases;

  xdg.configFile."doom" = {
    source = ./doom;
    force = true;
  };

  home.activation.installDoomEmacs = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${inputs.doomemacs}/ ${config.xdg.configHome}/emacs/

    # librime for emacs-rime
    mkdir -p ${librime-dir}
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${pkgs.librime}/ ${librime-dir}/

    # libparinfer_rust for emacs' parinfer-rust-mode
    mkdir -p ${parinfer-rust-lib-dir}
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744  ${pkgs.vimPlugins.parinfer-rust}/lib/libparinfer_rust.* ${parinfer-rust-lib-dir}/parinfer-rust.so
  '';
}
