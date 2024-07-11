{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    obsidian
    #               
    bitwarden-cli
  ];
}
