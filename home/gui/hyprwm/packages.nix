{
  pkgs,
  pkgs-unstable,
  ...
}: {
  home.packages = with pkgs; [
    /*
    # waybar # the status bar
    # swaybg # the wallpaper
    hyprpaper
    # swayidle # the idle timeout
    hypridle
    # swaylock # locking the screen
    hyprlock
    wlogout # logout menu
    wl-clipboard # copying and pasting
    hyprpicker # color picker

    hyprshot # screen shot
    grim # taking screenshots
    slurp # selecting a region to screenshot
    wf-recorder # screen recording

    mako # the notification daemon, the same as dunst

    yad # a fork of zenity, for creating dialogs

    # audio
    alsa-utils # provides amixer/alsamixer/...
    mpd # for playing system sounds
    mpc-cli # command-line mpd client
    ncmpcpp # a mpd client with a UI
    networkmanagerapplet # provide GUI app: nm-connection-editor
    */

    # python
    (python311.withPackages (p:
      with p; [
        # pymyc
        pkgs-unstable.python311Packages.materialyoucolor
        libsass
        material-color-utilities

        # python
        build
        pillow
        pywal
        setuptools-scm
        wheel

        # widgets
        pywayland
        psutil

        setproctitle # deps of "Keep system awake"

        requests
        urllib3
      ]))

    # others
    hyprpaper # instead of swww

    # ags
    gnome.gnome-bluetooth
    libdbusmenu
    libnotify
    networkmanager
    power-profiles-daemon
    upower

    # audio
    pavucontrol
    wireplumber
    # libdbusmenu-gtk3
    playerctl
    # swww

    # backlight
    brightnessctl
    ddcutil

    # basic
    axel
    bc
    coreutils
    cliphist
    cmake
    curl
    fuzzel
    rsync
    wget
    ripgrep
    jq
    nodePackages.npm
    meson
    typescript
    gjs
    xdg-user-dirs

    # bibata-modern-classic

    # fonts-themes
    adw-gtk3
    qt5ct
    # libsForQt5.qt5.qtwayland
    fontconfig
    # ttf-readex-pro
    jetbrains-mono
    material-symbols
    # ttf-space-mono-nerd
    rubik
    # ttf-gabarito-git
    fish
    foot
    starship

    # gnome
    # polkit_gnome # use lxqt.lxqt-policykit instead
    gnome.gnome-keyring
    gnome.gnome-control-center
    blueberry
    networkmanager
    gammastep
    gnome.gnome-bluetooth

    # gtk
    webp-pixbuf-loader
    gtk-layer-shell
    gtk3
    gtksourceview
    gobject-introspection
    upower
    yad
    ydotool
    xdg-user-dirs

    # microtex-git
    tinyxml-2
    gtkmm3
    gtksourceviewmm
    cairomm

    # oneui4-icons

    # portal
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland

    # pymyc
    gradience

    # python

    # screencapture
    swappy
    wf-recorder
    grim
    # tesseract
    # tesseract-data-eng
    slurp

    # widgets
    dart-sass
    hypridle
    hyprutils
    hyprlock
    wlogout
    wl-clipboard
    hyprpicker
  ];
}
