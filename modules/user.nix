{ pkgs, ... }: {
  programs.fish.enable = true;

  users = {
    defaultUserShell = pkgs.fish;

    users.neko32 = {
      isNormalUser = true;
      description = "Михаил";
      extraGroups = [ "networkmanager" "wheel" "gamemode" "input" "libvirtd" "docker" ];
      packages = with pkgs; [
      	flatpak
	micro
      ];
    };
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "neko32";
}
