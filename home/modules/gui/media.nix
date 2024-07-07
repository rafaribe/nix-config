  {
  lib,
  pkgs,
  osConfig,
  ...
}:
{
  config = lib.mkIf osConfig.garden.programs.gui.enable {
    home.packages = with pkgs; [
      vlc
    ];
  };
}