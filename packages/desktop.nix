{ config, pkgs, ... }:

{
	services.xserver.enable = true;
	services.displayManager.gdm.enable = true;
	services.displayManager.gdm.wayland = true;
	
	services.xserver.videoDrivers = [ "amdgpu" ];
	hardware.graphics = {
		enable = true;
		extraPackages = with pkgs; [
			amdvlk
		];
	};

	programs.hyprland.enable = true;
	programs.hyprland.xwayland.enable = true;

	xdg.portal.enable = true;
	xdg.portal.extraPortals = with pkgs; [
		xdg-desktop-portal-hyprland
	];

	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		jack.enable = true;
	};

	environment.systemPackages = with pkgs; [
		waybar
		wofi
		mako
		grim
		slurp
		wl-clipboard

		nautilus

		pavucontrol
		brightnessctl
	];

	security.polkit.enable = true;

	users.users.kacper.extraGroups = [ "audio" "video" "input" ];
}
