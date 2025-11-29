{
  imports = [
    # system stuff
    ./system-stuff/bootloader.nix
    ./system-stuff/sound.nix
    ./system-stuff/env.nix
    ./system-stuff/user.nix
    ./system-stuff/xserver.nix
    ./system-stuff/nm.nix
    ./system-stuff/virtualization.nix
    ./system-stuff/nvidia.nix
    ./system-stuff/mount.nix

    # programs
    ./programs/flatpak.nix
    ./programs/steam.nix
    ./programs/gamemode.nix
    ./programs/obs-studio.nix
    ./programs/nix-ld.nix
	./programs/firefox.nix
	./programs/nix-helper.nix
	./programs/catppuccin.nix
	./programs/waydroid.nix
	./programs/sudo-rs.nix
	./programs/ios.nix

	# de stuff
	#./de-wm/plasma.nix
	./de-wm/niri.nix
	./de-wm/ly.nix

  ];
}
