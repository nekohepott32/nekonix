{ config, lib, pkgs, inputs, ... }:
{
  imports =
    [ 
      ./hardware-configuration.nix
      ./packages.nix
      ./modules/bundle.nix
      ./cachix.nix
    ];

  networking.hostName = "nekonix"; 
  
  time.timeZone = "Europe/Kyiv";

  i18n.defaultLocale = "ru_UA.UTF-8";
  console = {
    font = "cyr-sun16";
    useXkbConfig = true;
  };

  nix.settings = {
  	#max-jobs = 4;
  	experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ "root" "neko32" ];
  };
	
  system.stateVersion = "25.05";

}
