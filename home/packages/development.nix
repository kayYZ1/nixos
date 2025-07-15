{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nixpkgs-fmt
    nixd
    alejandra
    statix
    deadnix
  ];
}
