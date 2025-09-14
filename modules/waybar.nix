{ pkgs, ... }: {
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = [{
      # Base
      layer = "top";
      position = "top";
      height = 28;
      spacing = 10;
      ipc = true;

      # Placement
      modules-left = [
        "hyprland/workspaces"
      ];
      modules-center = [
        "hyprland/window"
      ];
      modules-right = [
        "pulseaudio"
        "custom/spacer"
        "memory"
        "custom/spacer"
        "cpu"
        "custom/spacer"
 "tray"
        "custom/spacer"
        "clock"
      ];

      # Modules
      "custom/spacer" = {
        tooltip = false;
        format = "|";
      };

      "pulseaudio" = {
        format = "{volume}% {icon} ";
        format-bluetooth = "{volume}% {icon} ";
        format-muted = "";
        scroll-step = 1;
        on-click = "pavucontrol";
        format-icons = {
          headphone = "";
          hands-free = "";
          headset = "";
          phone = "";
          phone-muted = "";
          portable = "";
          car = "";
          default = [ "" "" ];
        };
      };

      # Hyprland modules
      "hyprland/workspaces" = {
        format = "{icon}";
        format-icons = {
          "1" = "一";
   "2" = "二";
   "3" = "三";
   "4" = "四";
          "5" = "五";
   "6" = "六";
          "7" = "七";
        };
        persistent-workspaces."*" = 7; 
      };

      # Base modules
      "clock" = {
        interval = 60;
        format = "{:%d/%m/%y %H:%M}";
      };

      # Hardware
      "cpu" = {
        interval = 10;
        format = "{usage}%  ";
      };

      "memory" = {
        interval = 30;
        format = "{percentage}%  ";
      };

    }];

    style = ''
      /* Bar itself */
      window#waybar {
        background: @base00;
        border-bottom: 2px solid @base03;
      }

      /* Text colors */
      #window,
      #language,
      #cpu,
      #memory,
      #custom-notification,
      #pulseaudio,
      #custom-spacer,
      #clock {
        color: @base05;
      }

      /* Apply margin to first and last module */
      #workspaces {
        margin-left: 20px;
      }
      #clock {
        margin-right: 20px;
      }

      /* Spacer */
      #custom-spacer {
        margin: 0 3px 0 3px;
      }

      /* Workspaces */
      #workspaces button {
        padding: 0 7px 0 7px;
        border-radius: 0;
        color: @base05;
        min-width: 10px;
        min-height: 10px
      }

      #workspaces button:hover {
        color: @base05;
      }

      #workspaces button.empty {
        padding: 0 7px 0 7px;
        border-radius: 0;
        color: @base07;
      }

      #workspaces button.active {
        padding: 2px 7px 0 7px;
        border-bottom: 2px solid @base0A;
        color: @base05;
      }

      #workspaces button.urgent {
        padding: 2px 7px 0 7px;
        border-bottom: 2px solid @base08;
      }

      #custom-notification {
        margin-right: 0px;
      }
    '';
  };
}
