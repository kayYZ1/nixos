{ pkgs, ... }:

{
  home.packages = with pkgs; [
    brave
    obsidian
    rofi
    swaybg
  ];
}
