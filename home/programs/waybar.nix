{ config, pkgs, ... }:

let
  catppuccinFlavor = "macchiato";
in {
  # New Catppuccin module structure
  catppuccin = {
    enable = true;
    flavor = catppuccinFlavor;
    waybar.enable = true;
  };

  programs.waybar = {
    enable = true;
    settings = [{
      layer = "top";
      position = "top";
      "modules-left" = [ "hyprland/workspaces" ];
      "modules-center" = [ "clock" ];
      "modules-right" = [ "pulseaudio" "battery" "cpu" "network" ];

      "hyprland/workspaces" = {
        format = "{name}";
        on-click = "activate";
        all-outputs = true;
        active-only = false;
      };

      network = {
        interface = "wlp2s0";
        format = "🌐 {essid} {ipaddr}";
        format-disconnected = "🌐 Disconnected";
        tooltip-format = "{ifname}: {ipaddr}";
      };

      cpu = {
        format = "CPU: {usage}%";
        tooltip = true;
      };

      battery = {
        format = "🔋 {capacity}%";
        format-charging = "🔌 {capacity}%";
        format-plugged = "⚡ {capacity}%";
        states = {
          warning = 20;
          critical = 10;
        };
        tooltip-format = "{timeTo}";
      };

      pulseaudio = {
        format = "🔊 {volume}%";
        format-muted = "🔇 Muted";
        tooltip = true;
        scroll-step = 5;
      };

      clock = {
        format = "🕒 {:%H:%M %d/%m/%Y}";
        tooltip-format = "{:%A, %B %d, %Y}";
      };
    }];

    style = ''
      window#waybar {
        background-color: @base;
        border-bottom: 1px solid @surface0;
        border-radius: 0;
        font-family: "JetBrains Mono", monospace;
        font-size: 14px;
        padding: 0 10px;
      }

      * {
        color: @text;
        font-weight: 500;
      }

      /* Workspaces styling */
      #workspaces {
        margin: 0 10px;
        padding: 0;
        background-color: transparent;
      }

      #workspaces button {
        min-width: 18px;
        min-height: 18px;
        border-radius: 50%;
        margin: 0 4px;
        background-color: transparent;
        border: 2px solid @surface1;
        transition: all 0.3s ease;
      }

      #workspaces button:hover {
        background-color: @surface1;
        border-color: @lavender;
      }

      #workspaces button.active {
        background-color: @lavender;
        border-color: @lavender;
      }

      #workspaces button.urgent {
        background-color: @red;
        border-color: @red;
      }

      /* Center module (clock) */
      #clock {
        background-color: @surface0;
        border-radius: 8px;
        padding: 0 15px;
        margin: 0 10px;
        font-weight: 600;
      }

      /* Right modules */
      #pulseaudio, #network, #cpu, #battery {
        background-color: @surface0;
        border-radius: 8px;
        padding: 0 12px;
        margin: 0 2px;
        transition: all 0.3s ease;
      }

      #pulseaudio:hover, #network:hover, #cpu:hover, #battery:hover {
        background-color: @surface1;
        color: @lavender;
      }

      #pulseaudio.muted {
        background-color: @surface2;
        color: @subtext0;
      }

      /* Battery states */
      #battery.warning {
        background-color: @yellow;
        color: @base;
      }

      #battery.critical {
        background-color: @red;
        color: @base;
      }

      /* Network states */
      #network.disconnected {
        background-color: @surface2;
        color: @subtext0;
      }

      /* CPU high usage */
      #cpu.high {
        background-color: @peach;
        color: @base;
      }
    '';
  };
}
