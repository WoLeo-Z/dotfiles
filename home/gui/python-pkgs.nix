{
  pkgs,
  pkgs-unstable,
  ...
}: {
  home.packages = with pkgs; [
    (python311.withPackages (p:
      with p; [
        requests
        urllib3
      ]))
  ];
}
