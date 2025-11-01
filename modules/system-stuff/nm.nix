{
  networking.firewall.allowedTCPPorts = [ 25565 3389 ];
  networking.firewall.checkReversePath = false;

  networking.networkmanager = {
  	enable = true;
  	dns = "dnsmasq";
  };
}
