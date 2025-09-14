{ pkgs, ... }:
{
	services = {
	  desktopManager.plasma6.enable = false;
	
	  displayManager.sddm = {
	  	enable = true;
	  	theme = "catppuccin-mocha";
	  	wayland = {
	  		enable = true;
	  	};
	  };
	
	};
	
	environment.systemPackages = with pkgs;
	  [
	    kdePackages.kolourpaint
	    kdePackages.sddm-kcm # Configuration module for SDDM
	    kdiff3 
	    pkgs.kdePackages.qtbase
	    pkgs.kdePackages.qtwayland
	    pkgs.kdePackages.qtmultimedia
	    kdePackages.partitionmanager
	    haruna
	    wayland-utils
	    wl-clipboard
	    (catppuccin-sddm.override {
	                flavor = "mocha";
	                font  = "Noto Sans";
	                fontSize = "9";
	                background = "${./wallpaper.png}";
	                loginBackground = true;
	              })
	  ];
}
