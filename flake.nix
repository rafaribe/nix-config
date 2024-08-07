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
    talhelper = {
      url = "github:budimanjojo/talhelper";
      #inputs.nixpkgs.follows = "nixpkgs";
    };
    # Nix User Repository: User contributed nix packages
    nur.url = "github:nix-community/NUR";

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # VSCode community extensions
    # https://github.com/nix-community/nix-vscode-extensions
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # NixVirt for qemu & libvirt
    # https://github.com/AshleyYakeley/NixVirt
    nixvirt-git = {
      url = "github:AshleyYakeley/NixVirt/v0.5.0";
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
    talhelper,
    nix-vscode-extensions,
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
            home-manager.backupFileExtension = "backup";
          }
          lix-module.nixosModules.default
          ./system/amaterasu
          #  ./system/base
        ];
      };
    };
  };
}
