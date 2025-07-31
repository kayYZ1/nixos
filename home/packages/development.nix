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
  ];
}
