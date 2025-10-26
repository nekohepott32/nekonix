{ pkgs, inputs, ... }:
{

  imports = [
    ./modules/bundle.nix
    inputs.spicetify-nix.homeManagerModules.default
    inputs.stylix.homeModules.stylix
    inputs.nixowos.homeModules.default
    inputs.zen-browser.homeModules.beta
    inputs.catppuccin.homeModules.catppuccin
  ];

  home = {
    username = "neko32";
    homeDirectory = "/home/neko32";
    stateVersion = "25.05";

    #packages = with inputs.nix-alien.packages.${systemSettings.system}; [ nix-alien ];

  };


  programs.spicetify =
  let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in
  {
    enable = true;
  
    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
    ];
    enabledCustomApps = with spicePkgs.apps; [
      newReleases
    ];
    enabledSnippets = with spicePkgs.snippets; [
    ];
  
    #theme = spicePkgs.themes.catppuccin;
    #colorScheme = "mocha";
  };

  stylix = {
      enable = true;
      #autoEnable = true;
      #image = ../nokowall.png;
      polarity = "dark";
      base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
      targets = {
      	#kvantum.enable = true;
      	qt.enable = false;
      	vesktop.enable = true;
      	zen-browser.profileNames = [ "neko32" ];
      };
    };

  programs.zen-browser.enable = true;

  
}
