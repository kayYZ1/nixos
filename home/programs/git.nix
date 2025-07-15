{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "kayYZ1";
    userEmail = "overek7133@gmail.com";

    aliases = {
      co = "checkout";
      br = "branch";
      ci = "commit";
      st = "status";
    };

    extraConfig = {
      init.defaultBranch = "main";
      credential.helper = "store";
    };
  };
}
