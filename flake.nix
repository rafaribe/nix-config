{
  description = "rafaribes's NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.90.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # declarative theme management
    catppuccin.url = "github:catppuccin/nix";

    # Run unpatched dynamic binaries on NixOS
    nix-ld = {
      type = "github";
      owner = "Mic92";
      repo = "nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixos-hardware,
    home-manager,
    lix-module,
    nix-ld,
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
            home-manager.backupFileExtension = "backupx";
          }
          lix-module.nixosModules.default
          ./system/amaterasu
          #  ./system/base
        ];
      };
    };
  };
}
