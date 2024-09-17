{self, ...}: {
  nixpkgs = {
    overlays = [
      (final: prev: {
        lib =
          prev.lib
          // {
            colors = import "${self}/lib/colors" prev.lib;
          };
      })
    ];
  };
}
