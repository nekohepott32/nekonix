{
  networking.firewall.allowedTCPPorts = [ 25565 3389 ];

  networking.networkmanager = {
  	enable = true;
  	dns = "dnsmasq";
  };
}
