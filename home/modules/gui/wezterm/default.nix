{
  lib,
  config,
  inputs',
  osConfig,
  ...
}:{
  programs.wezterm = {
    enable = true;
  };

  xdg.configFile = let
    symlink = fileName: {recursive ? false}: {
      source = config.lib.file.mkOutOfStoreSymlink "/home/rafaribe/code/rafaribe/nix-config/${fileName}";
      inherit recursive;
    };
  in {
    # https://github.com/nix-community/home-manager/issues/1807#issuecomment-1740960646
    "wezterm/wezterm.lua".enable = false;
    "wezterm" = symlink "home/modules/gui/wezterm" {recursive = true;};
  };
}
