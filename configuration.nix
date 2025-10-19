{ config, lib, pkgs, inputs, ... }:
{
  imports =
    [ 
      ./hardware-configuration.nix
      ./packages.nix
      ./modules/bundle.nix
    ];

  networking.hostName = "nekonix"; 

  boot.kernelPackages = pkgs.linuxPackages_cachyos;

  nixowos.enable = false; # very important!!!11!!!1!

  security.sudo-rs.enable = true;

  services.usbmuxd.enable = true;

  services.udev.enable = true;

  networking.firewall.allowedTCPPorts = [ 25565 3389 ];
  
  environment.systemPackages = with pkgs; [
    libimobiledevice
    ifuse # optional, to mount using 'ifuse'
  ];

  #security.wrappers.spice-client-glib-usb-acl-helper.source = "${pkgs.spice_gtk}/bin/spice-client-glib-usb-acl-helper";
  
  time.timeZone = "Europe/Kyiv";

  i18n.defaultLocale = "ru_UA.UTF-8";
  console = {
    font = "cyr-sun16";
    useXkbConfig = true;
  };

  #nixpkgs.overlays = [
    #inputs.millennium.overlays.default
  #];

  programs.appimage.enable = true;
  programs.appimage.binfmt = true;
      
  nix.settings = {
  	experimental-features = [ "nix-command" "flakes" ];
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };
	
  system.stateVersion = "25.05";

}
