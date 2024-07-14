{
  pkgs,
  lib,
  inputs,
  config,
  ...
}: {
  environment.systemPackages = with pkgs; [nh nix-search-cli alejandra nil];

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    nixPath = "/etc/nixPath";
  in {
    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Opinionated: disable global registry
      flake-registry = "";
      # Workaround for https://github.com/NixOS/nix/issues/9574
    };
    # Opinionated: disable channels
    channel.enable = false;
    nixPath = ["nixpkgs=${nixPath}"];
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/rafaribe/nix-config";
  };
  services.envfs.enable = true;
}
