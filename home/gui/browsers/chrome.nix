{pkgs, ...}: {
  programs.google-chrome = {
    enable = true;

    # https://wiki.archlinux.org/title/Chromium#Native_Wayland_support
    commandLineArgs = [
      "--password-store=gnome-libsecret"
      "--ozone-platform-hint=auto"
      "--ozone-platform=wayland"
      # make it use GTK_IM_MODULE if it runs with Gtk4, so fcitx5 can work with it.
      # (only supported by chromium/chrome at this time, not electron)
      "--gtk-version=4"
      # make it use text-input-v1, which works for kwin 5.27 and weston
      "--enable-wayland-ime"

      # enable hardware acceleration - vulkan api
      "--enable-features=Vulkan"

      "--enable-features=TouchpadOverscrollHistoryNavigation"
      "--ignore-gpu-blocklist"
    ];
  };
}
