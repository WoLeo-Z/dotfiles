# Front-end Development
{
  pkgs,
  pkgs-unstable,
  ...
}: {
  home.packages = with pkgs; [
    nodejs
    nodePackages.npm
    nodePackages.yarn

    # my blog
    hexo-cli
    pkgs-unstable.nodePackages.gulp # v5.0.0 needed
  ];
}
