{ pkgs, ... }:
{
	#services = {
	  #displayManager.sddm = {
	  	#enable = true;
	  	#theme = "catppuccin-mocha";
	  	#wayland.enable = true;
	  	#package = pkgs.kdePackages.sddm; 	
	  #};
	
	#};
	
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
	                #customBackground = true;
	                #background = "/home/neko32/nix/modules/wallpaper.png";
	                #loginBackground = true;
	              })
	  ];
}
