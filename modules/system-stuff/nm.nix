{
  networking.firewall.allowedTCPPorts = [ 25565 3389 6120 ];
  networking.firewall.checkReversePath = false;

  networking.networkmanager = {
  	enable = true;
  	dns = "dnsmasq";
  };
}
