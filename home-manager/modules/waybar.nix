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
        "custom/spacer"
        "cava"
        "custom/spacer"
        "mpris"
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
        "hyprland/language"
        "custom/spacer"
        #"custom/mako"
        #"custom/spacer"
        "clock"
      ];

      # Modules
      "custom/spacer" = {
        tooltip = false;
        format = "|";
      };

      "pulseaudio" = {
        format = "{volume}% {icon}";
        format-muted = "󰖁";
        scroll-step = 5;
        on-click = "pavucontrol";
        format-icons = {
          default = ["󰕾"];
        };
      };
      
      "hyprland/language" = {
      	format = "{}";
      	format-uk = "ua";
      	format-en = "us";
      	format-ru = "ru";
      };

      "cava" = {
      	format = "{icon}"; # важно!
      	format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
      	
      	framerate = 180;
      	autosens = 1;
        #sensitivity = 100;
      	        bars = 20;
      	        #lower_cutoff_freq = 50;
      	        #higher_cutoff_freq = 10000;
      	        hide_on_silence = false;
      	        method = "pulse";
      	        source = "auto";
      	        stereo = true;
      	        #reverse = false;
      	        bar_delimiter = 0;
      	        #monstercat = false;
      	        waves = false;
      	        noise_reduction = 0.77;
      	        #input_delay = 2;
      	
      	        actions = {
      	          on-click-right = "mode";
      	       };
      };

      "mpris" = {
              format = "{player_icon}  {title} - {artist}";
              format-paused = " {title} - {artist}";
              format-stopped = "";
              #ignored-players = [ "firefox" "chromium" ];
              max-length = 40;          # максимум символов
              ellipsize  = "middle"; 
              player-icons = {
                spotify = "";
                mpv = "";
                default = "";
              };
            };

       "hyprland/window" = {
       	#format = "{icon}";
       	icon = true;
       	max-length = 40;
       	icon-size = 20;
       	#separate-outputs = true;
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
          "8" = "八";
          "9" = "九";
        };
        persistent-workspaces."*" = 9; 
      };

      # Base modules
      "clock" = {
        interval = 1;
        format = "{:%d/%m/%y %H:%M:%S}";
      };

      # Hardware
      "cpu" = {
        interval = 1;
        format = "{usage}%  ";
      };

      "memory" = {
        interval = 10;
        format = "{percentage}%  ";
      };

      #"custom/mako" = {
      	#on-click = "~/.config/hypr/mako.sh";
      	#format = "DND {icon}";
      	#format-icons = {
      	#	activated = " ";
      	#	deactivated = " ";
      	#};
      	#tooltip = true;
      	#tooltip-format = "Toggle DND on/off";
      #};

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
