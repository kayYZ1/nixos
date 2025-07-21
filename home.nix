{
  imports = [
	./home/packages/common.nix
	./home/packages/development.nix
	./home/programs/hyprland.nix
	./home/programs/waybar.nix
	./home/programs/git.nix
	./home/programs/nu.nix
	./home/programs/nvim.nix
	./home/programs/helix.nix
  ];

  home.username = "kacper";
  home.homeDirectory = "/home/kacper";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
}
