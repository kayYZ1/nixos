{ pkgs, ... }:

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
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    optimise = {
      automatic = true;
      dates = [ "06:09" ];
    };
  };
  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nix-pc";
  networking.networkmanager.enable = true;
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 ];
  };
  
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

  environment.systemPackages = with pkgs; [
    vim
    git
    rsync
  ];

  powerManagement.enable = true;
  services.tlp.enable = true;

  system.autoUpgrade = {
    enable = true;
    dates = "daily";
    allowReboot = false;
  };

  system.stateVersion = "25.05"; # Did you read the comment?
}
