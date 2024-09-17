{self, ...} @ inputs: let
  inherit (inputs.nixpkgs) lib;
  mylib = import ../lib {inherit lib;};
  myvars = import ../vars {inherit lib;};

  specialArgs = {
    inherit self inputs mylib myvars;
    # use unstable branch for some packages to get the latest updates
    pkgs-unstable = import inputs.nixpkgs-unstable {
      # inherit system;
      system = "x86_64-linux";
      config.allowUnfree = true;
      # config.allowBroken = true;
    };
  };
in {
  nixosConfigurations = {
    swift3 = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      inherit specialArgs;
      modules = [
        "${self}/hosts/swift3"

        {
          home-manager = {
            users.wol.imports = [
              "${self}/home/home.nix"
              "${self}/home/core"
              "${self}/home/gui"
              "${self}/home/misc"
            ];
            extraSpecialArgs = specialArgs;
          };
        }
      ];
    };
  };
}
