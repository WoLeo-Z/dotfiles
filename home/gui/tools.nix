{pkgs, ...}: {
  home.packages = with pkgs; [
    android-tools

    ventoy # create bootable usb
    virt-viewer # vnc connect to VM

    # screen capture
    # flameshot

    # remote desktop(rdp connect)
    # remmina
    # freerdp # required by remmina

    # video/audio tools
    libva-utils
    vdpauinfo
    vulkan-tools
    glxinfo

    # creative
    # blender # 3d modeling

    motrix # download manager

    termius # SSH client
  ];

  programs = {
    #
  };
}
