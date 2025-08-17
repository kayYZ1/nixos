{ pkgs, ...}:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # Monitor configuration - 1920x1080@60Hz with no scaling
      monitor = "eDP-1,1920x1080@60,0x0,1";
      exec-once = [
        "waybar"
        "${pkgs.swaybg}/bin/swaybg -i /home/kacper/Downloads/wp.png -m fill"
      ];
      # Input configuration
      input = {
        kb_layout = "pl";  # Polish keyboard layout
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";

        follow_mouse = 1;
        sensitivity = 0;

        touchpad = {
          natural_scroll = false;
        };
      };

      general = {
        gaps_in = 2;
        gaps_out = 4;
        border_size = 0;
        layout = "dwindle";
        allow_tearing = false;
      };

      # Decoration
      decoration = {
        rounding = 5;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
      };

      # Animations
      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      # Layout
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      "$mainMod" = "ALT";

      bind = [
        "$mainMod, Q, exec, ghostty"
        "$mainMod, C, killactive"
        "$mainMod, M, exit"
        "$mainMod, D, exec, rofi -show drun"
        "$mainMod, V, togglefloating"
        "$mainMod, B, exec, brave"

        # Focus
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"

        # Move to workspace
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
      ];

      # Mouse bindings
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
