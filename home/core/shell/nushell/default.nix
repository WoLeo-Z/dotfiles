# Nushell
{
  pkgs,
  config,
  ...
}: let
  shellAliases = {
    # k = "kubectl";

    # urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
    # urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
  };

  d = config.xdg.dataHome;
  c = config.xdg.configHome;
  cache = config.xdg.cacheHome;
in {
  home.shellAliases = shellAliases; # only works in bash/zsh, not nushell

  home.homeDirectory = "/home/wol";

  # environment variables that always set at login
  home.sessionVariables = {
    # clean up ~
    LESSHISTFILE = cache + "/less/history";
    LESSKEY = c + "/less/lesskey";
    WINEPREFIX = d + "/wine";

    # set this variable make i3 failed to start
    # related issue:
    #   https://github.com/sddm/sddm/issues/871
    XAUTHORITY = "$XDG_RUNTIME_DIR/Xauthority";

    # set default applications
    BROWSER = "google-chrome-stable";
  };

  programs.nushell = {
    enable = true;
    package = pkgs.nushell;
    configFile.source = ./config.nu;
    inherit shellAliases;
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$HOME/.local/bin:$HOME/go/bin:$PATH"
    '';
  };
}
