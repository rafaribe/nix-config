{...}: {
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./boot.nix
    ./coding.nix
    ./fonts.nix
    ./keyboard.nix
    ./linux.nix
    ./locale.nix
    ./network.nix
    ./nix.nix
    ./packages.nix
    ./python.nix
    ./shell.nix
    ./sound.nix
    ./users.nix
  ];

  services.dbus.enable = true;
}
