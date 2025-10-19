{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    catppuccin.url = "github:catppuccin/nix";
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    aagl.inputs.nixpkgs.follows = "nixpkgs";
    #millennium.url = "git+https://github.com/SteamClientHomebrew/Millennium";
    #hyprland.url = "github:hyprwm/Hyprland";

    winboat = {
      url = "github:TibixDev/winboat";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixowos = {
      url = "github:yunfachi/nixowos";
   };


    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake"; #de77ec882dce3dd60e9e5431d375e64fd58bdc74
      # IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
      # to have it up-to-date or simply don't specify the nixpkgs input
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, stylix, chaotic, nixowos, aagl, catppuccin, ... }@inputs:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations.nekonix = nixpkgs.lib.nixosSystem {
        specialArgs = {
          pkgs-stable = import nixpkgs-stable {
            inherit system;
          };
          inherit inputs system;
        };

        modules = [
          ./configuration.nix

          nixowos.nixosModules.default

          stylix.nixosModules.stylix

          chaotic.nixosModules.default

          aagl.nixosModules.default

          catppuccin.nixosModules.catppuccin
          
          home-manager.nixosModules.home-manager

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.neko32 = import ./home-manager/home.nix {
              inherit inputs;
              pkgs = nixpkgs.legacyPackages.${system};
            };
          }
          {
          programs.anime-game-launcher.enable = true;
          programs.honkers-railway-launcher.enable = true;
          programs.sleepy-launcher.enable = true;
          }
        ];
      };
   };
}
