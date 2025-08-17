{ pkgs, ... }:

{
	home.packages = with pkgs; [
		brave
		zed-editor
		obsidian
		rofi
		hyprpaper
		tmux
		swaybg
	];
}
