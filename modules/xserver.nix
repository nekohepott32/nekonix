{
  services.xserver = {
    enable = true;
    windowManager.herbstluftwm.enable = true;

    # displayManager = {
    #   autoLogin.enable = true;
    #   autoLogin.user = "amper";
    #   lightdm.enable = true;
    # };

    xkb.layout = "us";
    xkb.variant = "";


    videoDrivers = [ "nvidia" ];
    deviceSection = ''Option "TearFree" "True"'';
    #displayManager.gdm.enable = true;
    #desktopManager.gnome.enable = true;
  };
  services.libinput = {
    enable = true;
    mouse.accelProfile = "flat";
  };
}
