{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware/hardware-configuration.nix
      ./packages/system.nix
      ./packages/networking.nix
      ./packages/desktop.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [ "nix-command" "flakes"];
  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Warsaw";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

  console.keyMap = "pl2";

  users.users.kacper = {
    isNormalUser = true;
    description = "kacper";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  services.getty.autologinUser = "kacper";

  environment.systemPackages = with pkgs; [
    vim
    git
  ];

  system.stateVersion = "25.05"; # Did you read the comment?
}
