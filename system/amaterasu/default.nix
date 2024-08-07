# amaterasu is my desktop PC
{
  inputs,
  lib,
  ...
}: {
  imports = [
    ./hardware.nix
    ./kde.nix
    inputs.nixos-hardware.nixosModules.common-cpu-amd-pstate
    inputs.nixos-hardware.nixosModules.common-pc-ssd
    inputs.nixos-hardware.nixosModules.common-gpu-amd
    ../modules
  ];

  # Open ports in the firewall.
  programs.mosh.enable = true;

  networking = {
    hostName = "amaterasu";
    firewall.allowedTCPPorts = [
      80
      443
      11434 # ollama
    ];
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
