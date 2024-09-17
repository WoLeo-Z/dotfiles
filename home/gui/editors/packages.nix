{pkgs, ...}: {
  nixpkgs.config = {
    programs.npm.npmrc = ''
      prefix = ''${HOME}/.npm-global
    '';
  };

  home.packages = with pkgs; [
    vscode
    #-- c/c++
    cmake
    # cmake-language-server
    # gnumake
    # checkmake
    # c/c++ compiler, required by nvim-treesitter!
    gcc
    # c/c++ tools with clang-tools, the unwrapped version won't
    # add alias like `cc` and `c++`, so that it won't conflict with gcc
    # llvmPackages.clang-unwrapped
    # clang-tools
    # lldb

    #-- nix
    nil
    # rnix-lsp
    # nixd
    statix # Lints and suggestions for the nix programming language
    deadnix # Find and remove unused code in .nix source files
    alejandra # Nix Code Formatter

    #-- Optional Requirements:
    gdu # disk usage analyzer, required by AstroNvim
    (ripgrep.override {withPCRE2 = true;}) # recursively searches directories for a regex pattern
  ];
}
