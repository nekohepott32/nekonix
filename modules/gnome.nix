{pkgs, ...}:
{
	services.desktopManager.gnome.enable = true;
	services.displayManager.gdm.enable = true;
	services.gnome.core-apps.enable = true;
	#services.gnome.core-developer-tools.enable = true;
	services.gnome.games.enable = false;
	environment.gnome.excludePackages = with pkgs; [ gnome-tour gnome-user-docs ];
	environment.systemPackages = with pkgs; [
	  gnomeExtensions.blur-my-shell
	  gnomeExtensions.just-perfection
	  gnomeExtensions.arc-menu
	  #gnomeExtensions.dash-to-dock
	  gnomeExtensions.appindicator
	  gnomeExtensions.dash-to-panel
	  gnomeExtensions.vitals
	  gnomeExtensions.clipboard-history
	  gnome-tweaks
	  #kdePackages.systemsettings
	];

}
