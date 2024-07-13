{
  pkgs,
  osConfig,
  ...
}: {
  home.packages = with pkgs; [
    vlc
    nzbget
    sabnzbd
  ];
}
