{...}: {
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./bluetooth.nix
    ./boot.nix
    ./coding.nix
    ./fonts.nix
    ./keyboard.nix
    ./linux.nix
    ./locale.nix
    ./network.nix
    ./nfs.nix
    ./nix.nix
    ./nix-path.nix
    ./packages.nix
    ./python.nix
    ./shell.nix
    ./sound.nix
    ./users.nix
    ./vpn.nix
  ];

  services.dbus.enable = true;
}
