{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    gcc
    gdb
    cmake
    ninja
    clang
    clang-tools
    cppcheck
    valgrind

    nodejs_latest
    bun
    deno
    typescript
    nodePackages.typescript-language-server
    nodePackages.prettier
    nodePackages.eslint

    nixpkgs-fmt
    nixd
    alejandra
    statix
    deadnix
  ];
}
