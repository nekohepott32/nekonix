{ pkgs-stable, ... }: {

  networking.firewall.trustedInterfaces = [ "virbr0" "virbr1" ];

  virtualisation.spiceUSBRedirection.enable = true;

  virtualisation.libvirtd = {
  	enable = true;
  	#firewallBackend = "iptables";
  };
  programs.virt-manager = {
    enable = true;
  };
}
