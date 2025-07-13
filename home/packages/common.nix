{ config, pkgs, ... }:

{
	home.packages = with pkgs; [
		brave
		zed-editor
	];
}
