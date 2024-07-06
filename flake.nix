{
  description = "rafaribe's Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko.url = "github:nix-community/disko";
    stylix.url = "github:danth/stylix";
    ags.url = "github:Aylur/ags";
    matugen.url = "github:InioX/matugen";
    font-flake.url = "github:redyf/font-flake";
    # waybar-hyprland.url = "github:hyprwm/hyprland";
    # Neve.url = "github:redyf/Neve";
    nur.url = "github:nix-community/NUR";

    # git+ssh://git@git.example.com/User/repo.git if you're using private repos
    # berkeley = {
    #   url = "git+ssh://git@github.com/redyf/berkeley.git";
    #   flake = false;
    # };

    # monolisa-script = {
    #   url = "git+ssh://git@github.com/redyf/test2.git";
    #   flake = false;
    # };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    disko,
    stylix,
    font-flake,
    ...
  } @ inputs: let
    supportedSystems = ["x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin"];

    # Helper function to generate an attrset '{ x86_64-linux = f "x86_64-linux"; ... }'.
    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

    # Nixpkgs instantiated for supported system types.
    nixpkgsFor = forAllSystems (system: import nixpkgs {inherit system;});
  in {
    nixosConfigurations = {
      rafaribe =
        nixpkgs.lib.nixosSystem
        {
          system = "x86_64-linux";
          specialArgs = {
            inherit
              inputs
             # disko
              ;
          };
          modules = [
            ./hosts/rafaribe/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useUserPackages = true;
                useGlobalPkgs = false;
             #   extraSpecialArgs = {inherit inputs disko;};
                users.rafaribe = ./home/home.nix;
                backupFileExtension = "backup";
              };
            }
            stylix.nixosModules.stylix
            disko.nixosModules.disko
          ];
        };
    };
    devShells = forAllSystems (system: let
      pkgs = nixpkgsFor.${system};
    in {
      default = pkgs.mkShell {
        buildInputs = with pkgs; [
          git
          alejandra
          statix
        ];
      };
    });
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
  };
}
