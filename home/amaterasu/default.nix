# desktop PC home config
{...}: {
  imports = [
    ../common.nix
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
