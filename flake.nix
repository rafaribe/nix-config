{
  description = "rafaribes's NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixpkgs-mongodb-pin.url = "github:NixOS/nixpkgs/e913ae340076bbb73d9f4d3d065c2bca7caafb16";

    nixos-hardware.url = "github:NixOS/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    lan-mouse.url = "github:feschber/lan-mouse";
  };

  outputs = {
    self,
    nixpkgs,
    nixos-hardware,
    home-manager,
    ...
  } @ inputs: let
    inherit (self) outputs;
    inherit (nixpkgs.lib) nixosSystem;
    specialArgs = {inherit inputs outputs;};
  in {
    nixosConfigurations = {
      amaterasu = nixosSystem {
        specialArgs = specialArgs;
        modules = [
          home-manager.nixosModules.home-manager
          {
            home-manager.users.rafaribe = import ./home/amaterasu;
            home-manager.extraSpecialArgs = specialArgs;
          }
          ./system/amaterasu
        ];
      };
    };
  };
}
