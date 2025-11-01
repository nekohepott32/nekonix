
{pkgs, inputs, ...}:
{
  boot = {
	kernelPackages = pkgs.linuxPackages_cachyos;
  	kernelModules = [
  	  "ntsync"
  	  "v4l2loopback"
  	];
  	loader = {
		limine = {
	  		enable = true;
	  		efiSupport = true;
	  		enrollConfig = true;
	  		style.wallpapers = [ "/home/neko32/nix/modules/wallpaper.png" ];
	  		enableEditor = true;
		};
		efi = {
			canTouchEfiVariables = true;
			efiSysMountPoint = "/boot";
		};
		timeout = 1;
  	};
  };
}
