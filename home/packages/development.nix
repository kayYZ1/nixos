{ pkgs, ... }:

{
  home.packages = with pkgs; [
    clang
    clang-tools
    gdb
    cmake
    ninja

    nixpkgs-fmt
    nixd
    alejandra
    statix
    deadnix

    deno
    bun
    # Just for LSP
    nodePackages.typescript-language-server
    nodePackages.typescript
    biome
  ];
}
