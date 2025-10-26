{ pkgs, ... }:
{
  services.usbmuxd.enable = true;

  services.udev.enable = true;

  environment.systemPackages = with pkgs; [
    libimobiledevice
    ifuse # optional, to mount using 'ifuse'
  ];
}
